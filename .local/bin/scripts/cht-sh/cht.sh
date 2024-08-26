#!/usr/bin/env bash

lang=` echo "golang cpp typescript nodejs python c java javascript zsh lua bash php" | tr ' ' '\n'`

echo "${lang}"

read -p "Select language: " selected

read -p "Search: " query

if echo "$lang" | grep -qw "$selected"; then
  query=$(echo "$query" | tr ' ' '+')
 curl cht.sh/$selected/$query
  echo "Press any key to exit..."
  read -n 1
else
  echo "Wrong format"
fi
