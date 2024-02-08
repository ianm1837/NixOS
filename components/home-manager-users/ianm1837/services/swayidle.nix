{ pkgs, user-attributes, ... }:

{
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
      {
        timeout = 305;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
      {
        timeout = 900;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on; ${pkgs.coreutils}/bin/sleep 1; ${pkgs.systemd}/bin/systemctl suspend";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.hyprland}/bin/hyprctl dispatch exec /home/${user-attributes.username}/.config/scripts/before-sleep.sh";
      }
      {
        event = "after-resume";
        # command = "${pkgs.swaylock-effects}/bin/swaylock";
        command = "${pkgs.hyprland}/bin/hyprctl dispatch exec /home/${user-attributes.username}/.config/scripts/after-resume.sh";
      }
    ];
  };
}
