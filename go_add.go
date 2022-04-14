package main

import "C"

//export add
func add(x, y C.int) C.int {
	return x + y
}

func main() {}
