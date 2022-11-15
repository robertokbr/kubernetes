package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	var PORT = os.Getenv("PORT")

	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)

		fmt.Fprintf(w, "pong on port %s", PORT)
	})

	log.Printf("Server started on port %s", PORT)
	log.Fatalf("Server failed to start due to: %v", http.ListenAndServe(PORT, nil))
}
