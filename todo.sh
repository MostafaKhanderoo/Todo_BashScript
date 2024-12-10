#!/bin/bash


Todo_FILE="todo.txt"
Done_FILE="done.txt"

show_menu() {
  echo "-------------------------"
  echo "ToDo"
  echo "1) Add new task"
  echo "2) Delete task"
  echo "3) View all tasks"
  echo "4) Search in list"
  echo "5) Mark task as done"
  echo "6) Exit"
  echo "-------------------------"
}


add_task() {
  read -p "Write new task: " task
  if [ -n "$task" ]; then
    echo "$task" >> "$Todo_FILE"
    echo "Task added."
  else
    echo "Task cannot be empty!"
  fi
}


delete_task() {
  echo "1) Delete from todo list"
  echo "2) Delete from done list"
  read -p "Choose: " choice
  if [ "$choice" -eq 1 ]; then
    cat -n "$Todo_FILE"
    read -p "Enter task number to delete: " num
    sed -i "${num}d" "$Todo_FILE"
    echo "Task deleted from todo list."
  elif [ "$choice" -eq 2 ]; then
    cat -n "$Done_FILE"
    read -p "Enter task number to delete: " num
    sed -i "${num}d" "$Done_FILE"
    echo "Task deleted from done list."
  else
    echo "Invalid choice."
  fi
}


view_all_task() {
  echo "Todo list:"
  cat -n "$Todo_FILE"
  echo "Done list:"
  cat -n "$Done_FILE"
}

search_tasks() {
  read -p "Enter search keyword: " keyword
  echo "Todo list:"
  grep --color=always -n "$keyword" "$Todo_FILE" || echo "No match found."
  echo "Done list:"
  grep --color=always -n "$keyword" "$Done_FILE" || echo "No match found."
}


mark_as_done() {
  echo "Todo list:"
  cat -n "$Todo_FILE"

  read -p "Enter the task number to mark as done: " num
  task=$(sed -n "${num}p" "$Todo_FILE")

  if [ -n "$task" ]; then

    if ! grep -Fxq "$task" "$Done_FILE"; then
      echo "$task" >> "$Done_FILE"
    fi
    sed -i "${num}d" "$Todo_FILE"
    echo "Task marked as done."
  else
    echo "Invalid task number."
  fi
}

while true; do
  show_menu
  read -p "Choose a number: " option
  case $option in
    1) add_task ;;
    2) delete_task ;;
    3) view_all_task ;;
    4) search_tasks ;;
    5) mark_as_done ;;
    6) exit ;;
    *) echo "Invalid number." ;;
  esac
done
