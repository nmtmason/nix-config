{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.syncthing;
in {
  options.features.syncthing = {
    enable = mkEnableOption "syncthing";

    username = mkOption {
      type = types.str;
    };
    group = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      syncthing = {
        enable = true;
        user = cfg.username;
        group = cfg.group;
        configDir = "/home/${cfg.username}/.config/syncthing";
        settings = {
          folders = {
            "Sync" = {
              path = "/media/Sync";
            };
          };
        };
      };
    };
  };
}
