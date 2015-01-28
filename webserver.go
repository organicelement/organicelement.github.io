package main
import (
    // "github.com/gorilla/mux"
    "net/http"
)
func main() {
    // r := mux.NewRouter()
    // r.HandleFunc("/", HomeHandler)

    //These will work
    //first alternative
    // http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("."))))
    
    // http.Handle("/", r)
    http.ListenAndServe(":3000", http.FileServer(http.Dir(".")))
    // http.ListenAndServe(":3000", nil)    
}
// func HomeHandler(rw http.ResponseWriter, req *http.Request) {
    // rw.Write([]byte("You are at /"))
// }