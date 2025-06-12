#!/system/bin/sh
# Debloat Script

echo "Starting debloat process..."

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# List of apps to remove
APPS_TO_REMOVE="
/system/app/Stk
/system/app/EasterEgg
/product/app/Jelly
/product/app/SpeechServicesByGoogle
/product/priv-app/WellbeingPrebuilt
"

for APP in $APPS_TO_REMOVE; do
  if [ -d "$APP" ]; then
    echo "Removing: $APP"
    rm -rf "$APP"
  else
    echo "Skipped (not found): $APP"
  fi
done

echo "Debloat complete."
