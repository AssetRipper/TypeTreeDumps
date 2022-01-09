#!/bin/bash

. $(dirname "$0")/configuration.sh

function check_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	elif ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
		if ! [ -f "$(dirname "$0")/InfoJson/$i.json" ]; then
			echo $i missing information json
		fi
		if ! [ -f "$(dirname "$0")/RTTI_Dump/$i.dump" ]; then
			echo $i missing RTTI dump
		fi
		if ! [ -f "$(dirname "$0")/StringsData/$i.dat" ]; then
			echo $i missing string data
		fi
		if ! [ -f "$(dirname "$0")/StructsData/editor/$i.dat" ]; then
			echo $i needs editor structs data
		fi
		if ! [ -f "$(dirname "$0")/StructsData/release/$i.dat" ]; then
			echo $i needs release structs data
		fi
		if ! [ -f "$(dirname "$0")/StructsDump/editor/$i.dump" ]; then
			echo $i needs editor structs dump
		fi
		if ! [ -f "$(dirname "$0")/StructsDump/release/$i.dump" ]; then
			echo $i needs release structs dump
		fi
	fi
}

# Unity 3 and 4 don't have a string buffer
function check_early_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	fi
	if ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
		if ! [ -f "$(dirname "$0")/InfoJson/$i.json" ]; then
			echo $i missing information json
		fi
		if ! [ -f "$(dirname "$0")/RTTI_Dump/$i.dump" ]; then
			echo $i missing RTTI dump
		fi
		if ! [ -f "$(dirname "$0")/StructsData/editor/$i.dat" ]; then
			echo $i needs editor structs data
		fi
		if ! [ -f "$(dirname "$0")/StructsData/release/$i.dat" ]; then
			echo $i needs release structs data
		fi
		if ! [ -f "$(dirname "$0")/StructsDump/editor/$i.dump" ]; then
			echo $i needs editor structs dump
		fi
		if ! [ -f "$(dirname "$0")/StructsDump/release/$i.dump" ]; then
			echo $i needs release structs dump
		fi
	fi
}

function check_any_version() {
	if [ ${1:0:2} = "20" ]
	then
	   check_version $1
	elif [ ${1:0:1} = "5" ]
	then
	   check_version $1
	else
		check_early_version $1
	fi
}