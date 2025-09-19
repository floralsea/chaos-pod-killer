## Step 1 - Deploy a Demo Application

We will deploy a simple application that echoes the Pod name.  
This allows us to see which Pod is responding to user requests.

Run the following commands to create the Deployment and Service:

```bash
kubectl apply -f /app-deploy.yaml
kubectl rollout status deployment/demo
kubectl get pods -o wide
kubectl get svc demo-svc
```

### Verify the service

Let’s generate continuous traffic to the service, simulating user requests.

Start a load generator Pod:
```bash
kubectl run -i --tty loadgen --image=radial/busyboxplus:curl --restart=Never -- /bin/sh
```
Inside the new shell, run:
```bash
while true; do date; curl -sS demo-svc:80/; echo; sleep 1; done
```
You should see output like:
```bash
Mon Sep 15 10:01:23 UTC 2025
hello from pod demo-7f5d6c9b7b-xyz12
```
Different requests may be served by different Pods.
