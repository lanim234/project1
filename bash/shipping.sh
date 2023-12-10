echo -e "\e[32m Install Maven \e[0m"
dnf install maven -y &>>/tmp/roboshop.log

echo -e "\e[32m Add user; roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[32m Make Directory \e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[32m Download Shipping artifacts \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log


echo -e "\e[32m Change to App directory \e[0m"
cd /app


echo -e "\e[32m Extract shipping content \e[0m"
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[32m Change to App directory \e[0m"
cd /app


echo -e "\e[32m Maven package \e[0m"
mvn clean package &>>/tmp/roboshop.log


echo -e "\e[32m Move file to shippimng.jar \e[0m"
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log


echo -e "\e[32m Copy file from Shipping.service \e[0m"
cp /root/project1/bash/shipping.service /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "\e[32m Reload Daemon \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log


echo -e "\e[32m Install mysql \e[0m"
dnf install mysql -y &>>/tmp/roboshop.log

echo -e "\e[32m Set mysql password \e[0m"
mysql -h mysql-dev.lanim.store -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[32m Enable shipping\e[0m"
systemctl enable shipping &>>/tmp/roboshop.log

echo -e "\e[32m Extract shipping content \e[0m"
systemctl restart shipping &>>/tmp/roboshop.log