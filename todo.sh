#!/bin/bash

# shellcheck disable=SC1068
Todo_FILE = "todo.txt"
Done_FILE = "done.txt"

echo $Todo_FILE

 show_menu() {
  echo "-------------------------"
  echo "ToDo Management"
  echo "1) add new task"
  echo "2) delete task"
  echo "3) view all task"
  echo "4) serch in list"
  echo "5) Exist"
  echo "-------------------------"
  echo "tsst "
}

 add_task() {
            read -p "write new task" task
            echo "$task" >> $TODO_FILE
            echo "task added."
        }
