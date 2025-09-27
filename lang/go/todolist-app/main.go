package main

import "fmt"

func main() {
	task1 := "Watch other Golang course"
	task2 := "Watch tutorial"
	reward1 := "Reward myself with a smoothie"
	taskItems := []string{task1, task2, reward1}

	fmt.Println("Todo List App")

	fmt.Println("List of Todos")
	fmt.Println()
	fmt.Println("Golang Tutorial todolist app")
	fmt.Println(task1)
	fmt.Println(task2)
	fmt.Println()
	fmt.Println("Projects")
	fmt.Println(task1)
	fmt.Println()
	fmt.Println("Rewards")
	fmt.Println(reward1)
}
