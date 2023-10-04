{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.nix;
in {
  options.features.nix = {
    enable = mkEnableOption "nix";
  };

  config = mkIf cfg.enable {
    nix = {
      package = pkgs.nix;
      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
      };
      extraOptions = ''
        auto-optimise-store = true
        experimental-features = nix-command flakes
      '';
    };
  };
}
