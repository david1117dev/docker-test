#!/bin/bash

# Change to the working directory
cd /home/container

# Output Current Java Version
java -version

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Additional setup commands if needed

# Run the Server
exec ${MODIFIED_STARTUP}
