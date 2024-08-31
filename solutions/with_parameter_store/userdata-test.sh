#! /bin/bash -x
dnf update -y
dnf install python3 -y
dnf install python-pip -y
pip3 install Flask==2.3.3
pip3 install Flask-MySql
pip3 install boto3
dnf install git -y
echo "phonebook.cbanmzptkrzf.us-east-1.rds.amazonaws.com" > /home/ec2-user/dbserver.endpoint
cd /home/ec2-user
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /database/phonebook/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@https://github.com/ilhanigit/database-repo.git
python3 /home/ec2-user/phonebook-web-app/solutions/phonebook-app.py

