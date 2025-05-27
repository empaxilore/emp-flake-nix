

	# default for home Modules

	{ config, pkgs, user, ... }:

	{
		imports = [
			./hyprland/default.nix
			./terminals/default.nix
		#	./stylix.nix
		];
	}
