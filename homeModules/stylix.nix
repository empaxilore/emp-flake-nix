{ pkgs, ... }:


{
	home.pointerCursor = {
			gtk.enable = true;
			name = "Nordzy-cursors";
			size = 24;
		};
	# stylix configurations.
	# Stylix for Home Manager
  	stylix = {
    		enable = true; # Enables Stylix for user-level theming
		overlays.enable = false; #bs error
    		base16Scheme = {
		base00 = "2E3440"; # Default background (Nord0)
      		base01 = "3B4252"; # Lighter background (Nord1)
      		base02 = "434C5E"; # Selection background (Nord2)
      		base03 = "4C566A"; # Comments, invisibles (Nord3)
     		base04 = "D8DEE9"; # Dark foreground (Nord4)
      		base05 = "E5E9F0"; # Default foreground (Nord5)
      		base06 = "ECEFF4"; # Light foreground (Nord6)
      		base07 = "8FBCBB"; # Light background (Nord7)
      		base08 = "BF616A"; # Red (Nord11)
      		base09 = "D08770"; # Orange (Nord12)
      		base0A = "EBCB8B"; # Yellow (Nord13)
      		base0B = "A3BE8C"; # Green (Nord14)
      		base0C = "88C0D0"; # Cyan (Nord8)
      		base0D = "81A1C1"; # Blue (Nord9)
      		base0E = "B48EAD"; # Magenta (Nord10)
      		base0F = "5E81AC"; # Brown (Nord15)

		}; # Use the Nord theme for Kitty
    		fonts = {
      			monospace = {
        			   package = pkgs.departure-mono; # Use JetBrains Mono font
       				   name = "Departure Mono";
      		        };
     		        sizes = {
                        terminal = 11; # Set font size for Kitty
                        };
                };
    		opacity.terminal = .55; # Set Kitty background opacity 
		cursor = {
			name ="Nordzy-cursors";
			package = pkgs.nordzy-cursor-theme;
			size = 24;
		};
	    		targets = {
      			kitty.enable = true; # Enable theming for Kitty

      			# set false to disable
      			#vscode.enable = false;

			# GTK things
      			gtk.enable = true; # Avoid theming desktop environment

                };
       };
}
