{ config, pkgs, hostname, ... }:

{
  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    hostName = "${hostname}";
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
  };

  sound.enable = true;
  security.rtkit.enable = true; #realtime kit. Hardware scheduling for audio
}