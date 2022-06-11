{ config, pkgs, ... }:
{
  environment = {
    etc."xdg/alacritty/alacritty.yml" = {
      text = builtins.readFile ./alacritty.yml;
      #mode = "0440";
    };
    systemPackages = with pkgs; [ alacritty ];
  };
}
