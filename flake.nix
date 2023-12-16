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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNcoLYLGX5k/IMPl4LcLK2P2KFcPo+DNvtl4T/qr8Mv nmt.mason@googlemail.com"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC85nKlvyqVfWXGUFbky713typuC4yrSSOvZZVpR9moNVV2GT1jUYznwWVdpJox9vcWdak3yfNKFIBQmQXVLInO50NA1BcDLK35b7ECfgAuYeT6qMissiwLJKC/e+wRoFgWMm9Oj7/wVFjcNy8h00MGLbvPWPj/qqI9IUe0XqT2tc9nLojAykdu8izzqn8Jafp8VUtsCQ2t+UohMMNdDFLpp5u0crpzT7m6ZAQGxYEy8oWUJl12xGRu8O+nlV9U871Q60O/q1OjJfs6GjMGf6HpDxccXqA3lh75z6TEoWsHO+IBRxlOPDFxa+F6Mt4tMjauJsqaUsuOSZ2AT61TzxyiJ+8b1U0Eaj6HgzQEDuAvz8ANstTyTERtnY+c0bL+OW4k6hJ5X+/ai+N4O03lGhOViXQuucp/H49ioa2XeSwrUOYveL/zLgiZ5n2gsI7Xld5UP6SGIpDnKc8tFm+u/k9X8pE+duE/ptRPhpsdFVZAEjTSVoGaZgBbWMLY8vlk3Ct/vxBDEZgpHYA1LSwvb+GsT2YMHy/lCcOK9hK46z4yTl2AkmOTjBpiSBAVsglvWaM7dBuoOmVOt6cfqcJuNYfWrO14twtW/sObfKAxzzfV8km8sxG95NgNsz0iDWWPFmUXfmD6V33GiyduMzVXH2FlFOkFk6mMR7O+o23AVoNwxw== nmt.mason@googlemail.com"
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
