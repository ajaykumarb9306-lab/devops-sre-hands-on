# GitOps

GitOps uses Git as the source of truth for infrastructure and application configuration.

## Core Flow

Developer
   |
Git Commit
   |
GitHub Repository
   |
Argo CD
   |
Kubernetes
   |
Application

Instead of manually changing Kubernetes resources, desired state is stored in Git.

## Core Principles

- Git is the source of truth
- Changes are version controlled
- Desired state is declarative
- Automated reconciliation detects drift
- Changes are auditable
- Rollback can use Git history

## Tools

Common GitOps tools include:

- Argo CD
- Flux

This module uses Argo CD.
