#!/bin/bash -x

umask 0077

DATE=$(date +%F-%H-%M-%S)
OUTPUT_DIR=/home/deploy
OUTPUT_FILE=${OUTPUT_DIR}/DBBACKUPS/proddb_dump_${DATE}.sql
OUTPUT_NAME_GZ=proddb_dump_${DATE}.sql.gz
ACCESS_TOKEN=`cat /tmp/token.txt`

/usr/bin/mysqldump -u deploy -[Password] mymenu_db > ${OUTPUT_FILE}
RET=$?
if [ ${RET} -ne 0 ]
then
	logger "MySQL Dump Failed"
else
	gzip -f ${OUTPUT_FILE}
	scp ${OUTPUT_FILE}".gz" [username]@[ServerIP]:/mnt/volume_sfo3_01/dbbackups/.
	### Upload file to google drive
	curl -X POST -L -H "Authorization: Bearer "$ACCESS_TOKEN""  -F 'metadata={name : "'"$OUTPUT_NAME_GZ"'"};type=application/json;charset=UTF-8' -F "file=@$OUTPUT_FILE;type=application/zip" "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"
fi
