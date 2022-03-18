UPDATE mysql.user SET Password=PASSWORD('123456') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS wordpress CHARSET utf8;
CREATE USER 'wordpress_admin'@'%' IDENTIFIED BY '123456';
GRANT SELECT,INSERT,CREATE,ALTER,DROP,LOCK TABLES,CREATE TEMPORARY TABLES, DELETE,UPDATE,EXECUTE ON wordpress.* TO 'wordpress_admin'@'%';
FLUSH PRIVILEGES;
