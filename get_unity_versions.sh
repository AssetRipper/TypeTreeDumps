#!/bin/bash

. $(dirname "$0")/configuration.sh

cd $path_to_UnitySetup
vers=($(ls))
cd ..

for ((i=0; i<${#vers[@]}; i++)); 
do
	if [ ${vers[i]:0:11} = "UnitySetup-" ]
	then
	   echo ${vers[i]:11:-4}
	elif [ ${vers[i]:0:13} = "UnitySetup64-" ]
	then
	   echo ${vers[i]:13:-4}
	fi
done