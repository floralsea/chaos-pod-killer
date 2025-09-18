## Step 3 - Run the Pod-Delete Chaos Experiment

We will now inject chaos into the demo application by deleting one of its Pods.
Kubernetes should automatically restart the Pod, demonstrating self-healing.

Apply the ChaosEngine manifest:
```bash
kubectl apply -f /root/chaosengine-poddelete.yaml
```
Check the status:
```bash
kubectl get chaosengine -n chaos-demo
kubectl get chaosresult -n chaos-demo
```
Watch the Pods as the experiment runs:
```bash
kubectl get pods -w
```
### Observe the effect

Switch back to the loadgen terminal.
You may see a brief interruption or a change in the responding Pod name when one Pod is killed and replaced with a new one.

This demonstrates chaos injection and system recovery.