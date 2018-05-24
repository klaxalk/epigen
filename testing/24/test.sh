#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

# where are the files
EXTENSION=".vimrc"

# load epigen
source ../../epigen.sh

# do the thing 
for i in {1..3}; do

  INPUT_FILE="input$i$EXTENSION"
  EXPECTED_OUTPUT_FILE="expected_output$i$EXTENSION"
  TEST_OUTPUT_FILE="test_output$i$EXTENSION"

  cp "$INPUT_FILE" "$TEST_OUTPUT_FILE"

  if [[ "$i" == 1 ]]; then
    epigen -m addition -s -g "TEST1" -f "$TEST_OUTPUT_FILE" -c '\"\ %s'
  elif [[ "$i" == 2 ]]; then
    epigen -m addition -s -g "TEST1" -f "$TEST_OUTPUT_FILE" -c '\1\1\ %s'
  elif [[ "$i" == 3 ]]; then
    epigen -m addition -s -g "TEST1" -f "$TEST_OUTPUT_FILE" -c '\/\/\ %s'
  fi

  # compare the output
  diff "$TEST_OUTPUT_FILE" "$EXPECTED_OUTPUT_FILE"

  if [[ "$?" == "0" ]]; then
    echo "Test OK"
    rm "$TEST_OUTPUT_FILE"
  else
    echo "Test Failed!"
    exit 1
  fi

done

exit 0

echo ""
