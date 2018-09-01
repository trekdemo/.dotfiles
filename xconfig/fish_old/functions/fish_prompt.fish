function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_in_rebase
  [ -d .git/rebase-apply ]; and echo " REBASING"
end

function pwdn
  pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\\//'
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l cyan (set_color cyan)
  set -l green (set_color -o green)
  set -l black (set_color -o black)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $normal(pwdn)

  # Virtual fish prompt
  # if set -q VIRTUAL_ENV
  #     echo -n -s (set_color -b blue white) "vf(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  # end

  if [ (_git_in_rebase) ]
    set -l colored_git_rebase $red(_git_in_rebase)
    set git_info "$colored_git_rebase"
  end

  if [ (_git_branch_name) ]
    set -l colored_git_branch $red(_git_branch_name)
    # set -l git_commit_time (git_time_since_commit)
    # set git_info "$blue git:($git_commit_time|$colored_git_branch$blue)"
    set git_info "$git_info $blue git:($colored_git_branch$blue)"
  end

  if git_is_dirty
    set -l dirty "$yellow ✗"
    set git_info "$git_info$dirty"
  end

  echo -n -s $arrow ' '$cwd $git_info $normal ' '
end