{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.i18n;
in {
  options.features.i18n = {
    enable = mkEnableOption "i18n";
  };

  config = mkIf cfg.enable {
    i18n = {
      defaultLocale = "en_GB.UTF-8";
    };
  };
}
