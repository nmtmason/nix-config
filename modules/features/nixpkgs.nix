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
    };
  };
}
