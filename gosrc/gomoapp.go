package gomoapp

import (
	"fmt"
	"encoding/json"
	"net/http"
	"io/ioutil"
	"strings"
	"time"
)

func Hello(name string) string {
	return fmt.Sprintf("Hello, %s!", name)
}

func FooInJSON(jstr string) (string) {
	var j map[string]interface{}
	if err := json.Unmarshal([]byte(jstr), &j); err != nil {
		return ""
	}
	return j["foo"].(string)
}

func HTTPGet(url string) (string) {
	res, err := http.Get("http://example.com/")
	if err != nil {
		return ""
	}
	defer res.Body.Close()
	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return ""
	}
	return strings.Replace(string(body), "\n", "", -1)
}

var (
	i = 0
	ticker *time.Ticker
)

func Tick() int {
	if ticker == nil {
		ticker = time.NewTicker(1 * time.Second)
	}
	<-ticker.C
	i += 1
	return i
}

func GoRoutine() string {
	ch := make(chan string)

	go func() {
		time.Sleep(2 * time.Second)
		ch<-"hello"
		time.Sleep(2 * time.Second)
	}()
	return <-ch
}
