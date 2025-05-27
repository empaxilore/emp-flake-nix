
	# My nvidia settings
	{ config, lib, pkgs, ... }:
	{
		#Nvidia drivers
		services.xserver.videoDrivers = ["nvidia"];
		hardware.graphics.enable = true;
		hardware.nvidia = {
			#modesetting is just required
			modesetting.enable = true;

			#power management
			powerManagement.enable = true;
			powerManagement.finegrained = true;

			open = false;

			nvidiaSettings = true;

			package = config.boot.kernelPackages.nvidiaPackages.stable;

			prime = {
				sync.enable = false;

				# gonna be using offload for laptop..
				offload = {
					  enable = true;
					  enableOffloadCmd = true;
		                          };

				nvidiaBusId = "PCI:1:0:0";
				intelBusId = "PCI:0:2:0";
			
			
			};
		};

	}
