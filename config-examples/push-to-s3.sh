#!/bin/bash
ALDL_LOG_PATH=/var/log/aldl
FILE_MASK=*.csv
aws s3 cp $ALDL_LOG_PATH s3://pi-tools --recursive --exclude "*" --include "$FILE_MASK"
if [ $? -eq 0 ]; then
	mv $ALDL_LOG_PATH/$FILE_MASK $ALDL_LOG_PATH/pushed
fi
