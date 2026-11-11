# OpenTelemetry histograms -> Datadog distributions

When OTel histograms reach Datadog via the agent's `histograms.mode = distributions` (the recommended/default mode), the data flow is:

1. **Wire format:** the SDK exports one OTLP histogram payload per export window, containing `sum`, `count`, bucket counts, and optionally exact `min`/`max`.
2. **Agent translation:** the DD agent walks the bucket counts and synthesizes N samples (where N = total count in the histogram) per bucket, via `InsertInterpolate` (datadog-agent `pkg/opentelemetry-mapping-go/otlp/metrics/default_mapper.go`, `getSketchBuckets`; not `histograms.go`, whose `CreateDDSketchFromHistogramOfDuration` is a different path that puts each bucket's count at one point; was `opentelemetry-mapping-go` before Sep 2025). Placement depends on the bucket:
    - Lowest bucket `(-Inf, b0]`: every sample at `b0` (its upper bound)
    - Overflow bucket `(bN, +Inf)`: every sample at `bN` (its lower bound)
    - Every other bucket: samples spread evenly (linear interpolation) across `(lower, upper)`, in DDSketch bins
3. **DD storage:** DDSketch over the synthesized samples - within-bucket positions are an even-spread estimate, not real values.
4. **DD UI:** "points" count = synthetic sample count = original `record()` emission count. Percentile values are estimates interpolated within a bucket, except `min`/`max` which retain exact values when the SDK populated the OTLP optional fields.

Practical consequences:
- 10 `record()` calls produce 10 visible points in DD's UI even though the wire payload was 1 aggregated histogram
- Wire-level aggregation saves bandwidth but is invisible to DD's point count
- p50/p99 are interpolated within their bucket, not exact original sample values (only the first and overflow buckets collapse to a single boundary value)
- `min`/`max` can be exact when SDK exports the OTLP optional fields
- `avg` is exact (it comes from the OTLP `sum`/`count`), so avg can sit far below every percentile
- Threshold queries like `count(v: v<=T):metric{...}.as_count()` work for count-based latency SLOs. Keep `T` on a bucket boundary: only there is the count exact; between boundaries it is an interpolated estimate. Never use the top boundary as `T`: overflow samples sit exactly on it, so `<= bN` counts every request above it as good. Use `<=`, not `<`, at the lowest boundary, where every sample sits exactly on `b0`. Sketch bins mean a few samples near a boundary can land on the wrong side (size not yet measured)
- Lesson from that check: a test whose samples all sit in the first or overflow bucket only exercises the special-cased edges, not the interpolation used everywhere else

Compared to statsd-emitted DD distributions: nearly equivalent in the DD UI. The only fidelity difference is within-bucket value precision - statsd preserves exact sample values; OTLP histograms replace them with an even spread within each bucket during the agent's reconstruction.

Common diagnostic gotcha: a metric whose values appear identical across all percentiles in DD usually means all samples landed in the first or the overflow bucket (`(-Inf, b0]` or `(bN, +Inf)`), which the agent collapses to a single point. Fix is either varying the input data (if probe-stage) or setting `histogram_bucket_overrides` in the runtime config to bracket the actual value range.
