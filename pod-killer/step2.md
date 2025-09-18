## Step 2 - Install LitmusChaos

Now let’s install the LitmusChaos operator, which manages chaos experiments in Kubernetes.

Run the following command:
```bash
kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.15.0.yaml
```
Wait until all operator Pods are running:
```bash
kubectl -n litmus get pods
```
You should see Pods such as `litmus-operator` and `chaos-operator`.

### Note:
If your environment does not allow internet downloads, use the preloaded file /root/litmus-operator.yaml instead:
```bash
kubectl apply -f /root/litmus-operator.yaml
```