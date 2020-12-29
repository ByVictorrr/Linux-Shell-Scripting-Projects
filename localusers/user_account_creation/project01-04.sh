#!/bin/bash


# First check to see if user executing this is root
if [[ "${UID}" != 0 ]]
then
	echo 'You are not root; run this script with root'
	exit 1
fi
# Get the username
read -p 'Enter the user name: ' USER_NAME

# Get the infomation such as there name
read -p 'Enter your full name: ' COMMENT

# Type in a default password
read -p 'Enter in a default password: ' PASSWORD

# Create a user with a home directory
adduser -c "${COMMENT}" -m "${USER_NAME}"
if [[ ${?} != 0 ]]
then
	echo 'The account could not be created.'
	exit 1
fi

# Put in the default password
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

if [[ ${?} != 0 ]]
then
	echo 'The password for the account could not be created.'
	exit 1
fi


# Make sure that it prompts them to change their passwd
passwd -e "${USER_NAME}"

echo
echo "username: ${USER_NAME}"
echo "password: ${PASSWORD}"
echo "host: ${HOSTNAME}"

exit 0
