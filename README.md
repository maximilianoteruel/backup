Ejemplo de .yml

    backup:
      image: maximilianoteruel/backups:latest
      volumes:
        - db_backup:/usr/src/app/backup/src/db
        - media_afip_taxpayers:/usr/src/app/backup/src/media_afip_taxpayers
        - backup_config:/root/.config
        - backup_log:/usr/src/app/log
        - backup_full:/usr/src/app/backup/full

Configurar Rclone:

- attach shell en el docker y seguir los siguientes pasos:

```bash
rclone config
opcion n
nombre del remote: hoc
storage type: 13
Enter
Enter
tipo de acceso: 1
Enter
Enter
Enter
Auto Config NO
acceder al link y pegar el codigo de verificacion
Enter
Enter
q
```

Variables de Entorno:

```bash
- CRON_INCREMENTAL=0_3_*_*_*
- CRON_FULL=30_3_15_*_*
```

Va a realizar los siguientes backups:

- incremental: todos los dias a las 3am
- full: todos los dias 15 a las 3:30am
