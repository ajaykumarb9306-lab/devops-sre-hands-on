# Secrets Security Lab

This project demonstrates safe secret handling and basic secret scanning.

No real credentials should be used.

## Secret Scanner

Run:

./scripts/secret-scan.sh .

The script searches for common patterns that may indicate hard-coded credentials.

This is an educational scanner and does not replace tools such as:

- Gitleaks
- TruffleHog
- GitHub secret scanning

## Kubernetes Lab

Create a demo Secret without storing the actual value in Git:

kubectl create secret generic demo-app-secret \
  --from-literal=username=demo-user \
  --from-literal=password=demo-password

Create the Pod:

kubectl apply -f kubernetes/pod.yaml

Verify:

kubectl get pod secret-demo

Delete:

kubectl delete pod secret-demo
kubectl delete secret demo-app-secret

## Important

The values used in this lab are intentionally fake.

Never use production credentials in a learning repository.
