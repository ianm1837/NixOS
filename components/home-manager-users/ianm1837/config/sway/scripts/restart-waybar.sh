#!/usr/bin/env bash

dbus-update-activation-environment WAYLAND_DISPLAY
pkill waybar
waybar &
