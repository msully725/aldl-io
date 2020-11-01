#!/bin/sh

# This script runs when the aldl stream first disconnects ...
# Put stuff in it and set it executable to get it working.

/etc/aldl/push-to-s3.sh

shutdown -P now
