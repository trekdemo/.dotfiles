## Print a horizontal rule
function rule
  printf "%"(tput cols)"s\n"|tr " " "─"
end
