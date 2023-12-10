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


echo -e "\e[35m Download cart  Personalised artifacts \e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log


echo -e "\e[35m Change to App Directory \e[0m"
cd /app


echo -e "\e[35m Extract downloaded file;  \e[0m"
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "\e[35m Change to App Directory \e[0m"
cd /app



echo -e "\e[35m Install npm \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[35m Copy cart.service \e[0m"
cp /home/centos/project1/bash/cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e  "\e[31m Reload Daemon\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[35m Enable cart \e[0m"
systemctl enable cart &>>/tmp/roboshop.log

echo -e "\e[35m Restart cart \e[0m"
systemctl restart cart &>>/tmp/roboshop.log



