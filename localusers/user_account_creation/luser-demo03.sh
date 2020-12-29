#!/bin/bash

# Display the UID an username of user exeecuting the script
# Diplay if the user is the vagrant user or not

# Display the UID. 
echo "Your UID is ${UID}"

UID_TEST_FOR=$(id -u)
# Only display if UID does not match
if [[ "${UID}" -ne ${UID_TEST_FOR} ]]
then
	echo "Your UID doesnt not match ${UID_TEST_FOR}"
	exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Test if the command suceeded
if [[ "${?}" -ne 0 ]]
then
	echo "The id command didnt exit sucessfully"
	exit 1
fi
echo "your username is ${USER_NAME}"

# You can use a string test conditional.
USER_NAME_TO_TEST_FOR='vagrant'

# == : for pattern matching on the rhs
# = : for exact value
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Your user name matches ${USER_NAME_TO_TEST_FOR}"
fi

# Test for != (not equal) for the string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then	
	echo "Your user name matches ${USER_NAME_TO_TEST_FOR}"
fi


exit 0
