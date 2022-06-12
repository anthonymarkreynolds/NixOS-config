{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    zsh
    zsh-nix-shell
    sshfs
    wget
    git
    ranger
    gh
    sysz
    busybox
    lazygit
    neofetch
    exa
  ];
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [
      "git"
      "vi-mode"
      "colored-man-pages"
      "command-not-found"
      "extract"
    ];
    shellAliases = {
      ls = "exa -la";
      nr = "nixos-rebuild switch --flake ~/flakes/nixos/#anthony --use-remote-sudo";
      nu = "nix flake update ~/flakes/nixos && nixos-rebuild switch --flake ~/flakes/nixos/#anthony --use-remote-sudo";
    };
    shellInit = builtins.readFile ./shellInit.zsh;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
  users.users.anthony.shell = pkgs.zsh;
}
