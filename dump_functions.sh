#!/bin/bash

### Start Configuration

path_to_DumperExe="/mnt/e/repos/TypeTreeDumper/TypeTreeDumper.Bootstrapper/bin/Release/net472/TypeTreeDumper.BootStrapper.exe"
path_to_OutputFolder="/mnt/e/repos/TypeTreeDumper/TypeTreeDumper.Bootstrapper/bin/Release/net472/Output"
path_to_UnityInstallations="/mnt/g/TypeTreeDumps/UnityInstallations"
current_assembly_version="v000"

### End Configuration


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
	mkdir -p "Assemblies/${current_assembly_version}"
	mkdir -p "Classes"
	mkdir -p "RTTI_Dump"
	mkdir -p "StringsData"
	mkdir -p "StructsData/editor"
	mkdir -p "StructsData/release"
	mkdir -p "StructsDump/editor"
	mkdir -p "StructsDump/release"
}

function dump() {
  i=$1
  if [ -d "UnityInstallations/$i" ]; then
    echo Dumping $i...
	rm -rf ${path_to_OutputFolder}
	mkdir -p ${path_to_OutputFolder}
	"${path_to_DumperExe}" "`wslpath -w ${path_to_UnityInstallations}`"/$i/Editor/Unity.exe --silent --output "`wslpath -w ${path_to_OutputFolder}`"
	cp ${path_to_OutputFolder}/classes.json Classes/$i.json
	cp ${path_to_OutputFolder}/RTTI.dump RTTI_Dump/$i.dump
	cp ${path_to_OutputFolder}/strings.dat StringsData/$i.dat
	cp ${path_to_OutputFolder}/editor_structs.dat StructsData/editor/$i.dat
	cp ${path_to_OutputFolder}/structs.dat StructsData/release/$i.dat
	cp ${path_to_OutputFolder}/editor_structs.dump StructsDump/editor/$i.dump
	cp ${path_to_OutputFolder}/structs.dump StructsDump/release/$i.dump
  else
    echo Unity $i missing, skipped
  fi
}

# Make Directories
echo Making Directories
make_directories