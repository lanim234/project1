echo -e "\e[32m Download erlang\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[32m Download Rabbitmq repo\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log


echo -e "\e[32m Install Rabbitmq \e[0m"
dnf install rabbitmq-server -y &>>/tmp/roboshop.log


echo -e "\e[32m Enable Rabbitmq \e[0m"
systemctl enable rabbitmq-server &>>/tmp/roboshop.log


echo -e "\e[32m Restart rabbitmq \e[0m"
systemctl restart rabbitmq-server &>>/tmp/roboshop.log


echo -e "\e[32m Add user roboshop \e[0m"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log



echo -e "\e[32m Set Permission \e[0m"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log
