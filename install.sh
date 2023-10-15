# Install Script
#/bin/bash
echo "Started Install."

# build and deploy
make -i build-all
make -i deploy-all

echo "Finished Install."