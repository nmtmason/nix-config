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
    identityAgentPath = mkOption {
      type = types.str;
      default = "~/.1password/agent.sock";
    };
  };

  config = mkIf cfg.enable {
    programs = {
      ssh = {
        enable = true;
        extraConfig = ''
          Host *
            IdentityAgent "${cfg.identityAgentPath}"
        '';
      };
    };
  };
}
