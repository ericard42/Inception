if [ ! -d /var/lib/mysql/wordpress ]; then
	echo "Mysql is not initialised..."
	mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld_safe --user=root &
MSP_PID=$!

sleep 2

while ! mysqladmin ping --silent; do
    echo "ping... Waiting for pong..."
    sleep 5
done
echo "Pong ! Finally !"

if [ ! -d /var/lib/mysql/wordpress ]; then
	echo "db doesn't exist..."
	mysql < /init_remote.sql
	echo "init_remote -> Done"
	mysql < /init_wp.sql
	echo "init_wp -> Done"
	mysql < /wordpress.sql
	echo "wordpress -> Done"
fi

echo "Yay"

wait $MSP_PID
