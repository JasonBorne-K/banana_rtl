#!/bin/bash



mv 3MB.mdt R_3MB_1.mdt

cnt=1
old=1
while (("${cnt}"<10001));do
do
	echo R_3MB_"${old}".mdt
	curl -T R_3MB_"${old}".mdt -a -u RTL:seba12345! ftp://ebrave.iptime.org:12121 -m 60
	if [ $? -ne 0 ]; then
	break;
	fi

	((cnt="${cnt}"+1))
	mv R_3MB_"${old}".mdt R_3MB_"${cnt}".mdt
	((old="${old}"+1))
	sleep 1
done




mv R_3MB_$old.mdt 3MB.mdt
echo "TEST Finished!!!"