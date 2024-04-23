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
    ../../../modules/features/home/starship.nix
    ../../../modules/features/home/zsh.nix
  ];

  features.home = {
    direnv.enable = true;
    git = {
      enable = true;
      userName = user.name;
      userEmail = user.email;
      editor = "hx";
      sshCommand = "ssh.exe";
    };
    helix.enable = true;
    starship.enable = true;
    zsh.enable = true;
  };

  home = {
    packages = with pkgs; [
      wget
    ];
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
    shellAliases = {
      ssh = "ssh.exe";
      ssh-add = "ssh-add.exe";
    };
    stateVersion = "23.11";
  };
}
