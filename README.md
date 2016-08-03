版本：mongodb-linux-x86_64-rhel62-3.0.3  
构建：拷贝mongod,mongo等文件到/bin 目录下  
命令：docker build -t mongodb:3.0.3 .  
      docker run -d --net=host -p 27017:27017 --name=mongodb_001 -v /aifs01/mongodata:/data/db -e "HOST=10.1.245.226" -e "PORT=27017" -e "INS_NAME=db_001" mongodb:3.0.3
