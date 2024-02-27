{ pkgs, ... }:

{
  systemd.user.services.myResumeService = {
    Unit = {
      description = "Terminate processes before shutdown";
      wantedBy = [ "shutdown.target reboot.target halt.target" ];
      before = [ "shutdown.target reboot.target halt.target" ];
    };
    Service = {
      script = ''
      killall signal-desktop
      '';
      serviceConfig.Type = "oneshot";
      serviceConfig.Environment = "PATH=${pkgs.coreutils}/bin:/bin:/usr/bin";
    };
  };
}

