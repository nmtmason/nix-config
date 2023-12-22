{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.helix;
in {
  options.features.home.helix = {
    enable = mkEnableOption "helix";
  };

  config = mkIf cfg.enable {
    programs = {
      helix = {
        enable = true;
        settings = {
          theme = "catppuccin_macchiato";
          editor = {
            bufferline = "always";
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "block";
            };
            rulers = [
              80
              120
            ];
            true-color = true;
          };
        };
      };
    };
  };
}
