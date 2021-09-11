#!/bin/bash

. $(dirname "$0")/configuration.sh

if [ -f "${path_to_DumperExe}" ]; then
	echo TypeTreeDumper Exists
else
	echo TypeTreeDumper doesnt exist
fi
if [ -d "${path_to_OutputFolder}" ]; then
	echo Output Folder Exists
else
	echo Output Folder doesnt exist
fi
if [ -d "${path_to_UnityInstallations}" ]; then
	echo Unity Folder Exists
else
	echo Unity Folder doesnt exist
fi


function make_directories() {
	mkdir -p "$(dirname "$0")/Classes"
	mkdir -p "$(dirname "$0")/InfoJson"
	mkdir -p "$(dirname "$0")/RTTI_Dump"
	mkdir -p "$(dirname "$0")/StringsData"
	mkdir -p "$(dirname "$0")/StructsData/editor"
	mkdir -p "$(dirname "$0")/StructsData/release"
	mkdir -p "$(dirname "$0")/StructsDump/editor"
	mkdir -p "$(dirname "$0")/StructsDump/release"
}

function dump() {
	i=$1
	if [ -d "${path_to_UnityInstallations}/$i" ]; then
		if [ -f "$(dirname "$0")/Classes/$i.json" ]; then
			echo Already Dumped $i
		else
			echo Dumping $i...
			rm -rf ${path_to_OutputFolder}
			mkdir -p ${path_to_OutputFolder}
			"${path_to_DumperExe}" "`wslpath -w ${path_to_UnityInstallations}`"/$i/Editor/Unity.exe --silent --output "`wslpath -w ${path_to_OutputFolder}`"
			cp ${path_to_OutputFolder}/classes.json $(dirname "$0")/Classes/$i.json
			cp ${path_to_OutputFolder}/info.json $(dirname "$0")/InfoJson/$i.json
			cp ${path_to_OutputFolder}/RTTI.dump $(dirname "$0")/RTTI_Dump/$i.dump
			cp ${path_to_OutputFolder}/strings.dat $(dirname "$0")/StringsData/$i.dat
			cp ${path_to_OutputFolder}/editor_structs.dat $(dirname "$0")/StructsData/editor/$i.dat
			cp ${path_to_OutputFolder}/structs.dat $(dirname "$0")/StructsData/release/$i.dat
			cp ${path_to_OutputFolder}/editor_structs.dump $(dirname "$0")/StructsDump/editor/$i.dump
			cp ${path_to_OutputFolder}/structs.dump $(dirname "$0")/StructsDump/release/$i.dump
		fi
	else
		echo Unity $i missing, skipped
	fi
}

# Make Directories
echo Making Directories
make_directories