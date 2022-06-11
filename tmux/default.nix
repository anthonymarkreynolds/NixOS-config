{ pkgs, ... }:

let
  plugins = with pkgs.tmuxPlugins; [
    yank
    onedark-theme
  ];

in {
  environment.systemPackages = with pkgs; [ 
    tmux 
    tmuxinator
  ];
  programs.tmux = {
    enable = true;
    shortcut= "a";
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    extraConfig = (builtins.readFile ./.tmux.conf) + "${builtins.concatStringsSep "" (map (plugin: "run-shell ${plugin.rtp}\n") plugins)}";
    baseIndex = 1;
    clock24 = true;
  };
}
