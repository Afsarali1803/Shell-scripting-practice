#!/bin/bash

USERID=$(uid -u)

if [ $USERID ne 0 ]
then
    echo "Its a normal user"
else 
    echo "It is root user"
fi

yum install nginx -y
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"



cd /usr/share/nginx/html
rm -rf * > /
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl enable nginx
systemctl start nginx