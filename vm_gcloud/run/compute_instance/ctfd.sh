#!/bin/bash

# adduser --disabled-password --gecos "" ctfd
# usermod -aG ctfd
apt update
apt upgrade -y
apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools nginx git 

pip3 install pipenv
mkdir -p /var/www
cd /var/www
git clone https://github.com/CTFd/CTFd.git
chown -R root:www-data /var/www/CTFd

cd /var/www/CTFd
sed -i "s/pip install/pip3 install/g" prepare.sh

pipenv install --python 3.6
pipenv shell
pipenv run python3 -m pip install -r requirements.txt
# ./prepare.sh

echo """
[Unit]
Description=Gunicorn instance to serve ctfd
After=network.target

[Service]
User=root
Group=www-data
WorkingDirectory=/var/www/CTFd
Environment="PATH=/home/ctfd/.local/share/virtualenvs/CTFd-rOJbThUf/bin"
ExecStart=/home/ctfd/.local/share/virtualenvs/CTFd-rOJbThUf/bin/gunicorn --bind unix:app.sock --keep-alive 2 --workers 3 --worker-class gevent 'CTFd:create_app()' --access-logfile '/var/log/CTFd/access.log' --error-logfile '/var/log/CTFd/error.log'


[Install]
WantedBy=multi-user.target
""" > /etc/systemd/system/ctfd.service

envpip=$(pipenv --venv)
sed -i "s#/home/ctfd/.local/share/virtualenvs/CTFd-rOJbThUf#"$envpip"#g"  /etc/systemd/system/ctfd.service

mkdir -p /var/log/CTFd/
chown -R root:www-data /var/log/CTFd/

systemctl enable ctfd
systemctl start ctfd
systemctl stop ctfd
systemctl start ctfd
systemctl stop ctfd
systemctl start ctfd
systemctl restart ctfd

#systemctl status ctfd

rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/conf.d/*.conf
echo """
server {
    listen 80;
    server_name _;
    client_max_body_size 75M;
    location / {
        include proxy_params;
        proxy_pass http://unix:/var/www/CTFd/app.sock;

    }
}
""" > /etc/nginx/conf.d/app.conf

nginx -t
systemctl restart nginx