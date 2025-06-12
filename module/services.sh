#!/system/bin/sh
#
setprop power.saving.mode 1
setprop pm.sleep_mode 1
#
sleep 20
# Set animation speed to 1.25x
settings put global window_animation_scale 1.25
settings put global transition_animation_scale 1.25
settings put global animator_duration_scale 1.25

