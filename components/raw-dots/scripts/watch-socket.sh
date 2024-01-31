#!/usr/bin/env bash

handle() {
  case $1 in
    configreloaded*) kanshictl reload ;;
    # *) echo $1;;
  esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done