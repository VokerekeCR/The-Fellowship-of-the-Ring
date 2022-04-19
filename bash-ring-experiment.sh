#!/bin/bash

FILE=/tmp/file
KEY=/home/.ssh/aws_keypair.pem
    #Find the next server to send it to
        if [[ $MYIP = "192.168.10.230" ]]; then #IP from Frodo
                scp -i $KEY $NUMBER_FILE xxx.xxx.xx.xx:/tmp/file #copy the file to Sauron
        fi
        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then #IP from Sauron
                scp -i $KEY $FILE xxx.xxx.xx.xx:/tmp/file #copy the file to Legolas
        fi
        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then
                scp -i $KEY $FILE xxx.xxx.xx.xx:/tmp/file
        fi
        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then
                scp -i $KEY $FILE xxx.xxx.xx.xx:/tmp/file
        fi

        cp x to y >> response.txt
        check reponse.txt if status is suceessful
        output = reponse.txt
        rm $FILE


#For list of servers and file to be looped & incremented
SERVER_LIST= /path/to/SERVER_LIST.txt
NUMBER_FILE= /path/to/NUMBER_FILE.txt
        #Loop script
        for server in $SERVER”_LIST;  do
            #ping
            ping <EC2 EIP>
        done  < $SERVER_LIST

#1/bin/bash
for 1 = 1 ((i=0; i<4; i++)); do
  echo $i
  sleep 10
done

number_file.sh


# #Amina's code
# $ source ~/.bashrc

# $ echo $PATH
