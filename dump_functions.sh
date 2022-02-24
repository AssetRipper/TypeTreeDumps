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
	if [ $# = 0 ]
	then
		echo At least one argument required
		exit 2
	elif [ $# = 1 ]
	then
		force_dump=false
	elif [ $2 = "-f" ] || [ $2 = "--force" ]
	then
		force_dump=true
	else
		force_dump=false
	fi

	if [ -d "${path_to_UnityInstallations}/$1" ]; then
		if [ $force_dump = false ] && [ -f "$(dirname "$0")/Classes/$1.json" ]; then
			echo Already Dumped $1
		else
			echo Dumping $1...
			rm -rf ${path_to_OutputFolder}
			mkdir -p ${path_to_OutputFolder}
			"${path_to_DumperExe}" "`wslpath -w ${path_to_UnityInstallations}`"/$1/Editor/Unity.exe --silent --output "`wslpath -w ${path_to_OutputFolder}`"
			cp ${path_to_OutputFolder}/classes.json $(dirname "$0")/Classes/$1.json
			cp ${path_to_OutputFolder}/info.json $(dirname "$0")/InfoJson/$1.json
			cp ${path_to_OutputFolder}/RTTI.dump $(dirname "$0")/RTTI_Dump/$1.dump
			cp ${path_to_OutputFolder}/strings.dat $(dirname "$0")/StringsData/$1.dat
			cp ${path_to_OutputFolder}/editor_structs.dat $(dirname "$0")/StructsData/editor/$1.dat
			cp ${path_to_OutputFolder}/structs.dat $(dirname "$0")/StructsData/release/$1.dat
			cp ${path_to_OutputFolder}/editor_structs.dump $(dirname "$0")/StructsDump/editor/$1.dump
			cp ${path_to_OutputFolder}/structs.dump $(dirname "$0")/StructsDump/release/$1.dump
		fi
	else
		echo Unity $1 missing, skipped
	fi
}

# Make Directories
echo Making Directories
make_directories