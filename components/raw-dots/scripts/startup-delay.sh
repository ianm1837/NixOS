#!/usr/bin/env bash

sleep 3
nohup mattermost-desktop -enable-features=UseOzonePlatform -ozone-platform=wayland 2>&1 &
nohup signal-desktop --start-in-tray --no-sandbox -enable-features=UseOzonePlatform -ozone-platform=wayland 2>&1 &
