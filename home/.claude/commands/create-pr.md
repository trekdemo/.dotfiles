---
allowed-tools: Bash(git *), Bash(gh *)
description: Create a GitHub pull request with template support and confirmation
---

## Context

- Current branch: !`git branch --show-current`
- Base branch: !`git config --get init.defaultBranch || echo "main"`
- Git status: !`git status`
- Recent commits on this branch: !`git log --oneline origin/main..HEAD 2>/dev/null || git log --oneline -5`
- Diff summary: !`git diff --stat origin/main...HEAD 2>/dev/null || echo "No diff available"`

## Your Task

Create a GitHub pull request from the current branch following this workflow:

### 1. Validate Branch State
- Ensure we're not on the `main/master` branch
- Verify the branch has commits
- Check if branch is pushed to remote (push if needed with `--set-upstream` flag)

### 2. Prepare PR Body
- Read the PR template from `.github/pull_request_template.md`
- Analyze the commit history and code changes
- Fill out the template sections with relevant information

### 3. Generate PR Title
- Create a clear, concise title that describes the changes
- If branch name contains JIRA ticket (e.g., JIRA-12345), consider including it

### 4. Confirmation
- **IMPORTANT**: Present the PR title and body to the user for review
- Ask if they want to proceed, make changes, or cancel
- Show the command that will be executed: `gh pr create --draft --assignee="@me" --title "..." --body "..."`

### 5. Create PR
- Only after user confirmation, create the PR using `gh pr create`
- Always create as **draft** unless user explicitly requests otherwise
- Return the PR URL to the user

## Important Notes

- Always use `gh pr create` with HEREDOC for the body to handle multi-line content
- Format: `gh pr create --draft --assignee="@me" --title "Title" --body "$(cat <<'EOF'\n...\nEOF\n)"`
- If branch is not pushed, push it first with: `git push -u origin $(git branch --show-current)`
- Extract the JIRA ticket ID from branch name if present (pattern: XXXX-XXXXX)
