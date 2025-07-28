{ inputs, self, ... }: {
  flake.nixosConfigurations = {
    # Gaming/development workstation - AMD Ryzen 5700X + RTX 3070Ti
    deadbeef = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        "${self}/hosts/deadbeef/configuration.nix"
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.astevenstaylor = "${self}/users/astevenstaylor/home.nix";
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

    # Future host: beefaced - AMD Ryzen 9700X, NAS/homelab server
    # beefaced = inputs.nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   specialArgs = { inherit inputs; };
    #   modules = [
    #     "${self}/hosts/beefaced/configuration.nix"
    #     inputs.home-manager.nixosModules.home-manager
    #     {
    #       home-manager.useGlobalPkgs = true;
    #       home-manager.useUserPackages = true;
    #       home-manager.users.astevenstaylor = "${self}/users/astevenstaylor/home.nix";
    #       home-manager.extraSpecialArgs = { inherit inputs; };
    #     }
    #   ];
    # };
  };
}
