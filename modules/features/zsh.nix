{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.zsh;
in {
  options.features.zsh = {
    enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    environment = {
      shells = with pkgs; [zsh];
    };

    programs = {
      zsh.enable = true;
    };

    system = mkIf pkgs.stdenv.isDarwin {
      activationScripts.postActivation.text = "sudo chsh -s ${pkgs.zsh}/bin/zsh";
    };
  };
}
