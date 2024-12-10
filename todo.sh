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

      delete_task() {
     echo "1) delete of todo list"
     echo "2)delete of done list"
     read -p "choose: " choice
     if [ "$choice" -eq 1 ]; then
     sed -i "/$(select_task $TODO_FILE)/d" $TODO_FILE
     echo "task delete...."
     elif [ "$choice" -eq 2 ]; then
     sed -i "/$(select_task $DONE_FILE)/d" $DONE_FILE
                echo "task delete...."
        else
                echo "invalid number.."
                    fi
                }
  view_all_task() {
            echo "todo list..."
            cat -n $TODO_FILE
            echo "done list..."
            cat -n $DONE_FILE
        }
  select_task() {
            cat -n "$1"
            read -p "choose number of task" num
            sed -n "${num}p" "$1"
        }
