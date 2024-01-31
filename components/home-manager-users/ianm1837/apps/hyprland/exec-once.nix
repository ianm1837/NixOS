{
  exec-once = [
    "tee /sys/class/leds/tpacpi::kbd_backlight/brightness <<< 1"
    "kanshi & waybar & waypaper --restore & nm-applet --indicator & blueman-applet & hyprctl setcursor Bibata-Modern-Classic 24 &"
    "~/.config/hypr/scripts/watch-socket.sh &"
    "~/.config/hypr/scripts/startup-delay.sh"
  ];
}