echo -e "\e[31m install nginx \e[0m"
dnf install nginx -y

echo -e "\e[31m Removing html content in nginx \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33m Removing html content in nginx \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[33m changing to nginx\html folder \e[0m"
cd /usr/share/nginx/html &>>/tmp/roboshop.log

echo -e "\e[33m extracting frontend content \e[0m"
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m copying roboshop.conf file \e[0m"
cp /Users/adeniyimegbabi/project1/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log

echo -e "\e[33m enable nginx \e[0m"
systemctl enable nginx &>>/tmp/roboshop.log

echo -e "\e[33m restart nginx \e[0m"
systemctl restart nginx &>>/tmp/roboshop.log
