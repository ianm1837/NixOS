#!/usr/bin/env bash

sleep 3
mattermost-desktop -enable-features=UseOzonePlatform -ozone-platform=wayland 2>&1 &
signal-desktop --start-in-tray --no-sandbox -enable-features=UseOzonePlatform -ozone-platform=wayland 2>&1 &