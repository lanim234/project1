source common.sh
component=cart

echo -e $color Module Disable Nodejs ${nocolor}"
dnf module disable nodejs -y &>>${log_file}

echo -e ${color} Module enable Nodejs ${nocolor}"
dnf module enable nodejs:18 -y &>>${log_file}

echo -e ${color} Install Nodejs ${nocolor}"
dnf install nodejs -y &>>${log_file}

echo -e ${color} Add user; Roboshop ${nocolor}"
useradd roboshop &>>${log_file}

echo -e ${color} Make App Directory ${nocolor}"
mkdir ${app_path} &>>${log_file}


echo -e ${color} Download $component  Personalised artifacts ${nocolor}"
curl -L -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>${log_file}


echo -e ${color} Change to App Directory ${nocolor}"
cd ${app_path}


echo -e ${color} Extract downloaded file;  ${nocolor}"
unzip /tmp/$component.zip &>>${log_file}

echo -e ${color} Change to App Directory ${nocolor}"
cd ${app_path}



echo -e ${color} Install npm ${nocolor}"
npm install &>>${log_file}

echo -e ${color} Copy $component.service ${nocolor}"
cp /home/centos/project1/bash/$component.service /etc/systemd/system/$component.service &>>${log_file}

echo -e  "\e[31m Reload Daemon${nocolor}"
systemctl daemon-reload &>>${log_file}

echo -e ${color} Enable $component ${nocolor}"
systemctl enable $component &>>${log_file}

echo -e ${color} Restart $component ${nocolor}"
systemctl restart $component &>>${log_file}



