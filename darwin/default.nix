{
  home-manager,
  darwin,
  user,
  ...
}: {
  Osaka = let
    host = {
      computerName = "Osaka";
      hostName = "Osaka";
    };
    system = "aarch64-darwin";
  in
    darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {
        inherit user system host;
      };
      modules = [
        ./hosts/Osaka/configuration.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
          };
          home-manager.users.${user.username} = import ./hosts/Osaka/home.nix;
        }
      ];
    };
}
