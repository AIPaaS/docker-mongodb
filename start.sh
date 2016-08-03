#!/bin/bash

sed -i "s%port=27017%port=${PORT}%g" /mongod.conf
sed -i "s%bind_ip=127.0.0.1%bind_ip=${HOST}%g" /mongod.conf
sed -i "s%dbpath=.*%dbpath=\/data/db\/${INS_NAME}%g" /mongod.conf
sed -i "s%logpath=.*%logpath=\/data\/db\/mongodb-${INS_NAME}.log%g" /mongod.conf
sed -i "s%pidfilepath=.*%pidfilepath=\/mongodb-${INS_NAME}.pid%g" /mongod.conf

mkdir -p /data/db/${INS_NAME}

doSql=true
while(true); do
  if $doSql; then
      nohup /bin/mongod -f /mongod.conf &
      echo "++++ Started mongodb for ${INS_NAME} is successful ++++"
      doSql=false
  fi
  sleep 5000s
done
