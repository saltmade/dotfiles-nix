{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = import ./policies.nix;
    profiles.default = {
      isDefault = true;
      containersForce = true;
      containers = {
        Personal = {
	  color = "purple";
	  icon = "fingerprint";
	  id = 1;
	};
	Shopping = {
	  color = "yellow";
	  icon = "cart";
	  id = 2;
	};
      };
      search = import ./search.nix;
    };
  };
}
