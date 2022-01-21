#!/usr/bin/env bash

# getting minix 3 iso file
get_minix_iso() {
	#TODO: another function to get this data dinamically
	local actual_version='R3.3.0-588a35b'
	local md5_hash='3234ffcebfb2a28069cf3def41c95dec'

	local minix_file='minix_version.iso.bz2'
	local link='http://download.minix3.org/iso'

	local minix_file_short_name="${minix_file/_version/}"

	if [ -e "$minix_file_short_name" ]; then
		echo "File exists!"

	else
		wget "${link}/${minix_file/version/${actual_version}}" \
			-O "$minix_file_short_name" \
			--quiet \
			--tries=3 \
			--show-progress
	fi
	
	file_validation "$minix_file_short_name" "$md5_hash" \
		&& return 0 || return 1
}

# validating the file integrity with md5 hash
file_validation() {
	local file_hash
	file_hash=$(md5sum < "$minix_file_short_name")
	file_hash="${file_hash::32}"

	[ "$file_hash" = "$md5_hash" ] && return 0 || return 1
}

# create_img() {}
# creating qemu img

# minix 3 pre-installation, aka: first boot
# pre_install() {}

# mini 3 day2day use
# start_minix3() {}

main() {
	get_minix_iso
	if [ $? = 0 ]; then
		echo "File integrity is ok."
	else
		echo "Something is wrong with this file"
	fi
}

main "$@"
