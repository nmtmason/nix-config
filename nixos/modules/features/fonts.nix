{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.fonts;
in {
  options.features.fonts = {
    enable = mkEnableOption "fonts";
  };

  config = mkIf cfg.enable {
    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        (nerdfonts.override {fonts = ["JetBrainsMono"];})
      ];
    };
  };
}
