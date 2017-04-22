#!/bin/bash

mysqld_get_param() {
    /usr/sbin/mysqld --print-defaults \
        | tr " " "\n" \
        | grep -- "--$1" \
        | tail -n 1 \
        | cut -d= -f2
}

mysqld_status () {
    ping_output=`mysqladmin -u root -p$3 ping 2>&1`; ping_alive=$(( ! $? ))

    ps_alive=0
    pidfile=`mysqld_get_param pid-file`
    if [ -f "$pidfile" ] && ps `cat $pidfile` >/dev/null 2>&1; then ps_alive=1; fi

    if [ "$1" = "check_alive"  -a  $ping_alive = 1 ] ||
       [ "$1" = "check_dead"   -a  $ping_alive = 0  -a  $ps_alive = 0 ]; then
        return 0 # EXIT_SUCCESS
    else
        if [ "$2" = "warn" ]; then
            echo -e "$ps_alive processes alive and 'mysqladmin ping' resulted in\n$ping_output\n"
        fi
        return 1 # EXIT_FAILURE
    fi
}

if [ "$(ls -A /var/lib/mysql)" ]; then
    echo "DB already initialized.";
else
    echo "Setup DB for first run..."

    chown mysql:mysql /var/lib/mysql
    mysqld --initialize --console --user=mysql

    echo "Starting mysql..."

    /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --log-error=/var/log/mysql/error.log --pid-file=/var/run/mysqld/mysqld.pid --socket=/var/run/mysqld/mysqld.sock --port=3306 &

    echo "Waiting for mysql..."

    mysqladmin proc > /dev/null 2>&1
    mysqlrun=$?
    tries=1

    while [ $mysqlrun -ne 0 ]; do
        if [ $tries -gt 15 ]; then
            exit 199
        fi

        tries=$((tries+1))
        sleep 1
        mysqladmin proc > /dev/null 2>&1
        mysqlrun=$?
    done

    echo "MYSQL ready after $tries tries."

    echo "Creating database user docker..."

    mysql -e "GRANT ALL PRIVILEGES ON *.* TO docker@'%' IDENTIFIED BY 'docker'"
    mysql -e "FLUSH PRIVILEGES"

    echo "Database user docker created. Changing root password..."

    PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    mysqladmin -u root password "$PASSWD"

    echo "Database root password changed"

    if ! mysqld_status check_dead nowarn ${PASSWD}; then
        echo "Shutting down mysql..."
        mysqladmin -u root -p${PASSWD} shutdown 2>&1
        r=$?

        if [ "$r" -ne 0 ]; then
            echo "Killing MariaDB database server by signal 15"
            killall -15 mysqld
            server_down=
            for i in `seq 1 10`; do
                sleep 1
                if mysqld_status check_dead nowarn ${PASSWD}; then server_down=1; break; fi
            done

            if test -z "$server_down"; then
                echo "Killing MariaDB database server by signal 9"
                killall -9 mysqld
            fi
        fi
    fi

    PASSWD=''
    echo "Database stopped"
fi

if grep -q "docker" /etc/mysql/conf.d/devmode.cnf; then
    echo "MySQL conf file already patched."
else
    echo "Patching MySQL conf file for docker user instant login..."
    printf "\n[client]\nuser=docker\npassword=docker" >> /etc/mysql/conf.d/devmode.cnf
    echo "Done"
fi
