#!/bin/bash
cat <<EOF >> /home/ec2-user/ring.sh
#!/bin/bash

FILE=/tmp/output
KEY=/home/.ssh/aws_keypair.pem
if test -f "$FILE"; then
    # Read file and increment the number
    num=\$(cat \$FILE)
	num=\$((num+=1))
	echo \$num > \$FILE
        MYIP=`ifconfig eth0 | awk '\$1 == "inet" {print \$2}'`
        #Find the next server to send it to
            if [[ \$MYIP = "${private_ip1}" ]]; then
                    scp -i \$KEY \$FILE ${private_ip2}:/tmp/output
            fi
            if [[ \$MYIP = "${private_ip2}" ]]; then
                    scp -i \$KEY \$FILE ${private_ip3}:/tmp/output
            fi
            if [[ \$MYIP = "${private_ip3}" ]]; then
                    scp -i \$KEY \$FILE ${private_ip4}:/tmp/output
            fi
            if [[ \$MYIP = "${private_ip4}" ]]; then
                    scp -i \$KEY \$FILE ${private_ip1}:/tmp/output
            fi
        rm \$FILE
fi
EOF
chown ec2-user:ec2-user /home/ec2-user/ring.sh
chmod +x /home/ec2-user/ring.sh
cat <<EOF >> /home/ec2-user/.ssh/aws_keypair.pem
${private_key}
EOF
chown ec2-user:ec2-user /home/ec2-user/.ssh/aws_keypair.pem
chmod 600 /home/ec2-user/.ssh/aws_keypair.pem
echo "1" > /tmp/output
chown ec2-user:ec2-user /tmp/output
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /home/ec2-user/.ssh/aws_keypair.pem /tmp/output ec2-user@${private_ip1}:/tmp/output
scp -i /home/ec2-user/.ssh/aws_keypair.pem /home/ec2-user/ring.sh ec2-user@${private_ip1}:/home/ec2-user/ring.sh
scp -i /home/ec2-user/.ssh/aws_keypair.pem /home/ec2-user/ring.sh ec2-user@${private_ip2}:/home/ec2-user/ring.sh
scp -i /home/ec2-user/.ssh/aws_keypair.pem /home/ec2-user/ring.sh ec2-user@${private_ip3}:/home/ec2-user/ring.sh
scp -i /home/ec2-user/.ssh/aws_keypair.pem /home/ec2-user/ring.sh ec2-user@${private_ip4}:/home/ec2-user/ring.sh