echo -e "\e[35m Module Disable Nodejs \e[0m"
dnf module disable nodejs -y &>>/tmp/roboshop.log

echo -e "\e[35m Module enable Nodejs \e[0m"
dnf module enable nodejs:18 -y &>>/tmp/roboshop.log

echo -e "\e[35m Install Nodejs \e[0m"
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[35m Add user; Roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[35m Make App Directory \e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[35m Download User  Personalised artifacts \e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>/tmp/roboshop.log

echo -e "\e[35m Change to App Directory \e[0m"
cd /app

echo -e "\e[35m Extract downloaded file; user \e[0m"
unzip /tmp/user.zip &>>/tmp/roboshop.log

echo -e "\e[35m Change to App Directory\e[0m"
cd /app

echo -e "\e[35m Install npm \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[35m Copy User.service \e[0m"
cp root/project1/bash/user.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e  "\e[31m Reload Daemon\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[35m Enable user \e[0m"
systemctl enable user &>>/tmp/roboshop.log

echo -e "\e[35m Restart User \e[0m"
systemctl restart user &>>/tmp/roboshop.log



