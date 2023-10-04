{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.starship;
in {
  options.features.home.starship = {
    enable = mkEnableOption "starship";
  };

  config = mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
