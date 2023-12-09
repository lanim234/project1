echo -e "\e[33m Disable NodeJs \e[0m"
dnf module disable nodejs -y

echo -e "\e[33m Enable NodeJs \e[0m"
dnf module enable nodejs:18 -y

echo -e "\e[33m Install NodeJs \e[0m"
dnf install nodejs -y

echo -e "\e[33m Add user \e[0m"
useradd roboshop

echo -e "\e[33m Make Directory \e[0m"
mkdir /app

echo -e "\e[33m Download catalogue Content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip

echo -e "\e[33m Change to App Directory \e[0m"
cd /app

echo -e "\e[33m Extract catalogue content \e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[33m Change to App Directory \e[0m"
cd /app

echo -e "\e[33m Install Npm \e[0m"
npm install

echo -e "\e[33m extracting frontend content \e[0m"
cp /users/adeniyimegbabi/project1/bash/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m Reload Daemon \e[0m"
systemctl daemon-reload

echo -e "\e[33m Enable Catalogue \e[0m"
systemctl enable catalogue

echo -e "\e[33m Start Catalogue \e[0m"
systemctl start catalogue

echo -e "\e[33m Copy MongoDB Repo file \e[0m"
cp /users/adeniyimegbabi/project1/bash/mongodb.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[33m Install MongoDB \e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[33m extracting frontend content \e[0m"
mongo --host mongodb-dev.lanim.store </app/schema/catalogue.js

