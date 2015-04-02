#!/bin/bash
set -e

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

# DRY: Lookup VM name/id
LOOKUP=$(grep -Po "(?<=vb.name\s=\s).*" Vagrantfile)
VM_NAME=${LOOKUP//\"}

echo "$VM_NAME - Configure VM with vagrant and ansible"
vagrant destroy -f && vagrant up && vagrant halt

echo "$VM_NAME - Export VM as an OVF file"
if  [ ! -d "$SCRIPTPATH/dist/" ]; then
    mkdir -p "$SCRIPTPATH/dist/"
fi
VBoxManage export $VM_NAME -o $SCRIPTPATH/dist/$VM_NAME.ovf --ovf20 --manifest

echo "$VM_NAME - OVF file exported to dist/$VM_NAME.ovf"