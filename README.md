# Backups

Rclone scheduled backups.

## Features

It has 2 types of backups:

- incremental: sync data between origin and destination
  - origin: /usr/src/app/backup/src/incremental
  - destination: rclone(hoc) > backup/src
- full: create a tar file from origin and sync to destination
  - origin: /usr/src/app/backup/src
  - destination: rclone(hoc) > backup/full

## Environment Variables

```bash
- CRON_INCREMENTAL=0_3_*_*_*
- CRON_FULL=30_3_15_*_*
```

## Configure Rclone to GDrive

Attach shell at the docker container and follow the steps:

```bash
rclone config
[option] n
[name to use] hoc
[storage type] 13
Enter
Enter
[access type] 1
Enter
Enter
Enter
[Auto Config] NO
[access to the link and paste the verification code]
Enter
Enter
[option] q
```

## How to use

Example .yml:

```bash
  backups:
    image: maximilianoteruel/backups:latest
    volumes:
      - volume_1_incremental:/usr/src/app/backup/src/incremental/1
      - volume_2_incremental:/usr/src/app/backup/src/incremental/2
      - volume_3_full:/usr/src/app/backup/src/3
      - volume_4_full:/usr/src/app/backup/src/4
      - backups_config:/root/.config
      - backups_log:/usr/src/app/log
      - backups_full:/usr/src/app/backup/full
```
