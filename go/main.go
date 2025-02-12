package main

import "C"

func main() {}

//export AddGo
func AddGo(n1, n2 C.int) C.int {
    return n1 + n2
}
