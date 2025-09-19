#!/bin/bash
echo "Monitoring experiment status..."
kubectl get chaosengine nginx-chaos -o yaml
echo "Viewing experiment events..."
kubectl describe chaosresult nginx-chaos-pod-delete

echo "Observing Pod recovery process..."
watch -n 2 'kubectl get pods -l app=nginx'