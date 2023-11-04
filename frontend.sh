echo -e "\e[31m installing nginx \e[0m"
dnf install nginx -y &>>/tmp/expense.log
echo -e "\e[33m copying expense.conf \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo -e "\e[32m removing old content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo -e "\e[35m downloading new file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo -e "\e[36m unzipping \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo -e "\e[31m starting service \e[0m"
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log

