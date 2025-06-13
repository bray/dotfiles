#!/usr/bin/env bash

# Common bash functions
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Brian Ray
#
# This library should be sourced by scripts that need these functions.
#
# Installation:
#   XDG: ~/.local/share/scripts/common-functions.sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This file should be sourced, not executed directly" >&2
  exit 1
fi

# Logging functions
log() {
  echo -e "$*"
}

log_success() {
  log "${GREEN}$*${NC}"
}

log_error() {
  log "${RED}$*${NC}" >&2
}

fail() {
  log_error "$*"
  exit 1
}

# Fail if a required command is not found
command_not_found() {
  local command_name="$1"
  local command_env_var="$2"

  fail "Required command '$command_name' not found in PATH or via \$${command_env_var}."
}

# Check if an environment variable is set
check_env_var() {
  local var_name="$1"
  local var_value="${!var_name:-}"
  
  if [[ -z "$var_value" ]]; then
    log_error "Error: $var_name is not set"
    return 1
  fi

  return 0
}
