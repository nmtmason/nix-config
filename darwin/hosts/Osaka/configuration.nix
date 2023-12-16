{
  pkgs,
  user,
  host,
  ...
}: {
  imports = [
    ../../../modules/features/nix.nix
    ../../../modules/features/nixpkgs.nix
    ../../../modules/features/tailscale.nix
    ../../../modules/features/zsh.nix
    ../../modules/features/fonts.nix
    ../../modules/features/user.nix
  ];

  features = {
    fonts.enable = true;
    nix.enable = true;
    nixpkgs.enable = true;
    tailscale.enable = true;
    user = {
      enable = true;
      username = user.username;
      keys = user.keys;
    };
    zsh.enable = true;
  };

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "azure-data-studio"
      "cyberghost-vpn"
      "docker"
      "firefox"
      "fork"
      "google-chrome"
      "kitty"
      "linearmouse"
      "microsoft-office"
      "microsoft-remote-desktop"
      "obsidian"
      "raycast"
      "slack"
      "spotify"
      "utm"
      "visual-studio-code"
      "vlc"
      "zoom"
    ];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
  };

  networking = {
    computerName = host.computerName;
    hostName = host.hostName;
  };

  services = {
    nix-daemon.enable = true;
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 25;
        KeyRepeat = 5;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
      };

      dock = {
        mineffect = "scale";
        minimize-to-application = true;
        orientation = "right";
        show-process-indicators = false;
        static-only = true;
        tilesize = 48;
      };

      finder = {
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };
    };

    stateVersion = 4;
  };
}
