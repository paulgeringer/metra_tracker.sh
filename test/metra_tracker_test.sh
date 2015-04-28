#!/bin/bash

source ../metra_tracker
source assert.sh

line='UP-N'
departure='RAVENSWOOD'
destination='OTC'

retrieved_json=$(cat default.json)
echo "$line $departure $destination $retrieved_json" > /dev/null # shellcheck

function train_order() {
  cat <<MESSAGE
train1
train2
train3
train4
train5
train6
train7
train8
train9
train10
MESSAGE
}

function red_error() {
  echo "There are no trains scheduled for the specified route currently."
}

function strip_color() {
  gsed -r "s:\x1B\[[0-9;]*[mK]::g"
}

function test_train_order() {
  trains=$(get_train_hash_numbers)
  trains_sorted=$(train_order)
  assert [ "$trains" = "$trains_sorted" ]
}

function test_error_check() {
  retrieved_json=$(cat no_trains.json)
  line='UP-N'
  departure='RAVENSWOOD'
  destination='OTC'
  error_string=$(check_for_errors)
  assert [ $? = 1 ]
  assert [ "$(echo "$error_string" | strip_color)" = "$(red_error)" ]
}

function test_strip_quotes() {
  string="'q'uo\"t'e\"s"
  stripped_string=$(echo "$string" | strip_quotes)
  assert [ "$stripped_string" = "quotes" ]
}

function test_strip_spaces() {
  string="s pa   c es  "
  stripped_string=$(echo "$string" | strip_spaces)
  assert [ "$stripped_string" = "spaces" ]
}

test_train_order
test_error_check
test_strip_quotes
test_strip_spaces
