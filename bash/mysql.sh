echo -e "\e[32m Module Disable mysql\e[0m"
dnf module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[32 Copy mysql repo file \e[0m"
cp /root/project1/bash/mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\e[32m Install mysql \e[0m"
dnf install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[32m Enable mysql \e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log

echo -e "\e[32m Restart mysql \e[0m"
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[32m Mysql password \e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log

echo -e "\e[32m Mysql User \e[0m"
mysql -uroot -pRoboShop@1 &>>/tmp/roboshop.log
