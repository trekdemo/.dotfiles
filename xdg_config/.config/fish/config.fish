# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# virtual env wrappers for Python
# eval (python -m virtualfish)
if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

# BEGIN ANSIBLE MANAGED BLOCK
test -e ~/.cw/env.sh; and source ~/.cw/env.sh
# END ANSIBLE MANAGED BLOCK
