#!/bin/bash
echo "Installing Litmus Chaos Operator..."
kubectl apply -f https://litmuschaos.github.io/litmus/2.14.0/litmus-2.14.0.yaml

echo "Waiting for Litmus components to be ready..."
kubectl wait --for=condition=available deployment/litmus -n litmus --timeout=120s

echo "Creating Pod Delete experiment template..."
kubectl apply -f https://hub.litmuschaos.io/api/chaos/2.14.0?file=charts/generic/pod-delete/experiment.yaml