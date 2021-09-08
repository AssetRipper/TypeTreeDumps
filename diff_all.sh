#!/bin/bash

echo Running difference on class json files
cd Classes
./diffs.sh
cd ..

echo
echo Running difference on runtime type info dumps
cd RTTI_Dump
./diffs.sh
cd ..