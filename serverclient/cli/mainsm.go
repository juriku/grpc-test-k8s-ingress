package main

import (
	"context"
	example "github.com/jwenz723/podlifecycle/server/proto"
	"google.golang.org/grpc"
	// "google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/credentials"
	"log"
	"time"
)

const (
	address = "nginx1.example.com:4431"
)

func main() {
	// Load the certificates from disk
	creds, err := credentials.NewClientTLSFromFile("../../new_certificates/server.crt", address)
	if err != nil {
			log.Fatalf("could not process the credentials: %v", err)
	}
	// Set up a connection to the server.
	conn, err := grpc.Dial(address, grpc.WithTransportCredentials(creds))
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := example.NewExampleClient(conn)

	for {
		time.Sleep(100 * time.Millisecond)
		ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
		defer cancel()
		r, err := c.Work(ctx, &example.WorkItem{
			Name: "test",
			Size: 0,
		})
		if err != nil {
			log.Printf("could not Work: %v", err)
			continue
		}
		log.Printf("Response: %s", r.GetName())
	}
}
