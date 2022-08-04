{ config, pkgs, ... }:
let 
  kmonad = import ./kmonad.nix;
in {
  environment.systemPackages = with pkgs; [ kmonad ]; 
  services = {
#  services.kmonad = {
#    enable = true; # disable to not run kmonad at startup
#    configfiles = [ ./config.kbd ];
#	# Modify the following line if you copied nixos-module.nix elsewhere or if you want to use the derivation described above
#	# package = import /pack/to/kmonad.nix;
#  };
    udev.extraRules =
      ''
        # KMonad user access to /dev/uinput
        KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
      '';
  }; 
}
