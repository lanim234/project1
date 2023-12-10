source common.sh
component=dispatch


echo -e "${noclor} Install Golang ${noclor}"
dnf install golang -y &>>${log_file}

echo -e "${noclor} User add Roboshop ${noclor}"
useradd roboshop &>>${log_file}

echo -e "${noclor} Make App Directory ${noclor}"
mkdir ${app_path} &>>${log_file}


echo -e "${noclor} Download ${component} artifact ${noclor}"
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_file}


echo -e "${noclor} Change to App Directory ${noclor}"
cd ${app_path}


echo -e "${noclor} Extract ${component} artifact ${noclor}"
unzip /tmp/${component}.zip &>>${log_file}


echo -e "${noclor} Change to App Directory ${noclor}"
cd ${app_path}


echo -e "${noclor} Go Mod ${noclor}"
go mod init ${component} &>>${log_file}



echo -e "${noclor} Go get ${noclor}"
go get &>>${log_file}


echo -e "${noclor} Go Build ${noclor}"
go build &>>${log_file}


echo -e "${noclor} Copy ${component}.service file  ${noclor}"
cp /home/centos/project1/bash/${component}.service /etc/systemd/system/${component}.service &>>${log_file}


echo -e "${noclor} Reload Daemon ${noclor}"
systemctl daemon-reload &>>${log_file}


echo -e "${noclor} Enable ${component} ${noclor}"
systemctl enable ${component} &>>${log_file}


echo -e "${noclor} Restart ${component} ${noclor}"
systemctl restart ${component} &>>${log_file}