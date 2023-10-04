{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.home.ssh;
in {
  options.features.home.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf cfg.enable {
    programs = {
      ssh = {
        enable = true;
        extraConfig = ''
          Host *
           IdentityAgent ~/.1password/agent.sock
        '';
      };
    };
  };
}
