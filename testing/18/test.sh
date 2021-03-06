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
cp "$INPUT_FILE" "/tmp/$TEST_OUTPUT_FILE"

cd /
epigen -m addition -s -f "tmp/$TEST_OUTPUT_FILE" -g TEST -c '\"\ %s'
epigen -m addition -s -f "tmp/$TEST_OUTPUT_FILE" -g TEST2 -c '\"\ %s'
epigen -m addition -s -f "tmp/$TEST_OUTPUT_FILE" -g TEST3 -c '\"\ %s'

# compare the output
diff "/tmp/$TEST_OUTPUT_FILE" "$MY_PATH/$EXPECTED_OUTPUT_FILE"

if [[ "$?" == "0" ]]; then
  echo "Test OK"
  exit 0
else
  echo "Test Failed!"
  exit 1
fi
