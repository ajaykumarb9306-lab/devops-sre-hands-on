# CI/CD Hands-On

Practical CI/CD implementation using GitHub Actions.

## CI/CD Flow

Developer
   |
   v
Git Push / Pull Request
   |
   v
GitHub Actions
   |
   +-- Python validation
   +-- Terraform validation
   +-- Helm validation
   +-- Kubernetes validation
   |
   v
Build / Test / Deploy

## Continuous Integration

CI automatically validates changes before they are merged.

Typical CI tasks:

- Syntax checks
- Unit tests
- Code formatting
- Terraform validation
- Container builds
- Kubernetes manifest validation
- Helm linting

## Continuous Delivery / Deployment

CD automates delivery of validated software to environments.

Typical flow:

Code
  ↓
Build
  ↓
Test
  ↓
Artifact
  ↓
Deploy Dev
  ↓
Deploy Stage
  ↓
Deploy Production

## Repository Pipeline

This repository includes a GitHub Actions workflow:

.github/workflows/devops-ci.yml

It validates several technologies already contained in this repository.
