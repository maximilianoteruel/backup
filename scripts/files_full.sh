#!/bin/sh

date +"%Y-%m-%d %H:%M:%S - Compressing SRC ..."
now=$(date +"%Y_%m_%d_%H_%M_%S")
tar cvzf /usr/src/app/backup/full/$now.tar.gz /usr/src/app/backup/src/

date +"%Y-%m-%d %H:%M:%S - Starting Sync FULL ..."
rclone sync /usr/src/app/backup/full/ hoc:/backup/full/

date +"%Y-%m-%d %H:%M:%S - Sync FULL Finished"