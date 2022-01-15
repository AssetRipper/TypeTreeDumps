#!/bin/bash

# Notes:
#
# Some Unity 5 versions can stall the script
# The NSIS installed versions can randomly get skipped

. $(dirname "$0")/configuration.sh

if [ -d "${path_to_UnitySetup}" ]; then
	echo Unity Folder Exists
else
	echo Unity Folder doesnt exist
fi
if [ -f "${path_to_7zip}" ]; then
	echo 7Zip Exists
else
	echo 7Zip doesnt exist
fi

function extract() {
	i=$1
	if [ -d "${path_to_UnityInstallations}/$i" ]; then
		return
	fi
	#echo "${path_to_UnitySetup}/UnitySetup64-$i.exe"
	if [ -f "${path_to_UnitySetup}/UnitySetup64-$i.exe" ]; then
		echo Extracting normal $i...
		mkdir -p "${path_to_UnityInstallations}/$i"
		cd "${path_to_UnityInstallations}/$i"
			"${path_to_7zip}" x -bb0 -bd "`wslpath -w ${path_to_UnitySetup}`"/UnitySetup64-$i.exe >/dev/null 2>&1
		cd ../..
	else
		echo Unity $i missing, skipped
	fi
}

function extractOLD() {
	i=$1
	if [ -d "${path_to_UnityInstallations}/$i" ]; then
		return
	fi
	#echo "${path_to_UnitySetup}/UnitySetup-$i.exe"
	if [ -f "${path_to_UnitySetup}/UnitySetup-$i.exe" ]; then
			echo Extracting old $i...
		mkdir -p "${path_to_UnityInstallations}/$i/Editor"
		cd "${path_to_UnityInstallations}/$i/Editor"
			"${path_to_7zip}" x -bb0 -bd "`wslpath -w ${path_to_UnitySetup}`"/UnitySetup-$i.exe >/dev/null 2>&1
		cd ../../..
	else
		echo Unity $i missing, skipped
	fi
}

function extractNSIS() {
	i=$1
	if [ -d "${path_to_UnityInstallations}/$i" ]; then
		return
	fi
	if [ -f "${path_to_UnitySetup}/UnitySetup64-$i.exe" ]; then
			echo Extracting nsis $i...
			# Note: This is considered to be a silent install, not just a file extract, but we don't really care
			"${path_to_UnitySetup}/UnitySetup64-$i.exe" /S /D=`wslpath -w ${path_to_UnityInstallations}`\\$i &
			wait
	else
		echo Unity $i missing, skipped
	fi
}

function extractANY() {
	if [ ${#1} = 0 ]
	then
		echo "Argument has no length"
		exit 1
	fi

	if [ ${1:0:2} != "20" ] #Unity 5 or earlier
    then
        if [ ${1:0:1} = "5" ] #Unity 5
        then
            extract $1
		else #Unity 4 or earlier
			extractOLD $1
        fi
    elif [ ${1:0:3} = "201" ] || [ ${1:0:6} = "2020.1" ] #Unity 2017 - 2020.1
    then
        extract $1
	else #Unity 2020.2 and later
		extractNSIS $1
    fi
}