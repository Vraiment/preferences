#!/bin/bash

# This is a smart script that will search for an executable file with the same
# filename as this scripts' in the directories list in the "$WIN_PATH"
# environment variable. Ex: if the script is called "explorer.exe" then when is
# executed if there is an executable file file called "explorer.exe" in the
# environment variable "$WIN_PATH" then that file will be executed. If no file
# is found then the script fails. It is recommended to have a single script and
# create symbolic links with the corresponding names for the executables.

EXECUTABLE=$(basename "${0}"); shift
DIRS=$(echo ${WIN_PATH} | tr ':' "\n") 

for DIR in $DIRS; do
    FULL_PATH="${DIR}/${EXECUTABLE}"
    if [ -x "${FULL_PATH}" ]; then
        exec "${FULL_PATH}"
    fi
done

echo "${EXECUTABLE} not found in \$WIN_PATH"
exit 127
