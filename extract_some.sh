#!/bin/bash

. $(dirname "$0")/extract_functions.sh

for i in 4.3.0 4.5.4 2018.1.8f1
do
    extract $i
done