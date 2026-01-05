---
description: Cherry-pick one or more git commits and create a GitHub pull request
argument-hint: <commit-hash1> [commit-hash2] [commit-hash3] ... [--branch branch-name] [--title "PR Title"] [--base base-branch]
allowed-tools: ["Bash", "Task"]
---

# Cherry-pick Commits and Create PR

Create a branch based on `origin/main`, cherry-pick the specified commits and create a GitHub pull request from them.

**Arguments provided:** $ARGUMENTS

1. **Parse the arguments** to extract commit hashes and optional parameters
2. **Fetch the `origin/main` branch** to have the latest changes
2. **Create a new branch based on `origin/main`** (and use the specified branch name)
3. **Cherry-pick the specified commits** in the order provided
4. **Push the branch** to the remote repository
5. **Create a GitHub pull request** with an appropriate title and description

## Cherry-picking

If there are any conflicts, guide me through resolving them.

## Creating Pull Request

Once the commits are successfully cherry-picked and pushed, create a GitHub pull request using the `gh` CLI tool.

**Expected workflow:**
- Extract commit hashes from arguments
- Determine branch name (auto-generate if not provided)
- Create new branch from `origin/main`
- Cherry-pick commits in sequence
- Handle any conflicts that arise
- Push branch to remote
- Create PR with descriptive title and body
- Return the PR URL
