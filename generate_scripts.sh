#!/bin/bash

. $(dirname "$0")/configuration.sh

vers=($(./get_unity_versions.sh | sort -t. -k1,1n -k2,2n -k3,3n))

# First argument is the file
# Second argument is the reference script
# Third argument is the command to be used on each version
function generate() {
	echo "#!/bin/bash" > "$1"
	echo ". \$(dirname \"\$0\")/$2" >> "$1"
	for ((i=0; i<${#vers[@]}; i++)); 
	do
		echo "$3 ${vers[i]}" >> "$1"
	done
}

generate check_all.sh check_functions.sh check_any_version

generate dump_all.sh dump_functions.sh dump

generate extract_all.sh extract_functions.sh extractANY