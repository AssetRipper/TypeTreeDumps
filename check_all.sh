#!/bin/bash

. $(dirname "$0")/configuration.sh

check_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	fi
	if ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
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

check_early_version() {
	i=$1
	if ! [ -d "${path_to_UnityInstallations}/$i" ]; then
		echo $i needs extracted
	fi
	if ! [ -f "$(dirname "$0")/Classes/$i.json" ]; then
		echo $i needs dumped
	else
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

# 3
for i in 3.4.0 3.4.1 3.4.2 3.5.0 3.5.1 3.5.2 3.5.3 3.5.4 3.5.5 3.5.6 3.5.7
do
	check_early_version $i
done

# 4.0, 4.1, 4.2, and 4.3 (no 4.4)
for i in 4.0.0 4.0.1 4.1.0 4.1.2 4.1.3 4.1.4 4.1.5 4.2.0 4.2.1 4.2.2 4.3.0 4.3.1 4.3.2 4.3.3 4.3.4
do
	check_early_version $i
done

# 4.5, 4.6, and 4.7
for i in 4.5.0 4.5.1 4.5.2 4.5.3 4.5.4 4.5.5 4.6.0 4.6.1 4.6.2 4.6.3 4.6.4 4.6.5 4.6.6 4.6.7 4.6.8 4.6.9 4.7.0 4.7.1 4.7.2
do
	check_early_version $i
done

# 5
for i in 5.3.0f4 5.3.1f1 5.3.2f1 5.3.3f1 5.3.4f1 5.3.5f1 5.3.6f1 5.3.7f1 5.3.8f2 5.4.0f3 5.4.1f1 5.4.2f2 5.4.3f1 5.4.4f1 5.4.5f1 5.4.6f3 5.5.0f3 5.5.1f1 5.5.2f1 5.5.3f1 5.5.4f1 5.5.5f1 5.5.6f1 5.6.0f3 5.6.1f1 5.6.2f1 5.6.3f1 5.6.4f1 5.6.5f1 5.6.6f2 5.6.7f1
do
	check_version $i
done

# 2017.1
for i in 2017.1.0f3 2017.1.1f1 2017.1.2f1 2017.1.3f1 2017.1.4f1 2017.1.5f1
do
	check_version $i
done

# 2017.2 and 2017.3
for i in 2017.2.0f3 2017.2.1f1 2017.2.2f1 2017.2.3f1 2017.2.4f1 2017.2.5f1 2017.3.0f3 2017.3.1f1
do
	check_version $i
done

# 2017.4
for i in 2017.4.1f1 2017.4.2f2 2017.4.3f1 2017.4.4f1 2017.4.5f1 2017.4.6f1 2017.4.7f1 2017.4.8f1 2017.4.9f1 2017.4.10f1 2017.4.11f1 2017.4.12f1 2017.4.13f1 2017.4.14f1 2017.4.15f1 2017.4.16f1 2017.4.17f1 2017.4.18f1 2017.4.19f1 2017.4.20f2 
do
	check_version $i
done

# 2017.4 continued
for i in 2017.4.21f1 2017.4.22f1 2017.4.23f1 2017.4.24f1 2017.4.25f1 2017.4.26f1 2017.4.27f1 2017.4.28f1 2017.4.29f1 2017.4.30f1 2017.4.31f1 2017.4.32f1 2017.4.33f1 2017.4.34f1 2017.4.35f1 2017.4.36f1 2017.4.37f1 2017.4.38f1 2017.4.39f1 2017.4.40f1
do
	check_version $i
done

# 2018.1
for i in 2018.1.0f2 2018.1.1f1 2018.1.2f1 2018.1.3f1 2018.1.4f1 2018.1.5f1 2018.1.6f1 2018.1.7f1 2018.1.8f1 2018.1.9f2
do
	check_version $i
done

# 2018.2
for i in 2018.2.0f2 2018.2.1f1 2018.2.2f1 2018.2.3f1 2018.2.4f1 2018.2.5f1 2018.2.6f1 2018.2.7f1 2018.2.8f1 2018.2.9f1 2018.2.10f1 2018.2.11f1 2018.2.12f1 2018.2.13f1 2018.2.14f1 2018.2.15f1 2018.2.16f1 2018.2.17f1 2018.2.18f1 2018.2.19f1 2018.2.20f1 2018.2.21f1
do
	check_version $i
done

# 2018.3
for i in 2018.3.0f2 2018.3.1f1 2018.3.2f1 2018.3.3f1 2018.3.4f1 2018.3.5f1 2018.3.6f1 2018.3.7f1 2018.3.8f1 2018.3.9f1 2018.3.10f1 2018.3.11f1 2018.3.12f1 2018.3.13f1 2018.3.14f1
do
	check_version $i
done

# 2018.4
for i in 2018.4.0f1 2018.4.1f1 2018.4.2f1 2018.4.3f1 2018.4.4f1 2018.4.5f1 2018.4.6f1 2018.4.7f1 2018.4.8f1 2018.4.9f1 2018.4.10f1 2018.4.11f1 2018.4.12f1 2018.4.13f1 2018.4.14f1 2018.4.15f1 2018.4.16f1 2018.4.17f1 2018.4.18f1
do
	check_version $i
done

# 2018.4 continued
for i in 2018.4.19f1 2018.4.20f1 2018.4.21f1 2018.4.22f1 2018.4.23f1 2018.4.24f1 2018.4.25f1 2018.4.26f1 2018.4.27f1 2018.4.28f1 2018.4.29f1 2018.4.30f1 2018.4.31f1 2018.4.32f1 2018.4.33f1 2018.4.34f1 2018.4.35f1 2018.4.36f1
do
	check_version $i
done

# 2019.1
for i in 2019.1.0f2 2019.1.1f1 2019.1.2f1 2019.1.3f1 2019.1.4f1 2019.1.5f1 2019.1.6f1 2019.1.7f1 2019.1.8f1 2019.1.9f1 2019.1.10f1 2019.1.11f1 2019.1.12f1 2019.1.13f1 2019.1.14f1
do
	check_version $i
done

# 2019.2
for i in 2019.2.0f1 2019.2.1f1 2019.2.2f1 2019.2.3f1 2019.2.4f1 2019.2.5f1 2019.2.6f1 2019.2.7f2 2019.2.8f1 2019.2.9f1 2019.2.10f1 2019.2.11f1 2019.2.12f1 2019.2.13f1 2019.2.14f1 2019.2.15f1 2019.2.16f1 2019.2.17f1 2019.2.18f1 2019.2.19f1 2019.2.20f1 2019.2.21f1
do
	check_version $i
done

# 2019.3
for i in 2019.3.0f6 2019.3.1f1 2019.3.2f1 2019.3.3f1 2019.3.4f1 2019.3.5f1 2019.3.6f1 2019.3.7f1 2019.3.8f1 2019.3.9f1 2019.3.10f1 2019.3.11f1 2019.3.12f1 2019.3.13f1 2019.3.14f1 2019.3.15f1
do
	check_version $i
done

# 2019.4
for i in 2019.4.0f1 2019.4.1f1 2019.4.2f1 2019.4.3f1 2019.4.4f1 2019.4.5f1 2019.4.6f1 2019.4.7f1 2019.4.8f1 2019.4.9f1 2019.4.10f1 2019.4.11f1 2019.4.12f1 2019.4.13f1 2019.4.14f1 2019.4.15f1 2019.4.16f1 2019.4.17f1 2019.4.18f1 2019.4.19f1 2019.4.20f1
do
	check_version $i
done

# 2019.4 continued
for i in 2019.4.21f1 2019.4.22f1 2019.4.23f1 2019.4.24f1 2019.4.25f1 2019.4.26f1 2019.4.27f1 2019.4.28f1 2019.4.29f1 2019.4.30f1
do
	check_version $i
done

# 2020.1
for i in 2020.1.0f1 2020.1.1f1 2020.1.2f1 2020.1.3f1 2020.1.4f1 2020.1.5f1 2020.1.6f1 2020.1.7f1 2020.1.8f1 2020.1.9f1 2020.1.10f1 2020.1.11f1 2020.1.12f1 2020.1.13f1 2020.1.14f1 2020.1.15f1 2020.1.16f1 2020.1.17f1
do
	check_version $i
done

# 2020.2
for i in 2020.2.0f1 2020.2.1f1 2020.2.2f1 2020.2.3f1 2020.2.4f1 2020.2.5f1 2020.2.6f1 2020.2.7f1
do
	check_version $i
done

# 2020.3
for i in 2020.3.0f1 2020.3.1f1 2020.3.2f1 2020.3.3f1 2020.3.4f1 2020.3.5f1 2020.3.6f1 2020.3.7f1 2020.3.8f1 2020.3.9f1 2020.3.10f1 2020.3.11f1 2020.3.12f1 2020.3.13f1 2020.3.14f1 2020.3.15f2 2020.3.16f1 2020.3.17f1
do
	check_version $i
done

# 2021.1
for i in 2021.1.0f1 2021.1.1f1 2021.1.2f1 2021.1.3f1 2021.1.4f1 2021.1.5f1 2021.1.6f1 2021.1.7f1 2021.1.9f1 2021.1.10f1 2021.1.11f1 2021.1.12f1 2021.1.13f1 2021.1.14f1 2021.1.15f1 2021.1.16f1 2021.1.17f1 2021.1.18f1 2021.1.19f1
do
	check_version $i
done

# 2021.2 betas
for i in 2021.2.0b4 2021.2.0b9
do
	check_version $i
done