component=catalogue
color="\e[33m"
nocolor="\e[0m"

 echo -e "${color} Disable NodeJs ${nocolor}"
dnf module disable nodejs -y &>>/tmp/roboshop.log

echo -e "${color} Enable NodeJs ${nocolor}"
dnf module enable nodejs:18 -y &>>/tmp/roboshop.log

echo -e "${color} Install NodeJs ${nocolor}"
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "${color} Add user ${nocolor}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${color} Make Directory ${nocolor}"
mkdir /app &>>/tmp/roboshop.log


echo -e "${color} Download  Content ${nocolor}"
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>/tmp/roboshop.log

echo -e "${color} Change to App Directory ${nocolor}"
cd /app

echo -e "${color} Extract  content ${nocolor}"
unzip /tmp/$component.zip &>>/tmp/roboshop.log

echo -e "${color} Change to App Directory ${nocolor}"
cd /app

echo -e "${color} Install Npm ${nocolor}"
npm install &>>/tmp/roboshop.log

echo -e "${color} extracting frontend content ${nocolor}"
cp /home/centos/project1/bash/$component.service /etc/systemd/system/$component.service &>>/tmp/roboshop.log
#
echo -e "${color} Reload Daemon ${nocolor}"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "${color} Enable $component ${nocolor}"
systemctl enable $component &>>/tmp/roboshop.log

echo -e "${color} Start $component ${nocolor}"
systemctl start $component &>>/tmp/roboshop.log
#
echo -e "${color} Copy MongoDB Repo file ${nocolor}"
cp /home/centos/project1/bash/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "${color} Install MongoDB ${nocolor}"
dnf install mongodb-org-shell -y /&>>/tmp/roboshop.log

echo -e "${color} Load Schema ${nocolor}"
mongo --host mongodb-dev.lanim.store </app/schema/$component.js &>>/tmp/roboshop.log

