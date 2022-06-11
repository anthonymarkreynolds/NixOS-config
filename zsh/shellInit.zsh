function myClear {
  for i in {3..$(tput lines)}
  do
    echo ""
  done
}
myClear
alias clear=myClear
alias nr="nixos-rebuild switch --flake ~/flakes/nixos/#anthony --use-remote-sudo"
alias nu="nixos-rebuild switch --upgrade --flake ~/flakes/nixos/#anthony --use-remote-sudo"
export TERM=xterm-256color
