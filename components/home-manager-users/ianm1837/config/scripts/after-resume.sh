#!/usr/bin/env bash

echo 1 > /sys/class/leds/tpacpi::kbd_backlight/brightness
swaylock
