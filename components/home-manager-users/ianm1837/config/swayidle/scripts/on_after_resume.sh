#!/usr/bin/env bash
# commands to run when computer resumes from sleep

swaylock
sleep 2
echo 1 > /sys/class/leds/tpacpi::kbd_backlight/brightness
swaymsg 'output * dpms on'
