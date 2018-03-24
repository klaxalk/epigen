#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

echo ""

for i in {1..18}; do

  echo "Running test $i"
  bash "$i/test.sh"
  echo ""

done
