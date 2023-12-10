echo -e "\e[35m Install Golang \e[0m"
dnf install golang -y &>>/tmp/roboshop.log

echo -e "\e[35m User add Roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[35m Make App Directory \e[0m"
mkdir /app &>>/tmp/roboshop.log


echo -e "\e[35m Download dispatch artifact \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip &>>/tmp/roboshop.log


echo -e "\e[35m Change to App Directory \e[0m"
cd /app


echo -e "\e[35m Extract dispatch artifact \e[0m"
unzip /tmp/dispatch.zip &>>/tmp/roboshop.log


echo -e "\e[35m Change to App Directory \e[0m"
cd /app


echo -e "\e[35m Go Mod \e[0m"
go mod init dispatch &>>/tmp/roboshop.log



echo -e "\e[35m Go get \e[0m"
go get &>>/tmp/roboshop.log


echo -e "\e[35m Go Build \e[0m"
go build &>>/tmp/roboshop.log


echo -e "\e[35m Copy dispatch.service file  \e[0m"
cp /root/project1/bash/dispatch.service /etc/systemd/system/dispatch.service &>>/tmp/roboshop.log


echo -e "\e[35m Reload Daemon \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log


echo -e "\e[35m Enable dispatch \e[0m"
systemctl enable dispatch &>>/tmp/roboshop.log


echo -e "\e[35m Restart dispatch \e[0m"
systemctl restart dispatch &>>/tmp/roboshop.log