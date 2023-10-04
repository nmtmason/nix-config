{
  pkgs,
  user,
  host,
  ...
}: {
  imports = [
    ../../../modules/features/nix.nix
    ../../../modules/features/nixpkgs.nix
    ../../../modules/features/zsh.nix
    ../../modules/features/fonts.nix
    ../../modules/features/user.nix
  ];

  features = {
    fonts.enable = true;
    nix.enable = true;
    nixpkgs.enable = true;
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
      "arc"
      "azure-data-studio"
      "firefox"
      "fork"
      "google-chrome"
      "kitty"
      "linearmouse"
      "microsoft-office"
      "obsidian"
      "postman"
      "raycast"
      "slack"
      "visual-studio-code"
      "vlc"
      "zoom"
    ];
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
        orientation = "right";
        static-only = true;
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
