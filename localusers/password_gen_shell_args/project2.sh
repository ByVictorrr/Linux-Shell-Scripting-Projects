#!/bin/bash

# An addition to the last project

SCRIPT_NAME=${0}
# Check to see if user is root
if [[ "${UID}" -ne 0 ]]
then
	echo "You must be root user to run this script."
	exit 1
fi
# Check the usage
if [[ "${#}" -ne 2 ]]
then
	echo "Usage: ${SCRIPT_NAME} <user-name> <full-name>"
	exit 1
fi

# Get both parameters
USER_NAME="${1}"
COMMENT="${2}"

# Add the user
adduser -c "${COMMENT}" -m "${USER_NAME}"
if [[ "${?}" != 0 ]]
then
	echo "Could not create a username of ${USER_NAME}."
	exit 1
fi

# Come up with some way to make password strong
PASSWORD=$(date +%s%N | sha256sum | head -c48)
echo ${PASSWORD}

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
if [[ ${?} != 0 ]]
then
	echo "Could not create a password for ${USER_NAME}."
	exit 1
fi

# Have the password expire, so when they login they have to enter a new one
passwd -e ${USER_NAME}

# Display the info out
echo "username: ${USER_NAME}"
echo "password: ${PASSWORD}"
echo "host: ${HOSTNAME}"



