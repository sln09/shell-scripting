log-file=/tmp/expense.log
color="\e[33m"
echo -e "$color installing nginx \e[0m"
dnf install nginx -y &>>$log-file
echo -e "$color copying expense.conf \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log-file
echo -e "$color removing old content \e[0m"
rm -rf /usr/share/nginx/html/* &>>$log-file
echo -e "$color downloading new file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>$log-file
echo -e "$color unzipping \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$log-file
echo -e "$color starting service \e[0m"
systemctl enable nginx &>>$log-file
systemctl restart nginx &>>$log-file

