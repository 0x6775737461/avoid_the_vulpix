#!/usr/bin/env bash

start_vm() {
	qemu-system-x86_64 -enable-kvm \
		-cpu host \
		-netdev user,id=vmnic,hostname=minix \
		-device virtio-net,netdev=vmnic \
		-m 256 \
		-drive file=minix.img,format=raw \
		"$@"
}

#TODO: this script will server for post-install
# ex: ./start_vm

