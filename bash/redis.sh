echo -e "\e[34m Installing redis rpm \e[0m"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "\e[34m Installing  \e[0m"
dnf module enable redis:remi-6.2 -y &>>/tmp/roboshop.log

echo -e "\e[34m Installing redis \e[0m"
dnf install redis -y &>>/tmp/roboshop.log

echo -e "\e[34m Reverse Proxy \e[0m"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf &>>/tmp/roboshop.log
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf &>>/tmp/roboshop.log


echo -e "\e[34m Enable redis \e[0m"
systemctl enable redis &>>/tmp/roboshop.log

echo -e "\e[34m Restart redis \e[0m"
systemctl restart redis &>>/tmp/roboshop.log