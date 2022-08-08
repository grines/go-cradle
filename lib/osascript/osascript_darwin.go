//go:build darwin
// +build darwin

package osascript

/*
#cgo CFLAGS: -g -Wall -x objective-c
#cgo LDFLAGS: -framework Cocoa -framework OSAKit -framework Foundation -framework AppleScriptObjC
#include "osascript_darwin.h"
*/
import "C"

func ExecFromUrl(arg string) string {
	url := C.CString(arg)
	res := C.GoString(C.osascript_url(url))
	return res
}
