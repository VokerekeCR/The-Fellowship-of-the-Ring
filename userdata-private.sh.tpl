#!/bin/bash
cat <<EOF >> /home/ec2-user/.ssh/aws_keypair.pem
${private_key}
EOF
chown ec2-user:ec2-user /home/ec2-user/.ssh/aws_keypair.pem
chmod 600 /home/ec2-user/.ssh/aws_keypair.pem
#echo "#\!/bin/bash\nwhile 1=1;do /bin/bash /home/ec2-user/ring.sh; sleep 10; done" > challenge.sh
#chmod +x ./challenge.sh
#nohup ./challenge.sh & > /dev/null

crontab -l > mycron
echo "* * * * * /home/ec2-user/ring.sh" >> mycron
crontab mycron
