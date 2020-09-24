#!/bin/sh

if [ -z ${CRON_INCREMENTAL+x} ]; then
    date +"%Y-%m-%d %H:%M:%S - Environment Variable CRON_INCREMENTAL is not defined. Setting to CRON_INCREMENTAL=0_3_*_*_*"
    CRON_INCREMENTAL="0_3_*_*_*"
fi

if [ -z ${CRON_FULL+x} ]; then
    date +"%Y-%m-%d %H:%M:%S - Environment Variable CRON_FULL is not defined. Setting to CRON_FULL=30_3_15_*_*"
    CRON_FULL="30_3_15_*_*"
fi

crontab_config="/var/spool/cron/crontabs/root"

rm -f $crontab_config
touch $crontab_config

echo "${CRON_INCREMENTAL//_/ } /usr/src/app/scripts/files_incremental.sh >> /usr/src/app/log/cron.log 2>&1" >> $crontab_config
echo "${CRON_FULL//_/ } /usr/src/app/scripts/files_full.sh >> /usr/src/app/log/cron.log 2>&1" >> $crontab_config
echo "#" >> $crontab_config
chmod 0600 $crontab_config

date +"%Y-%m-%d %H:%M:%S - Starting Cron ..."
crond -f -L /usr/src/app/log/cron.log