
### ISTIO
## https://brettmostert.medium.com/k3d-kubernetes-istio-service-mesh-286a7ba3a64f
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.15.1 TARGET_ARCH=$(uname -m) sh -
export PATH="$PATH:/Users/$USER/Desktop/grpc-test/istio-1.15.1/bin"
istioctl install
#
kubectl label namespace default istio-injection=enabled
#
kubectl create -n istio-system secret tls example-tls --key=tls.key --cert=tls.crt
#
kubectl apply -f cluster1/server1.yaml
kubectl apply -f cluster1/istio.yaml
## END ISTIO
