echo -e "\e[33m Copy mongo repo file\e[0m"
cp /home/centos/project1/bash/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33m Install MongoDB \e[0m"
dnf install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33m Update mongoDB Listen Address \e[0m"
sed -i  's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>/tmp/roboshop.log

echo -e "\e[33m Enable Mongodb \e[0m"
systemctl enable mongod &>>/tmp/roboshop.log

echo -e "\e[33m Restart MongoDb \e[0m"
systemctl restart mongod &>>/tmp/roboshop.log