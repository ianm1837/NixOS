#!/usr/bin/env bash
# commands to run when computer resumes from sleep

swaylock
sleep 2
swaymsg 'output * dpms on'
