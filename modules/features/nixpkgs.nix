{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.nixpkgs;
in {
  options.features.nixpkgs = {
    enable = mkEnableOption "nixpkgs";
  };

  config = mkIf cfg.enable {
    nixpkgs = {
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        # FIX: https://github.com/NixOS/nixpkgs/issues/273611
        "electron-25.9.0"
      ];
    };
  };
}
