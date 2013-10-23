# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/digital_natives/procurementtool/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session 'fluenta'; then

  # Create a new window inline within session layout definition.
  new_window "vim"
    run_cmd "vim"
  new_window "console"
  new_window "tmp"
  new_window 'log'
    run_cmd "tail -f log/development.log"
  load_window "foreman-zeus"

  # Select the default active window on session creation.
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
