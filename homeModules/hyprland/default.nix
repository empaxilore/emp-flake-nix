 

 # default for hyprland.

 	{ config, lib, pkgs, inputs, ... }:

	{
		imports = [
		#	inputs.hyprland.homeManagerModules.default
			./settings.nix
		];

		wayland.windowManager.hyprland = {
			enable = true;
			systemd.enable = true;
			xwayland.enable = true;

			extraConfig = '' 
			# for Additional configurations
			'';
		};

		home.packages = with pkgs; [
			
			# Utilities with hyprland

			waybar # Status Bar
			wofi # Application launcher
			mako # Notification daemon
			hyprpaper # Wallpaper
			wl-clipboard # Clipboard Utilities
			cliphist # Clipboard History

			# System Utilities

			brightnessctl # Brightness Controls
			networkmanagerapplet # Network Mangement Tray
			networkmanager
			blueman # Bluetooth
			
			# Audio Utility

			pavucontrol # Pulse Audio volume Control

			# Applications General
			xfce.thunar

			# Screenshot and recording
			grim
			slurp 
			wl-screenrec

			# Idle & Screen Lock
			swayidle
			swaylock
		];
		# waybar
		# Configure Waybar for a clean status bar
  		programs.waybar = {
    		enable = true;
    		settings = {
      			mainBar = {
        			layer = "top";
        			position = "top";
        			height = 30;
        			modules-left = ["hyprland/workspaces" "hyprland/window"];
        			modules-center = ["clock"];
        			modules-right = [
          				"pulseaudio" 
          				"network" 
          				"cpu" 
          				"memory" 
          				"temperature" 
          				"backlight" 
          				"battery" 
          				"tray"
        			];
        
        			# Module configurations
        			"hyprland/workspaces" = {
          				format = "{icon}";
          				on-click = "activate";
          				format-icons = {
            				"1" = "1";
            				"2" = "2";
            				"3" = "3";
            				"4" = "4";
            				"5" = "5";
          				};
        			};
        
        			"clock" = {
          				format = "{:%H:%M %d/%m/%Y}";
          				tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        			};
        
        			"cpu" = {
          				format = "💻 {usage}%";
          				tooltip = false;
        			};
        
        			"memory" = {
          				format = " {}%";
        			};
        
        			"temperature" = {
          				critical-threshold = 80;
          				format = "{icon} {temperatureC}°C";
          				format-icons = ["" "" ""];
        			};
        
        			"backlight" = {
          				format = "{icon} {percent}%";
          				format-icons = ["" "☀"];
        			};
        
        			"battery" = {
          				states = {
            				"good" = 95;
            				"warning" = 30;
            				"critical" = 15;
          				};
          				format = "{icon} {capacity}%";
          				format-charging = "⚡ {capacity}%";
						format-plugged = "🔌 {capacity}%";
						format-alt = "{icon} {time}";
						format-icons = ["" "" "" "" ""];
        			};
        
        			"network" = {
          				format-wifi = "🛜 {essid}";
        				format-ethernet = " {ipaddr}";
        				format-linked = " (No IP)";
          				format-disconnected = "⚠ Disconnected";
          				format-alt = "{ifname}: {ipaddr}/{cidr}";
        			};
        
        			"pulseaudio" = {
          				format = "{icon} {volume}%";
          				format-bluetooth = "{icon} {volume}%";
          				format-bluetooth-muted = "";
        				format-muted = "🔇";
        				format-icons = {
          					headphone = "";
          					hands-free = "";
          					headset = "";
          					phone = "";
          					portable = "";
          					car = "";
          					default = ["🔉" "" "🔊"];
          				};
          			on-click = "pavucontrol";
        			};
        
        			"tray" = {
          				icon-size = 21;
          				spacing = 10;
        			};
      			};
    		};
    	style = ''
      	* {
        	border: none;
        	border-radius: 0;
        	font-family: "FiraCode Nerd Font", sans-serif;
        	font-size: 14px;
        	min-height: 0;
      	}

      	window#waybar {
        	background: rgba(21, 18, 27, 0.9);
        	color: #cdd6f4;
      	}

      	tooltip {
        	background: #1e1e2e;
        	border-radius: 10px;
        	border-width: 2px;
        	border-style: solid;
        	border-color: #11111b;
      	}

      	#workspaces button {
        	padding: 5px;
        	color: #313244;
        	margin-right: 5px;
      	}

      	#workspaces button.active {
        	color: #a6adc8;
        	background: #eba0ac;
        	border-radius: 10px;
      	}

      	#workspaces button:hover {
        	background: #11111b;
        	color: #cdd6f4;
        	border-radius: 10px;
      	}

      	#clock,
      	#battery,
      	#cpu,
      	#memory,
      	#network,
      	#pulseaudio,
      	#temperature,
      	#backlight,
      	#tray {
        	padding: 0 10px;
        	margin: 0 5px;
        	color: #cdd6f4;
      	}

      	#battery.charging {
        	color: #a6e3a1;
      	}

      	#battery.warning:not(.charging) {
        	background: #f38ba8;
        	color: #1e1e2e;
        	border-radius: 10px;
      	}
    	'';
  	};
	# Configure Hyprpaper for wallpaper
  	xdg.configFile."hypr/hyprpaper.conf".text = ''
    	preload = ~/.config/hypr/wallpaper.jpg
   	wallpaper = eDP-1,~/.config/hypr/wallpaper.jpg
  	'';

  	# Make sure the directory exists
  	home.file.".config/hypr/wallpaper.jpg".source = ./wallpaper.jpg;
	
}
