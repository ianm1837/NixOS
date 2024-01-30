{ config, pkgs, ... }:

{
  programs.auto-cpufreq.enable = true;

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="leds", KERNEL=="tpacpi::kbd_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/leds/%k/brightness"
  '';

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    hostName = "nixos";
  };

  services = {
    openssh.enable = true;
    printing.enable = true;
    xserver.libinput.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true; #realtime kit. Hardware scheduling for audio
}