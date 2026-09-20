# Undoing Git Mistakes

A practical reference for safely undoing common Git mistakes.

## Discard Changes to a File

If the file has NOT been staged:

```bash
git restore file.txt
```

Discard all unstaged changes:

```bash
git restore .
```

> This permanently removes the uncommitted changes.

---

## Unstage a File

If you accidentally ran:

```bash
git add file.txt
```

Unstage it:

```bash
git restore --staged file.txt
```

Your modifications remain in the file.

Unstage everything:

```bash
git restore --staged .
```

---

## Change the Last Commit Message

If the commit has not been pushed:

```bash
git commit --amend -m "New commit message"
```

---

## Add a Forgotten File to Last Commit

```bash
git add forgotten-file.txt
git commit --amend --no-edit
```

This rewrites the last commit.

Avoid rewriting commits that other people may already be using unless you understand the impact.

---

## Undo a Local Commit but Keep Changes

Keep changes staged:

```bash
git reset --soft HEAD~1
```

Keep changes but unstage them:

```bash
git reset HEAD~1
```

---

## Safely Undo a Pushed Commit

For shared branches, prefer:

```bash
git revert <commit-id>
```

Example:

```bash
git log --oneline
git revert a1b2c3d
git push origin main
```

`git revert` creates a new commit that reverses the selected commit.

This preserves repository history.

---

## Reset vs Revert

```text
git reset
    ↓
Moves branch history
Best for local/unshared work

git revert
    ↓
Creates a new opposite commit
Usually safer for shared/pushed history
```

---

## Recover a Commit

Git keeps a local record of recent HEAD movements:

```bash
git reflog
```

Example:

```text
a1b2c3d HEAD@{0}: reset: moving to HEAD~1
d4e5f6g HEAD@{1}: commit: Add monitoring configuration
```

Recover by creating a branch:

```bash
git switch -c recovery d4e5f6g
```

`git reflog` can be extremely useful after an accidental reset or branch movement.

---

## Accidentally Committed a Secret

Removing the file in a later commit does NOT automatically remove the secret from Git history.

Immediate actions normally include:

1. Revoke or rotate the exposed credential.
2. Stop using the compromised credential.
3. Remove the secret from the repository.
4. Add the file/pattern to `.gitignore`.
5. If required, clean the secret from Git history using an appropriate history-rewrite procedure.

Examples of files that should not be committed:

```text
.env
*.pem
*.key
cloud credentials
API tokens
password files
service-account keys
```

For example:

```gitignore
.env
*.pem
*.key
```

Never commit SSH or cloud private keys to GitHub.

---

## Delete an Untracked File

See untracked files:

```bash
git status
```

Preview what Git would delete:

```bash
git clean -n
```

Delete untracked files:

```bash
git clean -f
```

Delete untracked directories:

```bash
git clean -fd
```

Always preview with `git clean -n` first.

---

## Before Undoing Anything

Check:

```bash
git status
git diff
git diff --staged
git log --oneline -10
```

If you're unsure whether work could be lost, consider:

```bash
git stash push -u -m "backup before Git recovery"
```

Then investigate.