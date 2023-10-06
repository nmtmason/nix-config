{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.tailscale;
in {
  options.features.tailscale = {
    enable = mkEnableOption "tailscale";
  };

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
    };
  };
}
