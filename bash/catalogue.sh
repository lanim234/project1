source common.sh
component=catalogue

nodejs

echo -e "${color} Copy MongoDB Repo file ${nocolor}"
cp /home/centos/project1/bash/mongodb.repo /etc/yum.repos.d/mongo.repo &>>${log_file}

echo -e "${color} Install MongoDB ${nocolor}"
dnf install mongodb-org-shell -y /&>>${log_file}

echo -e "${color} Load Schema ${nocolor}"
mongo --host mongodb-dev.lanim.store <${app_path}/schema/$component.js &>>${log_file}

