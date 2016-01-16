# Find more here: https://github.com/atweiden/fzf-extras/blob/master/fzf-extras.sh
function fh -d "Seach in history with fzf"
  history |\
    fzf --tiebreak=index --header="history" -q (commandline -b) |\
    read -l fzf_last_select
  [ $fzf_last_select ]; and commandline -rb $fzf_last_select
end
