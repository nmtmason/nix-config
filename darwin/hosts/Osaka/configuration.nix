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
      "1password" # _1password
      "anki" # anki
      "azure-data-studio" # azuredatastudio
      "clickup"
      "cyberghost-vpn"
      "docker" # docker
      "firefox" # firefox
      "fork"
      "google-chrome" # google-chrome
      "kitty" # kitty
      "linearmouse"
      "microsoft-office"
      "microsoft-remote-desktop"
      "mysqlworkbench" # mysql-workbench
      "netnewswire" # net-news-wire
      "obsidian" # obsidian
      "raycast" # raycast
      "slack" # slack
      "spotify" # spotify
      "utm" # utm
      "visual-studio-code" # vscode
      "vlc" # vlc
      "zoom" # zoom-us
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
        launchanim = false;
        mineffect = "scale";
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "right";
        show-process-indicators = false;
        show-recents = false;
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
