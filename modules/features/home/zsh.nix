{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.zsh;
in {
  options.features.home.zsh = {
    enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        history.size = 10000;
        syntaxHighlighting.enable = true;
      };
    };
  };
}
