kubectl get pod,deployment,svc -n kube-system
kubectl logs -f pod/kube-apiserver-node -n kube-system
kubectl logs -f pod/kube-controller-manager-node -n kube-system
kubectl logs -f pod/kube-flannel-ds-5whjw -n kube-system
kubectl logs -f pod/kube-proxy-xdpvt -n kube-system
kubectl logs -f pod/kube-scheduler-node -n kube-system
kubectl logs -f pod/kubernetes-dashboard-78dc5f9d6b-vq4dl -n kube-system


kubectl get secret -n kube-system | grep dashboard  
kubectl describe secret kubernetes-dashboard-token-vq4dl -n kube-system 