#!/usr/bin/env bash
# Pure-function tests for prwatch. No network, no state.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/prwatch"   # defines functions; main() not run due to BASH_SOURCE guard

pass=0; fail=0
assert_eq() { # desc expected actual
  if [ "$2" = "$3" ]; then echo "ok   - $1"; pass=$((pass+1))
  else echo "FAIL - $1"; echo "  expected: $2"; echo "  actual:   $3"; fail=$((fail+1)); fi
}

REVIEWS='[{"id":1,"user":{"login":"alice"},"state":"APPROVED","submitted_at":"t1"},
          {"id":2,"user":{"login":"bray"},"state":"COMMENTED","submitted_at":"t2"},
          {"id":3,"user":{"login":"bob"},"state":"CHANGES_REQUESTED","submitted_at":"t3"}]'

out="$(filter_new_reviews "$REVIEWS" '[]' 'bray' | jq -c '[.[].id]')"
assert_eq "none seen: includes others, excludes my own" '[1,3]' "$out"

out="$(filter_new_reviews "$REVIEWS" '[1]' 'bray' | jq -c '[.[].id]')"
assert_eq "excludes already-seen ids" '[3]' "$out"

out="$(filter_new_reviews "$REVIEWS" '[1,2,3]' 'bray' | jq -c '[.[].id]')"
assert_eq "empty when all seen" '[]' "$out"

echo; echo "passed=$pass failed=$fail"; [ "$fail" -eq 0 ]
