#!/bin/bash


read -p "entre a number of test work " number


for ((i=1; i<=number; i++)); do
  echo "start number  $i..."
  sleep 10
  echo "finished number $i."

  if ((i % 4 == 0)); then
    echo "rest 5 second"
    sleep 5
  else
    echo "rest 3 second"
    sleep 3
  fi
done

echo "finish goodLuck!"
