{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.openssh;
in {
  options.features.openssh = {
    enable = mkEnableOption "openssh";
  };

  config = mkIf cfg.enable {
    services = {
      openssh = {
        enable = true;
        settings = {
          KbdInteractiveAuthentication = false;
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };
  };
}
