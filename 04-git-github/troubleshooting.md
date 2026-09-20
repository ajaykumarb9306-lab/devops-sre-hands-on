# Git & GitHub Troubleshooting

Common Git problems and troubleshooting commands.

## Push Rejected

Example:

```text
! [rejected] main -> main
(non-fast-forward)
```

First:

```bash
git status
git fetch origin
```

Inspect differences:

```bash
git log --oneline --graph --decorate --all
```

If appropriate, update your branch:

```bash
git pull origin main
```

Resolve any conflicts, commit if required, then:

```bash
git push origin main
```

Do not immediately force-push simply because a normal push was rejected.

---

## Merge Conflict

Git may show:

```text
<<<<<<< HEAD
your changes
=======
incoming changes
>>>>>>> branch-name
```

Check conflicted files:

```bash
git status
```

Open each file and decide what the final content should be.

Remove the conflict markers:

```text
<<<<<<<
=======
>>>>>>>
```

Then:

```bash
git add <resolved-file>
```

Complete the merge:

```bash
git commit
```

Verify:

```bash
git status
```

---

## Wrong Branch

Check:

```bash
git branch
```

If you have uncommitted work you don't want to lose:

```bash
git stash push -u -m "move work to correct branch"
```

Switch:

```bash
git switch correct-branch
```

Restore:

```bash
git stash pop
```

---

## Detached HEAD

Check:

```bash
git status
```

If you want to keep work created while detached:

```bash
git switch -c recovery-branch
```

This creates a branch pointing to your current commit.

---

## Git Says Working Tree Is Clean

```text
nothing to commit, working tree clean
```

This means Git currently sees no tracked changes waiting to be committed.

Check:

```bash
git status
```

Also confirm you're in the expected repository:

```bash
pwd
git rev-parse --show-toplevel
```

---

## Repository Not Found

Check remote:

```bash
git remote -v
```

Verify:

- repository URL
- repository name
- account permissions
- authentication

Remote details:

```bash
git remote show origin
```

---

## Authentication Problems

For HTTPS repositories, GitHub does not use your normal account password for Git operations.

Common authentication methods include:

```text
Git Credential Manager
Personal Access Token
SSH key
GitHub CLI
```

Check remote type:

```bash
git remote -v
```

HTTPS example:

```text
https://github.com/user/repository.git
```

SSH example:

```text
git@github.com:user/repository.git
```

---

## SSH Authentication

Check existing SSH directory:

```bash
ls -la ~/.ssh
```

Generate a key if needed:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

Start agent:

```bash
eval "$(ssh-agent -s)"
```

Add key:

```bash
ssh-add ~/.ssh/id_ed25519
```

Display public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Test GitHub authentication after the public key has been added to GitHub:

```bash
ssh -T git@github.com
```

Never upload:

```text
~/.ssh/id_ed25519
```

Only the `.pub` file is the public key.

---

## Check What Will Be Committed

```bash
git status
```

Review unstaged:

```bash
git diff
```

Review staged:

```bash
git diff --staged
```

This is a good habit before every commit.

---

## Git Diff Opens a Full-Screen Viewer

Git commonly uses a pager for long output.

Exit:

```text
q
```

Navigate:

```text
Space       next page
b           previous page
/word       search
q           quit
```

---

## File Should Be Ignored but Git Still Tracks It

Adding a tracked file to `.gitignore` does not automatically stop Git from tracking it.

Example:

```bash
git rm --cached .env
```

Then:

```bash
git add .gitignore
git commit -m "Stop tracking environment file"
```

The local `.env` remains, while Git stops tracking it.

---

## Check Repository State

When confused about Git, start with:

```bash
pwd
git status
git branch
git remote -v
git log --oneline -10
```

For a visual history:

```bash
git log --oneline --graph --decorate --all
```

These commands answer:

```text
Where am I?
↓
What changed?
↓
Which branch am I on?
↓
Where is the remote?
↓
What happened recently?
```