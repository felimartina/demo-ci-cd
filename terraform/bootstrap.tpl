#!/bin/bash
# Install Code Depoy Agent (http://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html)
apt-get update

apt-get install ruby wget python awscli -y

# Upgrade awscli to latest version (https://github.com/aws/aws-cli/issues/1926)
pip install --upgrade awscli

cd /home/ubuntu

wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install

chmod +x ./install

./install auto

service codedeploy-agent start

# Install Cloudwatch Logs Agent so we can see CodeDeploy logs in CloudWatch (https://aws.amazon.com/blogs/devops/view-aws-codedeploy-logs-in-amazon-cloudwatch-console/)
wget https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py

wget https://s3.amazonaws.com/aws-codedeploy-us-east-1/cloudwatch/codedeploy_logs.conf

chmod +x ./awslogs-agent-setup.py

sudo python awslogs-agent-setup.py -n -r us-east-1 -c s3://aws-codedeploy-us-east-1/cloudwatch/awslogs.conf

mkdir -p /var/awslogs/etc/config

cp codedeploy_logs.conf /var/awslogs/etc/config/

service awslogs restart

# Install NodeJS
export NODE_VERSION="6.10.0"
wget -qO- https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz | tar xJ --directory /usr/local
ln -s /usr/local/node-v$NODE_VERSION-linux-x64 /usr/local/node
export PATH=/usr/local/node/bin/:$PATH

# Install PM2
npm install pm2 -g
