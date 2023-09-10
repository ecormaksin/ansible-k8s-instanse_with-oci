#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: spacify playbook file name(with extension) to execute at localhost."
    exit 1
fi

cd `dirname $0`

PLAYBOOK_FILE_NAME=$1

ansible-playbook -vv -i ./inventories/localhost.yml --extra-vars @vars_per_env.yml "./playbooks/${PLAYBOOK_FILE_NAME}"

exit 0
