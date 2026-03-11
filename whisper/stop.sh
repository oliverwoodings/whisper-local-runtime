#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/common.sh"

main() {
	load_runtime
	require_command launchctl

	local target service_target
	target="$(launchd_target)"
	service_target="${target}/${WHISPER_LAUNCHD_LABEL}"

	if ! launchctl print "${service_target}" >/dev/null 2>&1; then
		echo "Service is not loaded: ${WHISPER_LAUNCHD_LABEL}"
		exit 0
	fi

	launchctl stop "${service_target}" >/dev/null 2>&1 || true
	launchctl disable "${service_target}" >/dev/null 2>&1 || true

	echo "whisper.cpp launchd service stopped."
	echo "- label: ${WHISPER_LAUNCHD_LABEL}"
	echo "- start again: npm run whisper:start"
}

main "$@"
