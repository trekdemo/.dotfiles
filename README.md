# Install config files

By running the `install.sh`.

## Manual steps
- [ ] Import the GPG key to be able to sign commits
- [ ] [Create a new GitHub PAT][1] to manage Git and GitHub
- [ ] Add GitHub PAT to the ~/.bundle/config (So I can access private gems from
      GitHub)

[1]: https://github.com/settings/tokens

## Install italics - optional

  # Linux
  $ tic -x ~/.terminfo ~/.terminfo/src/xterm-256color.terminfo

  # MacOS
  $ tic -c ~/.terminfo ~/.terminfo/src/xterm-256color.terminfo


