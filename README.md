## create k8s:

```
bash k8s.sh
```

## USE ISTIO GATEWAY

```
bash istio.sh
```

or

## USE NGINX INGRESS

```
bash nginx.sh
```


add /etc/hosts - 127.0.0.1 nginx1.example.com

## TEST

```
cd serverclient/cli
# plaintext
go run main.go
# public tls
go run mains.go
# client-server tls
go run mainsm.go
```