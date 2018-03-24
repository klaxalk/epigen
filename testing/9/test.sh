#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

# where are the files
EXTENSION=".vimrc"
INPUT_FILE="input$EXTENSION"
EXPECTED_OUTPUT_FILE="expected_output$EXTENSION"
TEST_OUTPUT_FILE="test_output$EXTENSION"

# load epigen
source ../../epigen.sh

# do the thing 
cp "$INPUT_FILE" "$TEST_OUTPUT_FILE"
epigen reduction -s "$TEST_OUTPUT_FILE" TEST

# compare the output
diff "$TEST_OUTPUT_FILE" "$EXPECTED_OUTPUT_FILE"

if [[ "$?" == "0" ]]; then
  echo "Test OK"
  rm "$TEST_OUTPUT_FILE"
  exit 0
else
  echo "Test Failed!"
  exit 1
fi
