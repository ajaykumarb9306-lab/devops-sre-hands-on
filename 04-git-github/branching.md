# Git Branching & Pull Requests

Branches allow changes to be developed independently before they are merged into the main branch.

## Recommended Workflow

```text
main
 │
 └── feature branch
        │
        ├── changes
        ├── commits
        └── push
             │
             ↓
        Pull Request
             │
             ↓
        Review / CI
             │
             ↓
           Merge
             │
             ↓
            main
```

## Create Feature Branch

Make sure main is current:

```bash
git switch main
git pull origin main
```

Create branch:

```bash
git switch -c feature/add-health-check
```

Make changes.

Check:

```bash
git status
git diff
```

Stage:

```bash
git add .
```

Commit:

```bash
git commit -m "Add server health check"
```

Push:

```bash
git push -u origin feature/add-health-check
```

Create a Pull Request in GitHub:

```text
feature/add-health-check
        ↓
       main
```

After review and CI checks, merge the Pull Request.

## Update Local Main

```bash
git switch main
git pull origin main
```

## Delete Old Local Branch

```bash
git branch -d feature/add-health-check
```

## Branch Naming Examples

```text
feature/add-monitoring
feature/docker-health-check
fix/nginx-config
fix/terraform-network
docs/update-readme
chore/update-dependencies
```

Branches should represent changes or pieces of work.

Do not create branches simply to organize technologies such as:

```text
linux
docker
terraform
kubernetes
```

Use directories for repository organization and branches for changes.