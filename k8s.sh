
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

## https://k3d.io/v5.4.6/usage/commands/k3d_cluster_create/
k3d cluster create --config cluster1-cfg.yml

mkdir new_certificates
openssl req \
-x509 -newkey rsa:4096 -sha256 -nodes \
-keyout new_certificates/tls.key -out new_certificates/tls.crt \
-subj "/CN=*.example.com" -days 365

## https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/#generate-client-and-server-certificates-and-keys
mkdir new_certificates
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout new_certificates/server.key -out new_certificates/server.crt
openssl req -out new_certificates/client.csr -newkey rsa:2048 -nodes -keyout new_certificates/client.key -subj "/CN=*.example.com/O=httpbin organization"
openssl x509 -req -sha256 -days 365 -CA new_certificates/server.crt -CAkey new_certificates/server.key -set_serial 0 -in new_certificates/client.csr -out new_certificates/client.crt

## https://jwenz723.medium.com/deploy-kubernetes-grpc-workloads-with-zero-down-time-3585c146f74f
# git clone git@github.com:jwenz723/podlifecycle.git

# docker build -t juriku/grpc-test:1 ./serverclient/server
# docker push juriku/grpc-test:1


## add /etc/hosts - 127.0.0.1 nginx1.example.com

## change nginx1.example.com:4431 serverclient/cli/main.go
# cd serverclient/cli
# go run main.go

## grpcurl -v -insecure nginx1.example.com:4431 helloworld.Greeter/SayHello
