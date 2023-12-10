echo -e "\e[34m Install Python \e[0m"
dnf install python36 gcc python3-devel -y &>>/tmp/roboshop.log

echo -e "\e[34m Add user;Roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[34m Make Directory \e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[34m Download Payment Artifacts \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip &>>/tmp/roboshop.log


echo -e "\e[34m Change to App Directory \e[0m"
cd /app


echo -e "\e[34m Extract payment Artifact \e[0m"
unzip /tmp/payment.zip &>>/tmp/roboshop.log

echo -e "\e[34m Change to App directory \e[0m"
cd /app


echo -e "\e[34m download dependencies \e[0m"
pip3.6 install -r requirements.txt &>>/tmp/roboshop.log


echo -e "\e[34m Copy file to payment.service \e[0m"
cp /home/centos/project1/bash/payment.service /etc/systemd/system/payment.service &>>/tmp/roboshop.log


echo -e "\e[34m Reload Daemon \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log


echo -e "\e[34m Enable payment \e[0m"
systemctl enable payment &>>/tmp/roboshop.log


echo -e "\e[34m Restart payment \e[0m"
systemctl restart payment &>>/tmp/roboshop.log