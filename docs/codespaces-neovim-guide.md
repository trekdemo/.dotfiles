# Developing with Neovim in GitHub Codespaces

## SSH Access (Primary Method)

You can SSH directly into your codespace and use Neovim:

```bash
# List your codespaces
gh codespace list

# SSH into a codespace
gh codespace ssh -c CODESPACE-NAME
```

Once connected via SSH, you can use any command-line tools including Neovim. The codespace runs an SSH server by default, and GitHub CLI automatically handles SSH key authentication.

## File Syncing

Transfer files between your local machine and codespace:

```bash
# Copy file to codespace
gh codespace cp localfile.txt remote:/workspace/

# Copy file from codespace
gh codespace cp remote:/workspace/file.txt ./

# Recursive directory copy
gh codespace cp -r remote:/workspace/dir ./local-dir
```

Use the `remote:` prefix to indicate codespace file paths.

## Port Forwarding

Forward ports from your codespace to your local machine for preview/testing:

```bash
gh codespace ports forward CODESPACE-PORT:LOCAL-PORT -c CODESPACE-NAME
```

Ports can also be automatically forwarded when applications print localhost URLs to the terminal.

## Automatic Dotfiles Installation

GitHub Codespaces can automatically install your dotfiles when creating a new codespace.
[Read more...](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account)

**Setup:**
1. Go to GitHub Settings → Codespaces
2. Enable "Automatically install dotfiles"
3. Select your dotfiles repository from the dropdown

**How It Works:**

When you create a new codespace, GitHub will:
1. Clone your dotfiles repository to `/workspaces/.codespaces/.persistedshare/dotfiles`
2. Look for one of these install scripts (in order of precedence):
   - `install.sh`
   - `install`
   - `bootstrap.sh`
   - `bootstrap`
   - `script/bootstrap`
   - `setup.sh`
   - `setup`
   - `script/setup`
3. Execute the first script it finds

**Fallback Behavior:**

If no install script is found, any files or folders starting with `.` (like `.vimrc`, `.config/`) are automatically symlinked to your home directory (`~`).

**Security Note:** Review your install scripts before enabling, as they execute with full access to the codespace environment.

## Setup Requirements

- Install and authenticate with GitHub CLI: `gh auth login`
- SSH server runs by default in codespaces. For custom images, add the sshd feature to `devcontainer.json`:

```json
"features": {
  "ghcr.io/devcontainers/features/sshd:1": {
    "version": "latest"
  }
}
```

## Workflow Summary

The typical workflow would be:
1. Create or start a codespace via GitHub CLI
2. SSH into the codespace: `gh codespace ssh`
3. Use Neovim and other CLI tools directly in the remote environment
4. Use `gh codespace cp` when you need to sync specific files
5. Forward ports as needed for web development

## Sources

- [Using GitHub Codespaces with GitHub CLI](https://docs.github.com/en/codespaces/developing-in-a-codespace/using-github-codespaces-with-github-cli)
- [Developing in a codespace](https://docs.github.com/en/codespaces/developing-in-a-codespace/developing-in-a-codespace)
- [Opening an existing codespace](https://docs.github.com/en/codespaces/developing-in-a-codespace/opening-an-existing-codespace)
- [Forwarding ports in your codespace](https://docs.github.com/en/codespaces/developing-in-a-codespace/forwarding-ports-in-your-codespace?tool=vscode)
