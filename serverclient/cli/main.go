package main

import (
	"context"
	example "github.com/jwenz723/podlifecycle/server/proto"
	"google.golang.org/grpc"
	// "google.golang.org/grpc/credentials/insecure"
	"log"
	"time"
)

const (
	address = "nginx1.example.com:801"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	// conn, err := grpc.Dial(address, grpc.WithTransportCredentials(insecure.NewCredentials()))
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
