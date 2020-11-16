
#!/bin/bash
sudo yum update -y
sudo yum install httpd php php-mysql mmysql-client stress -y
cd /var/www/html
wget https://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzf wordpress-5.1.1.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf wordpress-5.1.1.tar.gz
cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/your_db_name/' wp-config.php
sed -i 's/username_here/your_db_username/' wp-config.php 
sed -i 's/password_here/your_db_user_passowrd/' wp-config.php
sed -i 's/localhost/your_db_hostname/' wp-config.php
echo "<?php echo phpinfo()?>" >>health.php
service httpd start
chkconfig httpd on