#!/bin/bash

FILE=/tmp/output
KEY=/home/.ssh/aws_keypair.pem
if test -f "$FILE"; then
    # Read file and increment the number
        num=\$(cat \$FILE)
	num=\$((num+=1))
	echo \$num > \$FILE
        MYIP=`ifconfig eth0 | awk '$1 == "inet" {print $2}'`
        #Find the next server to send it to
            if [[ $MYIP = "${private_ip1}" ]]; then
                    scp -i $KEY $FILE ${private_ip2}:/tmp/output
            fi
            if [[ $MYIP = "${private_ip2}" ]]; then
                    scp -i $KEY $FILE ${private_ip3}:/tmp/output
            fi
            if [[ $MYIP = "${private_ip3}" ]]; then
                    scp -i $KEY $FILE ${private_ip4}:/tmp/output
            fi
            if [[ $MYIP = "${private_ip4}" ]]; then
                    scp -i $KEY $FILE ${private_ip1}:/tmp/output
            fi
        rm $FILE
fi