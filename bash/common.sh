color="\e[31m"
nocolor="\e[0m"
log_file="/tmp/roboshop.log"
app_path="/app"

app_presetup() {
  echo -e "${color} Add user ${nocolor}"
  useradd roboshop &>>${log_file}

  echo -e "${color} Make Directory ${nocolor}"
  mkdir ${app_path} &>>${log_file}


  echo -e "${color} Download  Content ${nocolor}"
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_file}

  echo -e "${color} Change to App Directory ${nocolor}"
  cd ${app_path}

  echo -e "${color} Extract  content ${nocolor}"
  unzip /tmp/${component}.zip &>>${log_file}

  echo -e "${color} Change to App directory ${nocolor}"
  cd ${app_path}

}


systemD_setup () {
  echo -e "${color} extracting frontend content ${nocolor}"
  cp /home/centos/project1/bash/${component}.service /etc/systemd/system/${component}.service &>>${log_file}

  echo -e "${color} Reload Daemon ${nocolor}"
  systemctl daemon-reload &>>${log_file}

  echo -e "${color} Enable ${component} ${nocolor}"
  systemctl enable ${component} &>>${log_file}

  echo -e "${color} Start ${component} ${nocolor}"
  systemctl start ${component} &>>${log_file}
}


nodejs () {
  echo -e "${color} Disable NodeJs ${nocolor}"
  dnf module disable nodejs -y &>>${log_file}

  echo -e "${color} Enable NodeJs ${nocolor}"
  dnf module enable nodejs:18 -y &>>${log_file}

  echo -e "${color} Install NodeJs ${nocolor}"
  dnf install nodejs -y &>>${log_file}

  app_presetup

  echo -e "${color} Install Npm ${nocolor}"
  npm install &>>${log_file}

  systemD_setup
}


mongo_schema_setup () {
  echo -e "${color} Copy Mongo.repo ${nocolor}"
  cp /home/centos/project1/bash/mongo.repo /etc/yum.repos.d/mongo.repo &>>${log_file}

  echo -e "${color} Install Mongodb ${nocolor}"
  dnf install mongodb-org-shell -y &>>${log_file}

  echo -e "${color} Load Schema ${nocolor}"
  mongo --host mongodb-dev.lanim.store </app/schema/user.js &>>${log_file}

}

mysql_schema_setup () {
  echo -e "${color} Install mysql ${nocolor}"
  dnf install mysql -y &>>${log_file}

  echo -e "${color} Set mysql password ${nocolor}"
  mysql -h mysql-dev.lanim.store -uroot -pRoboShop@1 < ${app_path}/schema/${component}.sql &>>${log_file}
}

maven () {
  echo -e "${color} Install Maven ${nocolor}"
  dnf install maven -y &>>${log_file}

  app_presetup

  echo -e "${color} Maven package ${nocolor}"
  mvn clean package &>>${log_file}


  echo -e "${color} Move file to shippimng.jar ${nocolor}"
  mv target/${component}-1.0.jar ${component}.jar &>>${log_file}

  mysql_schema_setup

  systemD_setup

}

python () {

  echo -e "${color} Install Python ${nocolor}"
  dnf install python36 gcc python3-devel -y &>>${log_file}

  app_presetup


  echo -e "${color} download dependencies ${nocolor}"
  pip3.6 install -r requirements.txt &>>${log_file}


  systemD_setup


}