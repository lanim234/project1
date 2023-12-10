color="\e[31m"
nocolor="\e[0m"
log_file="/tmp/roboshop.log"
app_path="/app"


nodejs () {
  echo -e "${color} Disable NodeJs ${nocolor}"
  dnf module disable nodejs -y &>>${log_file}

  echo -e "${color} Enable NodeJs ${nocolor}"
  dnf module enable nodejs:18 -y &>>${log_file}

  echo -e "${color} Install NodeJs ${nocolor}"
  dnf install nodejs -y &>>${log_file}

  echo -e "${color} Add user ${nocolor}"
  useradd roboshop &>>${log_file}

  echo -e "${color} Make Directory ${nocolor}"
  mkdir ${app_path} &>>${log_file}


  echo -e "${color} Download  Content ${nocolor}"
  curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>${log_file}

  echo -e "${color} Change to App Directory ${nocolor}"
  cd ${app_path}

  echo -e "${color} Extract  content ${nocolor}"
  unzip /tmp/$component.zip &>>${log_file}

  echo -e "${color} Change to App Directory ${nocolor}"
  cd ${app_path}

  echo -e "${color} Install Npm ${nocolor}"
  npm install &>>${log_file}

  echo -e "${color} extracting frontend content ${nocolor}"
  cp /home/centos/project1/bash/$component.service /etc/systemd/system/$component.service &>>${log_file}
  #
  echo -e "${color} Reload Daemon ${nocolor}"
  systemctl daemon-reload &>>${log_file}

  echo -e "${color} Enable $component ${nocolor}"
  systemctl enable $component &>>${log_file}

  echo -e "${color} Start $component ${nocolor}"
  systemctl start $component &>>${log_file}
}