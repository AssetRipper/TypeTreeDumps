#!/bin/bash

. $(dirname "$0")/configuration.sh

is_empty_file() {
	size=$(wc -c <"$1")
	if [ $size -gt 0 ]; then
		echo false
	else
		echo true
	fi
}

function check_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	elif ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
		info_json_path="$(dirname "$0")/InfoJson/$i.json"
		if ! [ -f $info_json_path ]; then
			echo $i missing information json
		elif [ "$(is_empty_file $info_json_path)" = "true" ]; then
			echo $i has an empty information json
		fi
		rtti_path="$(dirname "$0")/RTTI_Dump/$i.dump"
		if ! [ -f $rtti_path ]; then
			echo $i missing RTTI dump
		elif [ "$(is_empty_file $rtti_path)" = "true" ]; then
			echo $i has an empty RTTI dump
		fi
		strings_path="$(dirname "$0")/StringsData/$i.dat"
		if ! [ -f $strings_path ]; then
			echo $i missing string data
		elif [ "$(is_empty_file $strings_path)" = "true" ]; then
			echo $i has an empty string data
		fi
		editor_structs_data_path="$(dirname "$0")/StructsData/editor/$i.dat"
		if ! [ -f $editor_structs_data_path ]; then
			echo $i missing editor structs data
		elif [ "$(is_empty_file $editor_structs_data_path)" = "true" ]; then
			echo $i has an empty editor structs data
		fi
		release_structs_data_path="$(dirname "$0")/StructsData/release/$i.dat"
		if ! [ -f $release_structs_data_path ]; then
			echo $i missing release structs data
		elif [ "$(is_empty_file $release_structs_data_path)" = "true" ]; then
			echo $i has an empty release structs data
		fi
		editor_structs_dump_path="$(dirname "$0")/StructsDump/editor/$i.dump"
		if ! [ -f $editor_structs_dump_path ]; then
			echo $i missing editor structs dump
		elif [ "$(is_empty_file $editor_structs_dump_path)" = "true" ]; then
			echo $i has an empty editor structs dump
		fi
		release_structs_dump_path="$(dirname "$0")/StructsDump/release/$i.dump"
		if ! [ -f $release_structs_dump_path ]; then
			echo $i missing release structs dump
		elif [ "$(is_empty_file $release_structs_dump_path)" = "true" ]; then
			echo $i has an empty release structs dump
		fi
	fi
}

# Unity 3 and 4 don't have a string buffer
function check_early_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	elif ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
		info_json_path="$(dirname "$0")/InfoJson/$i.json"
		if ! [ -f $info_json_path ]; then
			echo $i missing information json
		elif [ "$(is_empty_file $info_json_path)" = "true" ]; then
			echo $i has an empty information json
		fi
		rtti_path="$(dirname "$0")/RTTI_Dump/$i.dump"
		if ! [ -f $rtti_path ]; then
			echo $i missing RTTI dump
		elif [ "$(is_empty_file $rtti_path)" = "true" ]; then
			echo $i has an empty RTTI dump
		fi
		editor_structs_data_path="$(dirname "$0")/StructsData/editor/$i.dat"
		if ! [ -f $editor_structs_data_path ]; then
			echo $i missing editor structs data
		elif [ "$(is_empty_file $editor_structs_data_path)" = "true" ]; then
			echo $i has an empty editor structs data
		fi
		release_structs_data_path="$(dirname "$0")/StructsData/release/$i.dat"
		if ! [ -f $release_structs_data_path ]; then
			echo $i missing release structs data
		elif [ "$(is_empty_file $release_structs_data_path)" = "true" ]; then
			echo $i has an empty release structs data
		fi
		editor_structs_dump_path="$(dirname "$0")/StructsDump/editor/$i.dump"
		if ! [ -f $editor_structs_dump_path ]; then
			echo $i missing editor structs dump
		elif [ "$(is_empty_file $editor_structs_dump_path)" = "true" ]; then
			echo $i has an empty editor structs dump
		fi
		release_structs_dump_path="$(dirname "$0")/StructsDump/release/$i.dump"
		if ! [ -f $release_structs_dump_path ]; then
			echo $i missing release structs dump
		elif [ "$(is_empty_file $release_structs_dump_path)" = "true" ]; then
			echo $i has an empty release structs dump
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
