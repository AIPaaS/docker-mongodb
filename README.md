版本：mongodb-linux-x86_64-rhel62-3.0.3  
构建：拷贝mongod,mongo等文件到/bin 目录下  
    
部署：需要在宿主机创建 /aifs01/mongodata 目录并授权，用于挂载容器的data及log目录。    
    
启动命令：docker build -t mongodb:3.0.3 .  
      docker run -d --net=host -p 27017:27017 --name=mongodb_001 -v /aifs01/mongodata:/data/db -e "HOST=10.1.245.226" -e "PORT=27017" -e "INS_NAME=db_001" mongodb:3.0.3   
    
创建复制集：   
1.使用mongo连接任意mongo节点，如：/bin/mongo 10.1.245.226:27017    
2.切换admin模式：use admin   
3.设置复制集参数，如：cfg={ _id:"dbReplicaSet", members:[ {_id:0,host:'10.1.245.226:27017',priority:1}, {_id:1,host:'10.1.245.226:27027',priority:2},{_id:2,host:'10.1.245.226:27037',arbiterOnly:true}] };  
4.生效配置，如：rs.initiate(cfg)
