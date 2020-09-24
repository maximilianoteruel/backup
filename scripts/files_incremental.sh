#!/bin/sh

date +"%Y-%m-%d %H:%M:%S - Starting Sync SRC/INCREMENTAL ..."
rclone sync /usr/src/app/backup/src/incremental/ hoc:/backup/src/
date +"%Y-%m-%d %H:%M:%S - Sync SRC Finished"