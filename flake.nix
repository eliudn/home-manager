{
  description = "Home Manager configuration of leunamz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        myNixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./modules/system/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        leunamz = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/desktop/home.nix
          ];
        };

        # users.users.leunamz ={shell = pkgs.zsh;};
      };
      # homeConfigurations."leunamz" = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;
      #
      #   extraSpecialArgs = { inherit inputs; };
      #
      #   modules = [ ./hosts/desktop/home.nix ];
      #
      # };
    };
}
