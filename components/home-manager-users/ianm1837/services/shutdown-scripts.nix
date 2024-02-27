{pkgs, ...}: {
  systemd.user.services.ShutdownService = {
    Unit = {
      description = "Terminate processes before shutdown";
      wantedBy = ["shutdown.target reboot.target halt.target"];
      before = ["shutdown.target reboot.target halt.target"];
    };
    Service = {
      script = ''
        #!${pkgs.coreutils}/bin/bash
        killall signal-desktop
      '';
      serviceConfig.Type = "oneshot";
    };
  };
}
