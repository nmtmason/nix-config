{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.kitty;
in {
  options.features.home.kitty = {
    enable = mkEnableOption "kitty";

    fontSize = mkOption {
      type = types.str;
      default = "13";
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        kitty-themes
      ];
    };
    xdg = {
      enable = true;
      configFile = {
        "kitty/kitty.conf".text = ''
          font_family JetBrainsMono Nerd Font
          font_size ${cfg.fontSize}
          include ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Macchiato.conf
          shell_integration no-rc enabled
          tab_bar_min_tabs 1
          tab_bar_style powerline
        '';
      };
    };
  };
}
