#!/bin/bash

# Loads the dump functions and makes the output directories if they don't already exist
. $(dirname "$0")/dump_functions.sh

# Just an example
# 2018.1
for i in 2018.1.0f2 2018.1.1f1 2018.1.2f1 2018.1.3f1 2018.1.4f1 2018.1.5f1 2018.1.6f1 2018.1.7f1 2018.1.8f1 2018.1.9f2
do
    dump $i
done
