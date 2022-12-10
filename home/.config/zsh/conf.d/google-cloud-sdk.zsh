if ! (( $+commands[brew] )); then
  return
fi

local installation_path="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
if [[ ! -d "$installation_path" ]]; then
  return
fi

source "$installation_path/path.zsh.inc"

for exe in $(ls "${installation_path}/bin"); do
  local p="${installation_path}/bin/$exe"
  if [ -x "$p" ]; then

    # Lazy load completion for executables
    $exe() {
      unfunction $0

      source "$installation_path/completion.zsh.inc"

      $0 $@
    }
  fi
done
