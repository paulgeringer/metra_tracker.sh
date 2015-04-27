#!/bin/bash

function assert() {
  string=$(echo "$*: " | tr -s "\r\n" ' ')
  echo -n "$string"
  "$@" > /dev/null 2>&1
  local ret=$?
  if [ $ret -ne 0 ]; then
    echo "Failed: errno $ret"
    exit 1
  else
    echo "Passed"
  fi
}
