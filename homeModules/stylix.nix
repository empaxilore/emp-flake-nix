

	# stylix configurations.
	# Stylix for Home Manager
  	stylix = {
    		enable = true; # Enables Stylix for user-level theming
    		base16Scheme = "nord"; # Use the Nord theme for Kitty
    		fonts = {
      			monospace = {
        			   package = pkgs.departure-mono; # Use JetBrains Mono font
       				   name = "Departure Mono";
      		        };
     		        sizes = {
                        terminal = 12; # Set font size for Kitty
                        };
                };
    		opacity.terminal = 0.9; # Set Kitty background opacity to 90%
    		targets = {
      			kitty.enable = true; # Enable theming for Kitty
      			# set false to disable
      			#vscode.enable = false;
      			gtk.enable = false; # Avoid theming desktop environment
                };
       };
