{
  lib,
  pkgs,
  user,
  host,
  ...
}:
with lib; {
  imports = [
    ./hardware-configuration.nix
    ../../../modules/features/i18n.nix
    ../../../modules/features/nix.nix
    ../../../modules/features/nixpkgs.nix
    ../../../modules/features/openssh.nix
    ../../../modules/features/tailscale.nix
    ../../../modules/features/time.nix
    ../../../modules/features/zsh.nix
    ../../modules/features/fonts.nix
    ../../modules/features/samba.nix
    ../../modules/features/user.nix
  ];

  features = {
    fonts.enable = true;
    i18n.enable = true;
    openssh.enable = true;
    nix.enable = true;
    nixpkgs.enable = true;
    samba.enable = true;
    tailscale.enable = true;
    time.enable = true;
    user = {
      enable = true;
      username = user.username;
      keys = user.keys;
    };
    zsh.enable = true;
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  environment = {
    systemPackages = [
      pkgs._1password-gui
      pkgs.azuredatastudio
      pkgs.bruno
      pkgs.firefox
      pkgs.google-chrome
      pkgs.kitty
      pkgs.obsidian
      pkgs.slack
      pkgs.spotify
      pkgs.vlc
      pkgs.vscode
      pkgs.zoom-us
      pkgs.qbittorrent
    ];
  };

  hardware = {
    pulseaudio.enable = true;
  };

  networking = {
    firewall.enable = true;
    hostName = host.hostName;
    networkmanager.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  services = {
    xrdp = {
      enable = true;
      defaultWindowManager = "startplasma-x11";
      openFirewall = true;
    };
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;
      videoDrivers = [
        "amdgpu"
      ];
    };
  };

  system = {
    stateVersion = "23.05";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-kde
    ];
    wlr = {
      enable = true;
    };
  };
}
