#!/bin/bash
echo "Cleaning up chaos experiment resources..."
kubectl delete chaosengine nginx-chaos
kubectl delete -f https://hub.litmuschaos.io/api/chaos/2.14.0?file=charts/generic/pod-delete/experiment.yaml

echo "Deleting sample application..."
kubectl delete deployment nginx
kubectl delete service nginx

echo "Optional: Uninstall Litmus framework"
echo "kubectl delete -f https://litmuschaos.github.io/litmus/2.14.0/litmus-2.14.0.yaml"