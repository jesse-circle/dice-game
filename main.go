package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

var indexTmpl = template.Must(template.ParseFiles("templates/index.html"))

// HandleGet - HTTP GET
func HandleGet(w http.ResponseWriter, r *http.Request) {
	indexTmpl.Execute(w, nil)
}

func main() {

	port := os.Getenv("PORT")
	if port == "" {
		port = "9000"
		log.Printf("Defaulting to port %s", port)
	}

	r := mux.NewRouter()
	r.HandleFunc("/", HandleGet)
	http.Handle("/", r)

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
