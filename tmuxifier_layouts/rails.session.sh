if [[ -z "$TMUXIFIER_SESSION_DIR" ]]; then
  echo "You have to specify TMUXIFIER_SESSION_DIR!"
  exit 1
fi

# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root $TMUXIFIER_SESSION_DIR
SESSION_NAME=$(basename $TMUXIFIER_SESSION_DIR)

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session $SESSION_NAME; then

  # Create a new window inline within session layout definition.
  new_window "vim"
    run_cmd "vim"
  new_window "console"
  new_window "tmp"
  new_window 'log'
    run_cmd "tail -f log/*.log"
  new_window 'server'

  # Select the default active window on session creation.
  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
