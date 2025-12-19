#!/bin/bash

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

# 7-Zip Argument explanations
# https://sevenzip.osdn.jp/chm/cmdline/syntax.htm
# x : extract with full paths
# -bb0 : disable logging
# -bd : disable progress indicator
# -aoa : overwrite all existing files without prompt
# >/dev/null : redirect standard output to the null file
# 2>&1 : redirect standard error to standard output

extractNORMAL() {
	if [ -f "${path_to_UnitySetup}/UnitySetup64-$1.exe" ]; then
		echo Extracting normal $1...
		mkdir -p "${path_to_UnityInstallations}/$1"
		cd "${path_to_UnityInstallations}/$1"
			"${path_to_7zip}" x -bb0 -bd -aoa "`wslpath -w ${path_to_UnitySetup}`"/UnitySetup64-$1.exe >/dev/null 2>&1
		cd ../..
	else
		echo Unity $1 missing, skipped
	fi
}

extractOLD() {
	if [ -f "${path_to_UnitySetup}/UnitySetup-$1.exe" ]; then
		echo Extracting old $1...
		mkdir -p "${path_to_UnityInstallations}/$1/Editor"
		cd "${path_to_UnityInstallations}/$1/Editor"
			"${path_to_7zip}" x -bb0 -bd -aoa "`wslpath -w ${path_to_UnitySetup}`"/UnitySetup-$1.exe >/dev/null 2>&1
		cd ../../..
	else
		echo Unity $1 missing, skipped
	fi
}

extractNSIS() {
	if [ -f "${path_to_UnitySetup}/UnitySetup64-$1.exe" ]; then
		# Note: This is considered to be a silent install, not just a file extract.
		echo Extracting nsis $1...

		local exe_win
		local dst_win
		exe_win=$(wslpath -w "${path_to_UnitySetup}/UnitySetup64-$1.exe")
		dst_win=$(wslpath -w "${path_to_UnityInstallations}")\\$1

		cmd.exe /C "$exe_win /S /D=$dst_win"
	else
		echo Unity $1 missing, skipped
	fi
}

function extract() {
	if [ $# = 0 ]
	then
		echo At least one argument required
		exit 1
	elif [ ${#1} = 0 ]
	then
		echo Argument has no length
		exit 2
	elif [ $# = 1 ]
	then
		force_extract=false
	elif [ $2 = "-f" ] || [ $2 = "--force" ]
	then
		force_extract=true
	else
		force_extract=false
	fi

	if [ -d "${path_to_UnityInstallations}/$1" ]; then
		if [ $force_extract = false ]; then
			return
		else
			echo "Removing $1"
			rm -f -r "${path_to_UnityInstallations}/$1"
		fi
	fi

	if [ ${1:0:2} != "20" ] && [ ${1:0:4} != "6000" ] #Unity 5 or earlier
	then
		if [ ${1:0:1} = "5" ] #Unity 5
		then
			extractNORMAL $1
		else #Unity 4 or earlier
			extractOLD $1
		fi
	elif [ ${1:0:3} = "201" ] || [ ${1:0:6} = "2020.1" ] #Unity 2017 - 2020.1
	then
		extractNORMAL $1
	else #Unity 2020.2 and later
		extractNSIS $1
	fi
}