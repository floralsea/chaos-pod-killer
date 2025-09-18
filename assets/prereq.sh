#!/bin/bash
set -e

# Switch to the root working directory
cd /root || exit 1

# Ensure kubectl is available (included in most Kubernetes images). If not, try installing it (alternative).
if ! command -v kubectl >/dev/null 2>&1; then
  echo "Installing kubectl..."
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  mv kubectl /usr/local/bin/
fi

# Create a namespace
kubectl create ns chaos-demo || true
kubectl config set-context --current --namespace=chaos-demo

# Ensure core DNS/nodes are ready (poll and wait if necessary)
echo "Waiting for nodes and core components..."
kubectl get nodes -o wide || true
sleep 2

# Place assets in /root (Killercoda will place assets in the user directory based on index.json)
echo "Prereq script finished."
