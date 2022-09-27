
## NGINX INGRESS
## https://github.com/scaamanho/k3d-cluster/blob/master/Ingress-Controller.md
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml
#
kubectl create secret tls example-tls --cert=tls.crt --key=tls.key
#
kubectl apply -f cluster1/server1.yaml
kubectl apply -f cluster1/ingress.yaml
## END NGINX INGRESS
