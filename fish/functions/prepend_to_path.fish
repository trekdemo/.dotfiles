function prepend_to_path -d "Prepend the given dir to PATH"
  set -l old_path $PATH
  set -l new_path "$argv[1]"
  set -gx PATH "$new_path"

  for p in $old_path
    if test "$p" != "$new_path"
      set -gx PATH $PATH "$p"
    end
  end
end

