
	{
		description = "The Emp Flake";

		inputs = {

			# Nix pkgs url
			nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

			# Home-manager url
			home-manager = {
				url = "github:nix-community/home-manager/release-24.11";
				inputs.nixpkgs.follows = "nixpkgs";
			};
		};

		outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
