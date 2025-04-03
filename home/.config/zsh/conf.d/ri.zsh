# ==========================================================
# My extensions to use ri in a more convenient way
# ==========================================================

# Start FZF with to lookup Ruby documentation with ri
        # --bind="focus:preview(ri --format=ansi '{}' | cat)" \
ri-search() {
  ri --list |\
    fzf --print-query \
        --preview="ri --format=ansi {}" \
        --preview-window="down:80%:wrap" \
        --bind="ctrl-y,ctrl-f:replace-query"
}


# Generate ri documentation for all installed gems
ri-generate-all-docs() {
  gem rdoc --all --ri --no-rdoc
}
