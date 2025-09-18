## Step 4 - Observe and Analyze Results

When the experiment finishes, review the results:
```bash
kubectl get chaosresult -n chaos-demo
kubectl describe chaosresult pod-delete-engine-demo -n chaos-demo
```
### Key questions to consider

1. How long did it take for Kubernetes to restart the Pod?

2. Did the service experience downtime from the user’s perspective?

3. How could we improve resilience?

- Readiness and liveness probes

- Multiple replicas

- Pod Disruption Budgets (PDBs)

- Autoscaling

### Clean up

When you are done, clean up the resources:
```bash
kubectl delete chaosengine pod-delete-engine -n chaos-demo
kubectl delete -f /root/app-deploy.yaml -n chaos-demo
kubectl delete ns chaos-demo
```
If you also want to uninstall LitmusChaos:
```bash
kubectl delete -f https://litmuschaos.github.io/litmus/litmus-operator-v1.15.0.yaml
```

### Easter Egg
Run the following command to celebrate:
```bash
cat <<'EOF'
  ____ _                _      _    _           
 / ___| |__   ___  __ _| | ___| | _(_)_ __  ___ 
| |   | '_ \ / _ \/ _` | |/ _ \ |/ / | '_ \/ __|
| |___| | | |  __/ (_| | |  __/   <| | | | \__ \
 \____|_| |_|\___|\__,_|_|\___|_|\_\_|_| |_|___/
 
Chaos completed — "Chaos is a ladder"
EOF
```
