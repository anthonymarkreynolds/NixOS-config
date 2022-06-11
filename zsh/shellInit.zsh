function myClear {
  for i in {2..$(tput lines)}
  do
    echo ""
  done
}
myClear
alias clear=myClear
alias nr="nixos-rebuild switch --flake ~/flakes/nixos/#anthony --use-remote-sudo"
alias nu="nix flake update ~/flakes/nixos && nixos-rebuild switch --flake ~/flakes/nixos/#anthony --use-remote-sudo"
export TERM=xterm-256color
