function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_initialized_repo
  test (git rev-parse --git-dir ^/dev/null | wc -l) -gt 0
end

function _git_commit_exists
  test (git log ^&1 | grep --count "^fatal") -eq 0
end

function git_time_since_commit
  not _git_initialized_repo; and return
  not _git_commit_exists;    and return

  set -l last_commit (git log --pretty=format:'%at' -1 2> /dev/null)
  set -l now         (date +%s)

  set -l seconds     (math $now - $last_commit)
  set -l minutes     (math $seconds / 60)
  set -l hours       (math $seconds / 3600)
  set -l days        (math $seconds / 86400)
  set -l sub_hours   (math "$hours % 24")
  set -l sub_minutes (math "$minutes % 60")

  if git_is_dirty
    if test $minutes -gt 30
      set _color (set_color -o red)
    else if test $minutes -gt 10
      set _color (set_color -o yellow)
    else
      set _color (set_color -o green)
    end
  else
    set _color (set_color -o green)
  end
  set _normal (set_color normal)

  if test $hours -gt 24
    echo -n $_color{$days}d {$sub_hours}h {$sub_minutes}m$_normal
  else if test $minutes -gt 60
    echo -n $_color$hours"h" {$sub_minutes}m$_normal
  else
    echo -n $_color{$minutes}m$_normal
  end
end
