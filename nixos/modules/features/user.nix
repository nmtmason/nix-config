{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.user;
in {
  options.features.user = {
    enable = mkEnableOption "user";
    username = mkOption {
      type = types.str;
    };
    keys = mkOption {
      type = types.listOf types.str;
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.username} = {
      extraGroups = [
        "audio"
        "networkmanager"
        "wheel"
      ];
      home = "/home/${cfg.username}";
      isNormalUser = true;
      openssh.authorizedKeys.keys = cfg.keys;
      shell = pkgs.zsh;
    };
  };
}
