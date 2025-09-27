package main

import (
	"fmt"
	"net/http"
)

var (
	task1     = "Watch other Golang course"
	task2     = "Watch tutorial"
	task3     = "Create Todolist app"
	reward1   = "Reward myself with a smoothie"
	taskItems = []string{task1, task2, reward1, task3}
)

func main() {
	cliApp()

	fmt.Println("Starting Web API")

	// Register handlers when serverhost/ pattern is visited in browser
	http.HandleFunc("/", helloUser)
	http.HandleFunc("/show-tasks", showTasks)
	http.ListenAndServe(":8080", nil)
}

func helloUser(writer http.ResponseWriter, request *http.Request) {
	greeting := "Hello, Welcome to Todolist App"
	fmt.Fprintln(writer, greeting)
}

func showTasks(writer http.ResponseWriter, request *http.Request) {
	for index, task := range taskItems {
		fmt.Fprintln(writer, index+1, ":", task)
	}
}

// Command line version of app
func cliApp() {
	fmt.Println("##### Todo List App #####")

	printTasks(taskItems)
	fmt.Println()
	taskItems = addTask(taskItems, "Go for a Walk")
	taskItems = addTask(taskItems, "Go problem set practice")
	fmt.Println("Updated List")
	printTasks(taskItems)
}

func printTasks(taskItems []string) {
	fmt.Println("List of Todos")
	for index, task := range taskItems {
		fmt.Printf("%d. %s\n", index+1, task)
	}
}

func addTask(taskItems []string, newTask string) []string {
	return append(taskItems, newTask)
}
