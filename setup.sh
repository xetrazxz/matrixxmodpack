#!/system/bin/sh
# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "MF Run this as ROOT"
  exit 1
fi
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1
echo "Now running from: $SCRIPT_DIR"
#
