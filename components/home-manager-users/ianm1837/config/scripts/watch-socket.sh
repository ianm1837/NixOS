#!/usr/bin/env bash

# watch for hyprland config reload and restart kanshi.
# hyprland hijacks monitor settings 
handle() {
  case $1 in
    configreloaded*) kanshictl reload ;;
    # *) echo $1;;
  esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done