package main

import (
	"context"
	"log"
	"net/http"
	"net/http/httptest"
	"regexp"
	"testing"
	"time"

	"github.com/chromedp/chromedp"
)

func TestIndexHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "/asdfasd", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(HandleGet)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf(
			"unexpected status: got (%v) want (%v)",
			status,
			http.StatusOK,
		)
	}

}

func TestClickChange(t *testing.T) {

	http.HandleFunc("/", HandleGet)

	server := http.Server{
		Addr: ":33885",
	}
	go server.ListenAndServe()

	// create chrome instance
	ctx, cancel := chromedp.NewContext(
		context.Background(),
		chromedp.WithLogf(log.Printf),
	)
	defer cancel()

	// create a timeout
	ctx, cancel = context.WithTimeout(ctx, 15*time.Second)
	defer cancel()

	// navigate to a page, wait for an element, click
	var output string
	err := chromedp.Run(ctx,
		chromedp.Navigate("http://localhost:33885/"),
		// find and click "Expand All" link
		chromedp.Click(`#roller`, chromedp.NodeVisible),
		// retrieve the value of the textarea
		chromedp.InnerHTML("#roll", &output),
	)
	if err != nil {
		log.Fatal(err)
	}

	matched, _ := regexp.MatchString(`You rolled a [1-6] and a [1-6]`, output)

	if !matched {
		t.Errorf(
			"unexpected result: got (%v)",
			output,
		)
	}

	server.Close()
}
