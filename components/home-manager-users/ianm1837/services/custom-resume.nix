{ config, pkgs, ... }:

{
  systemd.user.services.myResumeService = {
    Unit = {
      description = "Perform actions on resume";
      wantedBy = [ "sleep.target" ];
      before = [ "sleep.target" ];
    };
    Service = {
      script = ''
        case $1 in
          pre)
            # Commands to run before going to sleep
            ;;
          post)
            # Commands to run after resuming
            echo "System resumed at $(date)" >> /home/ianm1837/resume_time.log
            ;;
        esac
      '';
      serviceConfig.Type = "oneshot";
      serviceConfig.Environment = "PATH=${pkgs.coreutils}/bin:/bin:/usr/bin";
    };
  };
}
