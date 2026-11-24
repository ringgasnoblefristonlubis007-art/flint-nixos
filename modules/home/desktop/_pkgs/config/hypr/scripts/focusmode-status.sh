#!/usr/bin/env bash
# =============================================================================
# Focus Mode Status Indicator for Waybar
# =============================================================================

RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/flint"
STATUS_FILE="$RUNTIME_DIR/hypr_focusmode_active"

if [ -f "$STATUS_FILE" ]; then
	if pgrep -x hypridle >/dev/null 2>&1; then
		systemctl --user stop hypridle.service 2>/dev/null || true
		pkill -x hypridle 2>/dev/null || true
	fi
	printf '{"text":"󰈈\\nON","tooltip":"Focus Mode","class":"on"}\n'
else
	printf '{"text":"󰈉\\nOFF","tooltip":"Focus Mode","class":"off"}\n'
fi
