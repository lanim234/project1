source common.sh
component=frontend


echo -e "${color} install nginx ${nocolor}"
dnf install nginx -y &>>${log_file}

echo -e "${color} Removing html content in nginx ${nocolor}"
rm -rf /usr/share/nginx/html/* &>>${log_file}

echo -e "${color} Removing html content in nginx ${nocolor}"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_file}

echo -e "${color} changing to nginx\html folder ${nocolor}"
cd /usr/share/nginx/html &>>${log_file}

echo -e "${color} extracting ${component} content ${nocolor}"
unzip /tmp/${component}.zip &>>${log_file}

echo -e "${color} copying roboshop.conf file ${nocolor}"
cp /home/centos/project1/bash/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${log_file}

echo -e "${color} enable nginx ${nocolor}"
systemctl enable nginx &>>${log_file}

echo -e "${color} restart nginx ${nocolor}"
systemctl restart nginx &>>${log_file}
