# control-almacen" 
Control de Almacén es un sistema web desarrollado con PHP, MySQL y Bootstrap, que cubre una serie de requerimientos básicos para llevar el control del inventario de una. Esta es  una solución sencilla para que los propietarios de pequeñas empresas gestionen sus existencias de manera sistemática, y de esa manera poder reemplazar el uso de hojas de calculo para gestionar  su inventario.


Instalación en windows (servidor local)


1- Descargar XAMPP

2- Descargar los archivos fuentes del sistema

3- Copiar y descomprimir el archivo en la carpeta c:\xampp\htdocs, al final tendras una carpeta llamada “AlmacenControl”, a la cual podrás acceder desde el navegador como: http://localhost/AlmacenControl/

4- Crear una base de datos usando PHPMyAdmin accediendo a la url siguiente: http://localhost/phpmyadmin/

5- Importar las tablas de la base de datos para ello vamos a buscar el archivo "simple_stock.sql" en el directorio root de nuestro sistema, una vez localizado procedemos a hacer la importación de los datos desde PHPMyAdmin

6- Configurar los datos de conexión a la base de datos editando el archivo de configuración que se encuentra en la siguiente ruta: AlmacenControl/config/db.php

7- Vista web: http://localhost/AlmacenControl/

8- Datos de acceso por defecto: usuario: admin y contraseña: admin