#!/bin/bash
set -e

yum install -y gcc gcc-c++ libffi-devel python-devel python-pip python-wheel openssl-devel libsasl2-devel openldap-devel
yum install -y epel-release.noarch
yum install -y python2-pip.noarch
pip install --upgrade setuptools pip

#pip install virtualenv
#virtualenv venv


pip install superset
#fabmanager create-admin --app superset
superset db upgrade
superset load_examples
superset init

cp /vagrant/superset.service /etc/systemd/system/
cp /vagrant/superset.conf /etc/sysconfig/
systemctl daemon-reload
systemctl enable superset

