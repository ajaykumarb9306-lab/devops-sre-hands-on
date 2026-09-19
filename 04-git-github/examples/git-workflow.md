# Example Git Workflow

Example feature development workflow.

## Update Main

```bash
git switch main
git pull origin main
```

## Create Branch

```bash
git switch -c feature/add-monitoring
```

## Make Changes

Check:

```bash
git status
git diff
```

## Stage

```bash
git add .
```

Review:

```bash
git diff --staged
```

## Commit

```bash
git commit -m "Add monitoring configuration"
```

## Push

```bash
git push -u origin feature/add-monitoring
```

## Pull Request

Create a Pull Request:

```text
feature/add-monitoring
        ↓
       main
```

Review changes and allow CI/CD checks to complete before merging.

## After Merge

Update local main:

```bash
git switch main
git pull origin main
```

Delete local feature branch:

```bash
git branch -d feature/add-monitoring
```

## Workflow

```text
Pull latest main
      ↓
Create feature branch
      ↓
Make changes
      ↓
git status / git diff
      ↓
git add
      ↓
git diff --staged
      ↓
git commit
      ↓
git push
      ↓
Pull Request
      ↓
Review + CI
      ↓
Merge
      ↓
Update local main
```