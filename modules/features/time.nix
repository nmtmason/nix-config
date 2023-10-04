{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.time;
in {
  options.features.time = {
    enable = mkEnableOption "time";
  };

  config = mkIf cfg.enable {
    time = {
      timeZone = "Europe/London";
    };
  };
}
