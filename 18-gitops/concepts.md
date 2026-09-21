# GitOps Concepts

## Desired State

Git contains the desired configuration.

Example:

replicas: 3

Argo CD compares this configuration with the actual Kubernetes cluster.

## Reconciliation

Git Desired State
       |
       v
    Argo CD
       |
       v
Kubernetes Actual State

If the states differ, Argo CD reports the application as OutOfSync.

With automated synchronization enabled, Argo CD can reconcile the cluster automatically.

## Drift

Drift occurs when the live environment differs from Git.

Example:

Git:
replicas: 3

Someone manually runs:

kubectl scale deployment web-app --replicas=5

The live cluster now differs from Git.

GitOps tooling can detect and optionally correct this drift.

## Pull-Based Deployment

Traditional CI/CD often pushes changes into environments.

GitOps commonly uses an agent/controller in the environment that pulls desired configuration from Git.

This reduces the need to expose cluster credentials to external CI systems.

## Rollback

A previous Git commit can restore an earlier desired configuration.

git log
git revert COMMIT_ID
git push

Argo CD then reconciles the environment.
