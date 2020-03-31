function lost_commits
  git fsck --full --no-reflogs --unreachable --lost-found | grep commit | cut -d\  -f3 | xargs -n 1 git log -n 1 --pretty=oneline | fzf --reverse --no-sort --preview 'git show -p (echo {} | grep -o \'[a-f0-9]\\{7\\}\' | head -1) | diff-highlight'
end
