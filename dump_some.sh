#!/bin/bash

# Loads the dump functions and makes the output directories if they don't already exist
. $(dirname "$0")/dump_functions.sh

# Just an example
for i in 4.3.0 4.5.4 2018.1.8f1
do
    dump $i
done
