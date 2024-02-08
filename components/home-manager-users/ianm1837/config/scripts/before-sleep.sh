#!/usr/bin/env bash

hyprctl dispatch focusmonitor 0
hyprctl dispatch workspace empty

hyprctl dispatch focusmonitor 1
hyprctl dispatch workspace empty

hyprctl dispatch focusmonitor 2
hyprctl dispatch workspace empty

hyprctl dispatch focusmonitor 3
hyprctl dispatch workspace empty

killall -s SIGUSR1 swaylock