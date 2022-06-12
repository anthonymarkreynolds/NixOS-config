function myClear {
  for i in {2..$(tput lines)}
  do
    echo ""
  done
}
myClear
alias clear=myClear
export TERM=xterm-256color
