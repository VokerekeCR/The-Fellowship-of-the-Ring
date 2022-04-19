#For list of servers and file to be looped & incremented

SERVER_LIST= /path/to/SERVER_LIST.txt
NUMBER_FILE= /path/to/NUMBER_FILE.txt

        #Loop script
        for server in $SERVER_LIST;  do
            #ping
            ping <EC2 EIP>
                
        done  < $SERVER_LIST