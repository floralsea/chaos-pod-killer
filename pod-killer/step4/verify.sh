#!/bin/bash
echo "Creating chaos experiment configuration..."
cat > pod-delete-engine.yaml <<EOF
apiVersion: litmuschaos.io/v1alpha1
kind: ChaosEngine
metadata:
  name: nginx-chaos
  namespace: default
spec:
  appinfo:
    appns: default
    applabel: app=nginx
    appkind: deployment
  annotationCheck: 'false'
  engineState: 'active'
  chaosServiceAccount: litmus-admin
  experiments:
  - name: pod-delete
    spec:
      components:
        env:
        - name: TOTAL_CHAOS_DURATION
          value: '30'
        - name: CHAOS_INTERVAL
          value: '10'
        - name: FORCE
          value: 'false'
EOF

kubectl apply -f pod-delete-engine.yaml
echo "Chaos experiment started!"