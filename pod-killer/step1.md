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

Inside the new shell, you can run:
```bash
# run for 10 seconds
timeout 10 sh -c 'while true; do date; curl -sS demo-svc:80/; echo; sleep 1; done'
```

Instead, you can also run, but this is a infinite loop:
```bash
while true; do date; curl -sS demo-svc:80/; echo; sleep 1; done
```
If you want to exit, you should run the following commandline in another terminal, i.e., open another `Tab` and input:
```bash
kubectl delete pod loadgen
```
The shell will shut down later.

You should see output like:
```bash
Mon Sep 15 10:01:23 UTC 2025
hello from pod demo-7f5d6c9b7b-xyz12
```
Different requests may be served by different Pods.
