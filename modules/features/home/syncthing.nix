{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.syncthing;
in {
  options.features.home.syncthing = {
    enable = mkEnableOption "syncthing";
  };

  config = mkIf cfg.enable {
    services = {
      syncthing = {
        enable = true;
      };
    };
  };
}
