#!/usr/bin/env bash

# getting minix 3 iso file
get_minix_iso() {
	#TODO: another function to get this data dinamically
	local actual_version='R3.3.0-588a35b'
	local md5_hash='3234ffcebfb2a28069cf3def41c95dec'

	local minix_file='minix_version.iso.bz2'
	local link='http://download.minix3.org/iso'

	wget "${link}/${minix_file/version/${actual_version}}" \
		-O 'minix3.iso'
		--no-verbose \
		--tries=3 \
		--show-progress
}

# minix 3 have a hash to test?
# file_validation() {}

# create_img() {}
# creating qemu img

# minix 3 pre-installation, aka: first boot
# pre_install() {}

# mini 3 day2day use
# start_minix3() {}

main() {
	get_minix_iso
}

main "$@"
