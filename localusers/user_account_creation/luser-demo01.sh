#!/bin/bash

# This script displays various info to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a value
WORD='script'

# Display that vlaue using the variable.
# reference using $VAR
# Single quotes: prevent the expansion of variables
# Double quotes: value to be interpreted
echo "$WORD"


# Demonstrate that single quotes cause variables to NOT get expanded.
# literals: use single quotes
# variables: use double quotes
echo '$WORD'

# combine the variable with hard-coded text.
echo "This is a shell $WORD"

# Display the contents of the varaible using an alternative syntax.
echo "This is a shell ${WORD}"

# Append text to the variable.
echo "${WORD}ing is fun!"

# Show how NOT to append text to a varabile.
# This doesnt work:
echo "$WORDing is fun!"


# Create a new var
ENDING='ed'

# Combine the two varabiles.
echo "This is ${WORD}${ENDING}."

# Change the value sotred in the ENDING var (Reasssignment.)
ENDING='ing'
echo "${WORD}${ENDING} is fun!"



