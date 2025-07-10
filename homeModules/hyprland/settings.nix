

	# settings for hyprland
	{ config, lib, pkgs, ... }:

	{
		wayland.windowManager.hyprland.settings = {
    		# Monitor configuration
    		# Adjust resolution and refresh rate as needed for your Vivobook
    		monitor = [
      			"eDP-1,1920x1080@60,0x0,1"
      			",preferred,auto,1,mirror,eDP-1" # For external displays, will mirror your laptop screen
    		];

    		# Set variables
    		"$mod" = "SUPER"; # Windows key
    		"$terminal" = "kitty";
    		"$fileManager" = "thunar";
    		"$menu" = "wofi --show drun";
    		"$browser" = "vivaldi";

    		# Window layout and behavior
    		general = {
      		gaps_in = 5;
      		gaps_out = 10;
      		border_size = 2;
      		#"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      		#"col.inactive_border" = "rgba(595959aa)";
      		layout = "dwindle";
      		allow_tearing = false;
    		};

    	# Laptop-specific configurations
    	#  usually has a touchpad
    	input = {
      		kb_layout = "us";
      		follow_mouse = 1;
      		touchpad = {
        		natural_scroll = true;
        		tap-to-click = true;
        		drag_lock = true;
      		};
      		sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification
    	};

    	# UI/UX settings
    	decoration = {
      		rounding = 10;
      		blur = {
        		enabled = true;
        		size = 3;
        		passes = 1;
        		new_optimizations = true;
      		};
      		shadow = { 
			 enabled = false;
		};
    	};

    	# Animation settings
    	animations = {
      		enabled = true;
      		bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      		animation = [
        		"windows, 1, 7, myBezier"
        		"windowsOut, 1, 7, default, popin 80%"
        		"border, 1, 10, default"
        		"fade, 1, 7, default"
        		"workspaces, 1, 6, default"
      		];
    	};

    	# Layout settings
    	dwindle = {
      		pseudotile = true;
      		preserve_split = true;
    	};

    	master = {
		mfact = 0.5;
		new_status = "master";
	};

    	# Gestures for touchpad
    	gestures = {
      		workspace_swipe = true;
      		workspace_swipe_fingers = 3;
    	};

	# Cursor settings
	env = [
	  "XCURSOR_THEME,Nordzy-cursors"
	  "XCURSOR_SIZE,24"
	];

    	# Window rules
    	windowrulev2 = [
      		"float,class:^(pavucontrol)$"
      		"float,class:^(nm-connection-editor)$"
      		"float,class:^(blueman-manager)$"
    	];

    	# Key bindings
    	bind = [
      		# Basic controls
      		"$mod, T, exec, $terminal"
      		"$mod, Q, killactive,"
      		"$mod, M, exit,"
      		"$mod, E, exec, $fileManager"
      		"$mod, V, togglefloating,"
      		"$mod, R, exec, $menu"
      		"$mod, F, fullscreen"
      		"$mod, B, exec, $browser"
		# Screenshot 
		", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
      
      		# Window focus
      		"$mod, left, movefocus, l"
      		"$mod, right, movefocus, r"
      		"$mod, up, movefocus, u"
      		"$mod, down, movefocus, d"
      
      		# Move windows
      		"$mod SHIFT, left, movewindow, l"
      		"$mod SHIFT, right, movewindow, r"
      		"$mod SHIFT, up, movewindow, u"
      		"$mod SHIFT, down, movewindow, d"
      
      		# Workspaces
      		"$mod, 1, workspace, 1"
      		"$mod, 2, workspace, 2"
      		"$mod, 3, workspace, 3"
      		"$mod, 4, workspace, 4"
      		"$mod, 5, workspace, 5"
      		"$mod, 6, workspace, 6"
      		"$mod, 7, workspace, 7"
      		"$mod, 8, workspace, 8"
      		"$mod, 9, workspace, 9"
      		"$mod, 0, workspace, 10"
      
      		# Move to workspaces
      		"$mod SHIFT, 1, movetoworkspace, 1"
      		"$mod SHIFT, 2, movetoworkspace, 2"
      		"$mod SHIFT, 3, movetoworkspace, 3"
      		"$mod SHIFT, 4, movetoworkspace, 4"
      		"$mod SHIFT, 5, movetoworkspace, 5"
      		"$mod SHIFT, 6, movetoworkspace, 6"
      		"$mod SHIFT, 7, movetoworkspace, 7"
      		"$mod SHIFT, 8, movetoworkspace, 8"
      		"$mod SHIFT, 9, movetoworkspace, 9"
      		"$mod SHIFT, 0, movetoworkspace, 10"
      
      		# Scroll through workspaces
      		"$mod, mouse_down, workspace, e+1"
      		"$mod, mouse_up, workspace, e-1"
    	];

    	# Media keys and special ASUS function keys
    	bindel = [
      		# Volume
      		", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      		", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      		", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      
      		# Brightness (common on Vivobook)
      		", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      		", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    	];

    	# Mouse bindings
    	bindm = [
      		"$mod, mouse:272, movewindow"
      		"$mod, mouse:273, resizewindow"
    	];
    
    	# Start applications on launch
    	exec-once = [
      		"waybar"
      		"mako"                         # Notification daemon
      		"hyprpaper"                    # Wallpaper
      		"nm-applet --indicator"        # Network manager
      		"blueman-applet"               # Bluetooth
      		"wl-paste --watch cliphist store" # Clipboard manager
    	];
	};
}
