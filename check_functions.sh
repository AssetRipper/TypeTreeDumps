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
	fi
}
