{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.features.samba;
in {
  options.features.samba = {
    enable = mkEnableOption "samba";
  };

  config = mkIf cfg.enable {
    services.samba = {
      enable = true;
      openFirewall = true;
      securityType = "user";
      extraConfig = ''
        workgroup = WORKGROUP
        server string = Nagoya
        netbios name = Nagoya
        security = user
        guest account = nobody
        map to guest = bad user
      '';
      shares = {
        media = {
          path = "/media";
          browseable = "yes";
          "read only" = "yes";
          "guest ok" = "yes";
          "create mask" = "0644";
          "write list" = "nmtmason";
          "directory mask" = "0755";
          "force user" = "nmtmason";
          "force group" = "users";
        };
      };
    };
  };
}
