# Git Commands Cheat Sheet

## Configuration

View configuration:

```bash
git config --list
```

Set name:

```bash
git config --global user.name "Your Name"
```

Set email:

```bash
git config --global user.email "you@example.com"
```

Check:

```bash
git config user.name
git config user.email
```

---

## Create Repository

Initialize:

```bash
git init
```

Clone:

```bash
git clone https://github.com/user/repository.git
```

Clone into specific directory:

```bash
git clone https://github.com/user/repository.git my-project
```

---

## Repository Status

```bash
git status
```

Short format:

```bash
git status --short
```

---

## View Changes

Unstaged changes:

```bash
git diff
```

Staged changes:

```bash
git diff --staged
```

Specific file:

```bash
git diff README.md
```

If Git opens a pager while viewing long output, press:

```text
q
```

to return to the terminal.

---

## Stage Changes

Specific file:

```bash
git add README.md
```

Directory:

```bash
git add 04-git-github
```

Everything:

```bash
git add .
```

Check staged files:

```bash
git status
```

---

## Commit

```bash
git commit -m "Add Git documentation"
```

View latest commit:

```bash
git log -1
```

Compact history:

```bash
git log --oneline
```

Graph:

```bash
git log --oneline --graph --decorate --all
```

---

## Remote Repository

View remotes:

```bash
git remote -v
```

Add remote:

```bash
git remote add origin https://github.com/user/repository.git
```

Remote information:

```bash
git remote show origin
```

---

## Push

Push branch:

```bash
git push origin main
```

First push of a new branch:

```bash
git push -u origin feature-branch
```

After upstream is configured:

```bash
git push
```

---

## Pull

```bash
git pull origin main
```

Fetch without merging:

```bash
git fetch origin
```

View remote branches after fetching:

```bash
git branch -r
```

---

## Branches

Current branches:

```bash
git branch
```

All local and remote branches:

```bash
git branch -a
```

Create branch:

```bash
git branch feature/docker-monitoring
```

Switch:

```bash
git switch feature/docker-monitoring
```

Create and switch:

```bash
git switch -c feature/docker-monitoring
```

Older equivalent:

```bash
git checkout -b feature/docker-monitoring
```

Delete local branch:

```bash
git branch -d feature/docker-monitoring
```

Force-delete:

```bash
git branch -D feature/docker-monitoring
```

---

## Merge

Switch to destination branch:

```bash
git switch main
```

Update it:

```bash
git pull origin main
```

Merge:

```bash
git merge feature/docker-monitoring
```

---

## Stash

Temporarily save changes:

```bash
git stash
```

With description:

```bash
git stash push -m "Work in progress"
```

View:

```bash
git stash list
```

Restore latest stash:

```bash
git stash pop
```

Apply without deleting stash:

```bash
git stash apply
```

---

## Tags

Create tag:

```bash
git tag v1.0.0
```

Annotated tag:

```bash
git tag -a v1.0.0 -m "Version 1.0.0"
```

View tags:

```bash
git tag
```

Push tag:

```bash
git push origin v1.0.0
```

Push all tags:

```bash
git push origin --tags
```

---

## `.gitignore`

Example:

```gitignore
.env
*.log
*.pem
*.key
.DS_Store
.vscode/
terraform.tfstate
terraform.tfstate.*
```

Never commit secrets such as:

```text
Private keys
Passwords
API tokens
Cloud credentials
.env secrets
Service-account keys
```

---

## Useful Daily Workflow

Before changing code:

```bash
git switch main
git pull origin main
```

Create branch:

```bash
git switch -c feature/my-change
```

Work normally.

Then:

```bash
git status
git diff
```

Stage:

```bash
git add .
```

Review staged changes:

```bash
git diff --staged
```

Commit:

```bash
git commit -m "Describe the change"
```

Push:

```bash
git push -u origin feature/my-change
```

Then create a Pull Request in GitHub.

---

## Useful Inspection Commands

Who changed a line:

```bash
git blame README.md
```

Show commit:

```bash
git show <commit>
```

Show changed files:

```bash
git show --stat <commit>
```

Find commits affecting a file:

```bash
git log -- README.md
```

Search commit messages:

```bash
git log --grep="Docker"
```