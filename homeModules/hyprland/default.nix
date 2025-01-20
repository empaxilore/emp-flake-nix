 

 # default for hyprland.

 	{ pkgs, inputs, ... }:

	{
		imports = [
			inputs.hyprland.homeManagerModules.default
			./settings.nix
		];

		wayland.windowManager.hyprland = {
			enable = true;
			systemd.variables = ["--all"];
		};

		home.packages = with pkgs; [
			brightnessctl
			playerctl
			clipse
			
		];
	}
