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
	err := indexTmpl.Execute(w, nil)
	if err != nil {
		http.Error(w, err.Error(), 500)
	}
}

// App - struct to hold router for testing and production
type App struct {
	Router *mux.Router
}

// Init - load routes into app
func (a *App) Init() {
	a.Router = mux.NewRouter()
	a.Router.HandleFunc("/", HandleGet).Methods("GET")
}

func main() {

	port := os.Getenv("PORT")
	if port == "" {
		port = "9000"
		log.Printf("Defaulting to port %s", port)
	}

	a := App{}
	a.Init()

	http.Handle("/", a.Router)

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
