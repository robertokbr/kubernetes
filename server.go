package main

import (
	"log"
	"net/http"
)

const PORT = ":8080"

func main() {
	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("pong"))
	})

	log.Printf("Server started on port %s", PORT)
	log.Fatalf("Server failed to start due to: %v", http.ListenAndServe(PORT, nil))
}
