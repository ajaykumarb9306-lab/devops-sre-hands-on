# Argo CD

Argo CD is a declarative GitOps continuous delivery tool for Kubernetes.

## Architecture

Git Repository
      |
      v
Argo CD
      |
      v
Kubernetes API
      |
      v
Application Resources

## Important Components

API Server
Repository Server
Application Controller
Redis

## Application

An Argo CD Application defines:

- Git repository
- Git revision
- Manifest path
- Destination cluster
- Destination namespace
- Sync policy

## Sync Status

Synced

Git and Kubernetes match.

OutOfSync

The live Kubernetes configuration differs from Git.

## Health Status

Healthy
Progressing
Degraded
Missing
Unknown

## Automated Sync

Argo CD can automatically apply Git changes.

## Self-Healing

Self-healing can restore resources when someone manually changes the cluster.

## Pruning

Pruning removes Kubernetes resources that were removed from Git.
