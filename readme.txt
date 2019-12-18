#Para comenzar iniciamos los servicios apache2 y mysql:
service apache2 start
service mysql start

#Creación de la base de datos:
sudo mysql -e "CREATE DATABASE bd CHARACTER SET utf8 COLLATE utf8_Spanish_ci;"
#Creación de usuario y contraseña:
sudo mysql -e "CREATE USER 'usuario'@'bd' identified by 'contraseña';"
#Le damos privilegios:
sudo mysql -e "GRANT ALL PRIVILEGES ON bd.* to 'usuario' IDENTIFIED BY 'contraseña';"
#Consolidar y refresacar los cambios privilegios sobre el usuario y la base de datos:
sudo mysql -e "FLUSH PRIVILEGES;"

#Reiniciamos los servicios:
service apache2 restart
service mysql restart

