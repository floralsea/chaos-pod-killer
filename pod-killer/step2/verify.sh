#!/bin/bash
echo "Creating sample application..."
kubectl create deployment nginx --image=nginx:latest
kubectl scale deployment nginx --replicas=3
kubectl expose deployment nginx --port=80

echo "Waiting for Pods to be ready..."
kubectl wait --for=condition=ready pod -l app=nginx --timeout=60s
kubectl get pods -o wide