# larning-superset

## vagrant起動
`vagrant up`

## vagrantログイン
`vagrant ssh`

## superset起動
```
sudo su -
fabmanager create-admin --app superset
systemctl start superset
```

## ブラウザからアクセス
http://192.168.33.60:8088/
