#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

echo ""

for i in {1..23}; do

  echo "Running test $i"
  bash "$i/test.sh"
    
  if [[ ! "$?" == 0 ]]; then 
    
    echo "A TEST HAS FAILED!"
    break

  fi

  echo ""

done
