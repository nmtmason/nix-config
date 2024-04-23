{
  lib,
  pkgs,
  user,
  host,
  ...
}:
with lib; {
  imports = [
    ../../../modules/features/i18n.nix
    ../../../modules/features/nix.nix
    ../../../modules/features/nixpkgs.nix
    ../../../modules/features/time.nix
    ../../../modules/features/zsh.nix
    ../../modules/features/user.nix
  ];

  features = {
    i18n.enable = true;
    nix.enable = true;
    nixpkgs.enable = true;
    time.enable = true;
    user = {
      enable = true;
      username = user.username;
      keys = user.keys;
    };
    zsh.enable = true;
  };

  environment = {
    systemPackages = [
    ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  services = {
    vscode-server.enable = true;
  };

  system = {
    stateVersion = "23.11";
  };

  wsl = {
    enable = true;
    defaultUser = user.username;
    wslConf.network.hostname = host.hostname;
  };
}
