# Kubernetes Architecture

## Cluster Architecture

Kubernetes uses a control plane to manage workloads running on nodes.

Client
  |
kubectl
  |
API Server
  |
Control Plane
  |
  +-- etcd
  +-- Scheduler
  +-- Controller Manager
  |
Nodes
  |
Pods
  |
Containers

## API Server

The API Server is the main entry point into Kubernetes.

kubectl communicates with the API Server to create, update, delete, and inspect resources.

## etcd

etcd stores Kubernetes cluster state and configuration.

## Scheduler

The Scheduler decides which node should run a Pod.

It considers resources and scheduling rules such as:

- CPU
- Memory
- Node selectors
- Affinity
- Taints and tolerations

## Controller Manager

Controllers continuously compare desired state with actual state.

Example:

Desired replicas: 3
Actual replicas: 2

The controller creates another Pod to return the cluster to the desired state.

## Nodes

Nodes provide compute resources where workloads run.

Important components include:

- kubelet
- container runtime
- networking components

## Pods

A Pod is the smallest deployable Kubernetes workload.

A Pod contains one or more containers.

## Deployments

Deployments manage application Pods through ReplicaSets.

Deployments provide:

- Replica management
- Self-healing
- Scaling
- Rolling updates
- Rollbacks

## Services

Pods can be recreated and receive different IP addresses.

Services provide stable network access to groups of Pods.

Services discover Pods using labels and selectors.

Common Service types:

- ClusterIP
- NodePort
- LoadBalancer

## ConfigMaps

ConfigMaps store non-sensitive application configuration.

## Secrets

Secrets store sensitive configuration.

Production credentials should not be committed to Git.

## Persistent Storage

PersistentVolumeClaims request persistent storage for workloads.

Storage can survive Pod replacement depending on the storage configuration.

## Kubernetes Reconciliation

Kubernetes continuously attempts to make actual state match desired state.

Desired State
     |
Controller
     |
Actual State
