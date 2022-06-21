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

check_version() {
	if ! [ -d "${path_to_UnityInstallations}/$1" ]; then
		echo $1 needs extracted
	elif ! [ -f "$(dirname "$0")/Classes/$1.json" ]; then
		echo $1 needs dumped
	else
		field_values_path="$(dirname "$0")/FieldValues/$1.json"
		if ! [ -f $field_values_path ]; then
			echo $1 missing field values json
		elif [ "$(is_empty_file $field_values_path)" = "true" ]; then
			echo $1 has an empty field values json
		fi
		info_json_path="$(dirname "$0")/InfoJson/$1.json"
		if ! [ -f $info_json_path ]; then
			echo $1 missing information json
		elif [ "$(is_empty_file $info_json_path)" = "true" ]; then
			echo $1 has an empty information json
		fi
		rtti_path="$(dirname "$0")/RTTI_Dump/$1.dump"
		if ! [ -f $rtti_path ]; then
			echo $1 missing RTTI dump
		elif [ "$(is_empty_file $rtti_path)" = "true" ]; then
			echo $1 has an empty RTTI dump
		fi
		strings_path="$(dirname "$0")/StringsData/$1.dat"
		if ! [ -f $strings_path ]; then
			echo $1 missing string data
		elif [ "$(is_empty_file $strings_path)" = "true" ]; then
			echo $1 has an empty string data
		fi
		editor_structs_data_path="$(dirname "$0")/StructsData/editor/$1.dat"
		if ! [ -f $editor_structs_data_path ]; then
			echo $1 missing editor structs data
		elif [ "$(is_empty_file $editor_structs_data_path)" = "true" ]; then
			echo $1 has an empty editor structs data
		fi
		release_structs_data_path="$(dirname "$0")/StructsData/release/$1.dat"
		if ! [ -f $release_structs_data_path ]; then
			echo $1 missing release structs data
		elif [ "$(is_empty_file $release_structs_data_path)" = "true" ]; then
			echo $1 has an empty release structs data
		fi
		editor_structs_dump_path="$(dirname "$0")/StructsDump/editor/$1.dump"
		if ! [ -f $editor_structs_dump_path ]; then
			echo $1 missing editor structs dump
		elif [ "$(is_empty_file $editor_structs_dump_path)" = "true" ]; then
			echo $1 has an empty editor structs dump
		fi
		release_structs_dump_path="$(dirname "$0")/StructsDump/release/$1.dump"
		if ! [ -f $release_structs_dump_path ]; then
			echo $1 missing release structs dump
		elif [ "$(is_empty_file $release_structs_dump_path)" = "true" ]; then
			echo $1 has an empty release structs dump
		fi
	fi
}

# Unity 3 and 4 don't have a string buffer
check_early_version() {
	if ! [ -d "${path_to_UnityInstallations}/$1" ]; then
		echo $1 needs extracted
	elif ! [ -f "$(dirname "$0")/Classes/$1.json" ]; then
		echo $1 needs dumped
	else
		info_json_path="$(dirname "$0")/InfoJson/$1.json"
		if ! [ -f $info_json_path ]; then
			echo $1 missing information json
		elif [ "$(is_empty_file $info_json_path)" = "true" ]; then
			echo $1 has an empty information json
		fi
		rtti_path="$(dirname "$0")/RTTI_Dump/$1.dump"
		if ! [ -f $rtti_path ]; then
			echo $1 missing RTTI dump
		elif [ "$(is_empty_file $rtti_path)" = "true" ]; then
			echo $1 has an empty RTTI dump
		fi
		editor_structs_data_path="$(dirname "$0")/StructsData/editor/$1.dat"
		if ! [ -f $editor_structs_data_path ]; then
			echo $1 missing editor structs data
		elif [ "$(is_empty_file $editor_structs_data_path)" = "true" ]; then
			echo $1 has an empty editor structs data
		fi
		release_structs_data_path="$(dirname "$0")/StructsData/release/$1.dat"
		if ! [ -f $release_structs_data_path ]; then
			echo $1 missing release structs data
		elif [ "$(is_empty_file $release_structs_data_path)" = "true" ]; then
			echo $1 has an empty release structs data
		fi
		editor_structs_dump_path="$(dirname "$0")/StructsDump/editor/$1.dump"
		if ! [ -f $editor_structs_dump_path ]; then
			echo $1 missing editor structs dump
		elif [ "$(is_empty_file $editor_structs_dump_path)" = "true" ]; then
			echo $1 has an empty editor structs dump
		fi
		release_structs_dump_path="$(dirname "$0")/StructsDump/release/$1.dump"
		if ! [ -f $release_structs_dump_path ]; then
			echo $1 missing release structs dump
		elif [ "$(is_empty_file $release_structs_dump_path)" = "true" ]; then
			echo $1 has an empty release structs dump
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
