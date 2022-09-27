
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

## https://k3d.io/v5.4.6/usage/commands/k3d_cluster_create/
k3d cluster create --config cluster1-cfg.yml

openssl req \
-x509 -newkey rsa:4096 -sha256 -nodes \
-keyout tls.key -out tls.crt \
-subj "/CN=*.example.com" -days 365


## https://jwenz723.medium.com/deploy-kubernetes-grpc-workloads-with-zero-down-time-3585c146f74f
# git clone git@github.com:jwenz723/podlifecycle.git

# docker build -t juriku/grpc-test:1 ./serverclient/server
# docker push juriku/grpc-test:1


## add /etc/hosts - 127.0.0.1 nginx1.example.com

## change nginx1.example.com:4431 serverclient/cli/main.go
# cd serverclient/cli
# go run main.go

## grpcurl -v -insecure nginx1.example.com:4431 helloworld.Greeter/SayHello
