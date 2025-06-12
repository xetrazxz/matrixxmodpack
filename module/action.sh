#!/system/bin/sh

# Log
LOGFILE="/data/local/tmp/action14.log"
log() {
    echo "[A14] $1" >> "$LOGFILE"
}

log "🔧 Starting optimizations..."

### 🔥 Clear package cache
log "🧹 Deleting app cache..."
rm -rf /data/resource-cache/* 2>/dev/null
rm -rf /data/dalvik-cache/* 2>/dev/null
rm -rf /cache/* 2>/dev/null
log "✅ Cache cleared."

### 🚀 Trigger system-wide background dexopt
log "🚀 Running bg-dexopt-job..."
cmd package bg-dexopt-job
log "✅ bg-dexopt-job done."

### 🧠 Compile installed packages using dex2oat
log "📦 Compiling all user-installed packages..."
for pkg in $(pm list packages -3 | cut -f2 -d:); do
    cmd package compile -m everything -f "$pkg" >> "$LOGFILE" 2>&1
    log "Compiled $pkg"
done

### ✂️ Trim filesystems
log "✂️ Running fstrim..."
for mount in /data /cache /system /metadata /mnt/system; do
    fstrim -v "$mount" >> "$LOGFILE" 2>&1
done
log "✅ fstrim completed."

log "🏁 action.sh done ()."
