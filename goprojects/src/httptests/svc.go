package main

import "fmt"
import "net/http"
import "log"

func main(){
    fmt.Println("Trying to run service...")
    http.HandleFunc("/", handleSvc)
    log.Fatal(http.ListenAndServe(":8080", nil))
}

func handleSvc(w http.ResponseWriter, r *http.Request){
    fmt.Fprintf(w, "<html><body><p><b>Hello World</b></body></html>")
}   
