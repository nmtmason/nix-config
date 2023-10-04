{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.direnv;
in {
  options.features.home.direnv = {
    enable = mkEnableOption "direnv";
  };

  config = mkIf cfg.enable {
    programs = {
      direnv = {
        enable = true;
        nix-direnv = {
          enable = true;
        };
      };
    };
  };
}
