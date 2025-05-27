
	{
		description = "The Emp Flake";

		inputs = {

			# Nix pkgs url
			nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

			# Home-manager url
			home-manager = {
				       url = "github:nix-community/home-manager/release-25.05";
				       inputs.nixpkgs.follows = "nixpkgs";
			};

			# Stylix Module Option
			stylix = {
      				 url = "github:danth/stylix/release-25.05";
      				 inputs.nixpkgs.follows = "nixpkgs";
    			};
			
		};

		outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
		let
		  lib = nixpkgs.lib;
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

			  nixos = lib.nixosSystem {
			
			  specialArgs = {inherit inputs system;};

			  modules = [
				./configuration.nix
				stylix.nixosModules.stylix
				home-manager.nixosModules.home-manager
				{
				    home-manager.useGlobalPkgs = true;
				    home-manager.useUserPackages = true;
				    home-manager.users.empericon = import ./home.nix;

				    # That backup error is stupid
				    home-manager.backupFileExtension = "backup";
				}
			  ];
			  };
			};			 
		};
	}	
