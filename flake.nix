{
  description = "NixOS and Darwin System Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    ...
  }: let
    user = {
      name = "Nicholas Mason";
      email = "nmt.mason@googlemail.com";
      username = "nmtmason";
      group = "users";
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKx2qnHlt/z69+LL5rb9Y06GS9S3ziMCKKyBkO/tE544"
      ];
    };
  in {
    darwinConfigurations = import ./darwin {
      inherit darwin home-manager user;
    };

    nixosConfigurations = import ./nixos {
      inherit nixpkgs home-manager user;
    };
  };
}
