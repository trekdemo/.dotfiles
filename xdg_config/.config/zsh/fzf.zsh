# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
function setup_using_base_dir() {
    local fzf_base fzf_shell fzfdirs dir
    fzf_base="$(brew --prefix fzf)"

    if [[ ! -d "${fzf_base}" ]]; then
        return 1
    fi

    # Fix fzf shell directory for Arch Linux, NixOS or Void Linux packages
    if [[ ! -d "${fzf_base}/shell" ]]; then
        fzf_shell="${fzf_base}"
    else
        fzf_shell="${fzf_base}/shell"
    fi

    # Setup fzf binary path
    if (( ! ${+commands[fzf]} )) && [[ "$PATH" != *$fzf_base/bin* ]]; then
        export PATH="$PATH:$fzf_base/bin"
    fi

    # Auto-completion
    if [[ -o interactive && "$DISABLE_FZF_AUTO_COMPLETION" != "true" ]]; then
        source "${fzf_shell}/completion.zsh" 2> /dev/null
    fi

    # Key bindings
    if [[ "$DISABLE_FZF_KEY_BINDINGS" != "true" ]]; then
        source "${fzf_shell}/key-bindings.zsh"
    fi
}

function indicate_error() {
    cat >&2 <<EOF
Cannot find fzf installation directory.
Please add \`export FZF_BASE=/path/to/fzf/install/dir\` to your .zshrc
EOF
}

# Indicate to user that fzf installation not found if nothing worked
setup_using_base_dir || indicate_error

unset -f setup_using_base_dir indicate_error

if [[ -z "$FZF_DEFAULT_COMMAND" ]]; then
    if (( $+commands[ag] )); then
        export FZF_DEFAULT_COMMAND='ag -l --hidden -g "" --ignore .git'
    fi
fi
