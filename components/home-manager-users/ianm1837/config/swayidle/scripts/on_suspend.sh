#!/usr/bin/env bash
# commands to run when computer has been idle for 15 minutes

#kill swaylock before suspend to prevent crash on resume
killall -S SIGUSR1 swaylock
# swaymsg 'output * dpms on'
swaylock
systemctl suspend