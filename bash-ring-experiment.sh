#!/bin/bash

FILE=/tmp/file
KEY=/home/.ssh/aws_keypair.pem
    #Find the next server to send it to
        if [[ $MYIP = "192.168.10.230" ]]; then #IP from Frodo
                scp -i $KEY $NUMBER_FILE xxx.xxx.xx.xx:/tmp/file #copy the file to Sauron
        fi
        if [ $? -eq 0 ]; then
            echo File share successful
        else
            echo File share failed
        fi

        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then #IP from Sauron
                scp -i $KEY $NUMBER_FILE xxx.xxx.xx.xx:/tmp/file #copy the file to Legolas
        fi
        if [ $? -eq 0 ]; then
            echo File share successful
        else
            echo File share failed
        fi

        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then #IP from Legolas
                scp -i $KEY $NUMBER_FILE xxx.xxx.xx.xx:/tmp/file #IP from Gollum
        fi
        if [ $? -eq 0 ]; then
            echo File share successful
        else
            echo File share failed
        fi

        if [[ $MYIP = "xxx.xxx.xx.xx" ]]; then #IP from Gollum
                scp -i $KEY $NUMBER_FILE xxx.xxx.xx.xx:/tmp/file #Back to Frodo
        fi
        if [ $? -eq 0 ]; then
            echo File share successful
        else
            echo File share failed
        fi
# We still need to increment the file before it passes to the next server.
# Should we add the loop from line 26 on top of the code instead?

        cp x to y >> response.txt
        check reponse.txt if status is successful
        output = reponse.txt
        rm $NUMBER_FILE


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
done #Sammy asked us to finish this block

number_file.sh


# #Amina's code
# $ source ~/.bashrc

# $ echo $PATH
