{
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../../modules/features/home/direnv.nix
    ../../../modules/features/home/git.nix
    ../../../modules/features/home/helix.nix
    ../../../modules/features/home/kitty.nix
    ../../../modules/features/home/ssh.nix
    ../../../modules/features/home/starship.nix
    ../../../modules/features/home/syncthing.nix
    ../../../modules/features/home/zsh.nix
  ];

  features.home = {
    direnv.enable = true;
    git = {
      enable = true;
      userName = user.name;
      userEmail = user.email;
      editor = "hx";
    };
    helix.enable = true;
    kitty.enable = true;
    ssh.enable = true;
    starship.enable = true;
    syncthing.enable = true;
    zsh.enable = true;
  };

  home = {
    packages = with pkgs; [
      alejandra
      azure-cli
      azure-functions-core-tools
      docker
      wget
    ];
    sessionPath = [
      "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    ];
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
    stateVersion = "23.05";
  };
}
