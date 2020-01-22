function edit -d "Open in editor"
  if set -q VISUAL
    eval $VISUAL $argv
  else if set -q EDITOR
    eval $EDITOR $argv
  else
    vi $argv
  end
end
