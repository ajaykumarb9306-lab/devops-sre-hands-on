# Git & GitHub for DevOps & SRE

Practical Git and GitHub reference for source control, collaboration, infrastructure code, automation, and CI/CD workflows.

## Topics

- Git configuration
- Repository creation and cloning
- Working directory and staging area
- Commits
- Push and pull
- Branches
- Merging
- Pull requests
- Merge conflicts
- `.gitignore`
- Git history
- Tags
- Stashing
- Undoing changes
- Reset vs revert
- Remote repositories
- GitHub authentication
- Troubleshooting

## Basic Git Workflow

```text
Working Directory
       ↓
    git add
       ↓
Staging Area
       ↓
   git commit
       ↓
Local Repository
       ↓
    git push
       ↓
GitHub / Remote Repository
```

Typical workflow:

```bash
git status
git diff
git add .
git status
git commit -m "Describe the change"
git push origin main
```

## Repository Structure

```text
04-git-github/
├── README.md
├── commands.md
├── branching.md
├── undo-mistakes.md
├── troubleshooting.md
└── examples/
    └── git-workflow.md
```