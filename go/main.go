package main

import "C"

func main() {}

//export Add
func Add(n1, n2 int) int {
    return n1 + n2
}
