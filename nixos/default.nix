{
  nixpkgs,
  nixos-wsl,
  home-manager,
  vscode-server,
  user,
  ...
}: {
  Nagoya = let
    host = {
      hostName = "Nagoya";
      ipAddress = "192.168.1.101";
    };
    system = "x86_64-linux";
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user system host;
      };
      modules = [
        ./hosts/Nagoya/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
          };
          home-manager.users.${user.username} = import ./hosts/Nagoya/home.nix;
        }
      ];
    };
  Chiba = let
    host = {
      hostname = "Chiba";
    };
    system = "x86_64-linux";
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user system host;
      };
      modules = [
        ./hosts/Chiba/configuration.nix

        nixos-wsl.nixosModules.wsl
        vscode-server.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
          };
          home-manager.users.${user.username} = import ./hosts/Chiba/home.nix;
        }
      ];
    };
}
