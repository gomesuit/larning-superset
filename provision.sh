#!/bin/bash
set -e

yum install -y gcc gcc-c++ libffi-devel python-devel python-pip python-wheel openssl-devel libsasl2-devel openldap-devel
yum install -y epel-release
yum install -y python2-pip
pip install --upgrade setuptools pip
pip install superset

#pip install virtualenv
#virtualenv venv

# install mysql
yum install -y mariadb-server
systemctl enable mariadb
systemctl start mariadb

# use mysql for python
yum install -y mariadb-devel
pip install mysqlclient
cp /vagrant/superset_config.py /lib/python2.7/site-packages/

# init superset
mysql -u root -e 'create database superset;'
superset db upgrade
superset init

# create example
superset load_examples

# setting service
cp /vagrant/superset.service /etc/systemd/system/
cp /vagrant/superset.conf /etc/sysconfig/
systemctl daemon-reload
systemctl enable superset

