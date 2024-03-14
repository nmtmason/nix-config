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
    ../../../modules/features/home/zsh.nix
  ];

  features.home = {
    direnv.enable = true;
    # git = {
    #   enable = true;
    #   userName = user.name;
    #   userEmail = user.email;
    #   editor = "hx";
    # };
    helix.enable = true;
    kitty.enable = true;
    ssh = {
      enable = true;
      identityAgentPath = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
    starship.enable = true;
    zsh.enable = true;
  };

  home = {
    packages = with pkgs; [
      azure-cli
      neovim
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
