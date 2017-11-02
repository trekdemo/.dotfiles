function git_is_dirty
  test (git status -s --ignore-submodules=dirty ^/dev/null | wc -l) -gt 0
end
