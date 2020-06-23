#!bin/bash
for i in 52 53 54 55 56 57 58
do
        scp /linux-soft/03/redis/redis-4.0.8.tar.gz root@192.168.4.$i:/root/
        ssh root@192.168.4.$i " yum -y install gcc"
        ssh root@192.168.4.$i "tar -xf /root/redis-4.0.8.tar.gz"
        ssh root@192.168.4.$i " cd /root/redis-4.0.8/ && make "
        ssh root@192.168.4.$i " cd /root/redis-4.0.8/ && make install"
        ssh root@192.168.4.$i "/root/redis-4.0.8/utils/install_server.sh"
	sleep 2
        ssh root@192.168.4.$i "netstat -antupl |grep 6379"
        sleep 2
done

