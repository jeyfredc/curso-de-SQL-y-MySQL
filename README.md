# curso-de-SQL-y-MySQL


**Contenido**

[Clase 1 Bienvenida al curso](#Clase-1-Bienvenida-al-curso)

[Clase 2 Instalación de MySQL](#Clase-2-Instalación-de-MySQL)

[Clase 3 La Consola de MySQL](#Clase-3-La-Consola-de-MySQL)

[Clase 4 ¿Qué es una base de datos?](#Clase-4-¿Qué-es-una-base-de-datos?)

[Clase 5 Comando CREATE](#Clase-5-Comando-CREATE)

[Clase 6 Tipos de columnas / Creación de la tabla books](#Clase-6-Tipos-de-columnas-/-Creación-de-la-tabla-books)

[Clase 7 Tipos de columnas / Creación de la tabla authors](#Clase-7-Tipos-de-columnas-/-Creación-de-la-tabla-authors)

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()

[]()


## Clase 1 Bienvenida al curso

El curso se basara sobre un proyecto directamente con la base de datos, se tratara de una librería donde se pueda comprar o rentar un libro y se ira creando paso a paso, es importante investigar con la documentación que ofrecen los programas SQL y MySQL. No es un proyecto de programación y se va a realizar el curso desde la consola

## Clase 2 Instalación de MySQL

Para realizar la instalación de MySQL en tu pc lo primero que debes tener en cuenta es que debes hacer la verificación de la versión que quieres instalar y la distribución para tu sistema operativo. En este enlace encuentras el listado de las plataformas soportadas. https://www.mysql.com/support/supportedplatforms/database.html

**Instalación en Windows**

Si estas trabajando con Windows puedes hacer la descarga ingresando en el siguiente enlace: https://dev.mysql.com/downloads/installer/. Este es el sitio oficial de MySQL por lo que puedes confiar en la descarga.

El instalador para Windows es muy similar a los que ya conocemos, nos pide algunas verificaciones y nos permite navegar a través de diferentes ventanas.

Inicialmente el instalador nos va a solicitar que aceptemos los términos y acuerdos de la licencia. Revisalos y si estas de acuerdo continua.

En seguida te va a solicitar información relacionada con el tipo de instalación que vas a realizar, puedes elegir entre Developer Default, Client Only y Full. Cualquiera que sea la opción que elijas esto no implica que luego puedas actualizarla.

Si instalas la versión Full vas a tener acceso a todas las características y productos que MySQL ofrece.

Verifica que tengas disponibles todos los requerimientos que el instalador te presenta. En caso de no contar con ellos debes descargar e instalar el software solicitado.

Continua con la instalación de acuerdo a lo que te indica el ayudante.

**Instalación en Mac**

En nuestro caso vamos a estar trabajando con MySQL en Mac por lo que haremos la instalación en este sistema operativo.

Para instalar MySQL usando el instalador del paquete:

Descarga el archivo de imagen del disco ( .dmg ) ( Link de descarga ) que contiene el instalador del paquete MySQL. No es necesario tener una cuenta en Oracle para realizar la instalación pero es recomendable hacerlo.

Haz doble clic sobre el archivo para montar la imagen y ver su contenido.

Esto te va a mostrar el asistente de instalación de MySQL. El SO puede preguntarte si confías en el origen de este programa, puedes darle continuar hasta que llegues al installation type puedes hacer clic en Instalar para ejecutar el asistente de instalación utilizando todos los valores predeterminados, o puedes hacer clic en Personalizar para modificar qué componentes instalar (servidor MySQL, Prueba de MySQL, Panel de preferencias, Soporte inicializado; todas las pruebas excepto MySQL están habilitadas por defecto). En este caso esta bien que instalemos con los valores por defecto.

Selecciona el tipo de cifrado de contraseñas que vas a usar para tu base de datos.

Ingresa una contraseña que no se te vaya a perder u olvidar, porque es la contraseña de tu usuario root para la base de datos.

En este punto ya tienes instalado tu servidor de MySQL y puedes continuar con el curso.

**Instalaciones en Linux Mint, basados en Ubuntu o Debian**

Seguir instrucciones del repositorio

https://www.digitalocean.com/community/tutorials/como-instalar-mysql-en-ubuntu-18-04-es#:~:text=y

## Clase 3 La Consola de MySQL

Para quienes depronto omitieron el paso 3 en Sistemas Operativos Linux lo que primero se hace en la clase es ingresar a la terminal y a MySQL mediante el siguiente comando

```
mysql -u root -h localhost -p
```

En mi caso que uso Linux Mint pero que por debajo corre Ubuntu 20.04 este es el error que salio

```
Enter password: 
ERROR 1698 (28000): Access denied for user 'root'@'localhost'
```
El paso siguiente al salir este error es configurar mysql con el comando

```
sudo mysql
```
inmediatamente se va abrir MySQL y saldra mas o menos una ventana parecida a esta

![assets/1.png](assets/1.png)

donde aparece mysql> colocar la siguiente instruccion

```
SELECT user,authentication_string,plugin,host FROM mysql.user;
```
posteriormente va a salir un cuadro y se deben fijar en la fila donde esta root, esta puede aparecer al principio o al final de la tabla y verificar que la columna donde dice authentication_string este vacia y la columna donde dice plugin esta como **auth_socket** , esto se usa para autenticarse usando la contraseña

![assets/2.png](assets/2.png)

la siguiente sentencia que se debe ejecutar en mysql es la siguiente, y donde dice **password**, se cambia por la contraseña que se quiera elegir

```
mysql>ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

después de presionar la tecla ENTER saldrá una sentencia parecida a esta

```
Query OK, 0 rows affected (0.25 sec)
```

si no aparece se puede ejecutar el comando

```
mysql> FLUSH PRIVILEGES;
```

después nuevamente colocar la sentencia

```
SELECT user,authentication_string,plugin,host FROM mysql.user;
```
En esta va aparecer nuevamente el cuadro pero ya van aparecer los campos de authentication_string y plugin diferentes

![assets/3.png](assets/3.png)

después de esto podemos salir de mysql mediante la sentencia 

```
mysql>exit
```

y ahora si nuevamente se ingresa la sentencia en la terminal 

```
mysql -u root -h localhost -p
```

solicita el ingreso del password y ya en este caso se coloca el que se haya asignado en los pasos anteriores y ya queda configurado para continuar con las clases del curso.

Mas adelante la recomendación es que todas las sentencias que se colocan en mysql a exepcion de 2 finalizan con un **;**

Mediante la sentencia

```
mysql>show databases;
```
tenemos una vista de las bases de datos con las que cuenta en ese momento el computador

![assets/4.png](assets/4.png)

para poder acceder a la base datos se hace mediante el comando

```
mysql>use mysql;
```
![assets/5.png](assets/5.png)

para limpiar la terminal con Ctrl + l, en estos casos ya hay que conocer un poco de los comandos que se manejan en la terminal

con la sentencia

```
mysql>show tables;
```

muestra las tablas que existen en esa base de datos

![assets/6.png](assets/6.png)

En el caso de haber limpiado la pantalla con ctrl + l por ejemplo y no saber en que base de datos se encuentra usar la sentencia

```
mysql>select database();
```

y ya para salir de mysql con la sentencia

```
mysql>exit;
```

## Clase 4 ¿Qué es una base de datos?

Existen de diferentes sabores, colores, pero una base de datos es un lugar donde se pueden almacenar datos puntuales de cualquier cantidad de cosas, para después operar sobre esos datos y convertirlos en información y estos a su vez convertilos en operaciones de negocios, en crecimiento, dinero, sabiduría, etc..., antes que todo lo anterior en el diseño de un modelo relacional que es crear tablas donde algunas pueden depender entre si, no necesariamente entre todas. Lo importante es saber que se pueden crear relaciones por ejemplo como las de un libro, un libro puede contener diferentes autores o viceversa un autor puede contener muchos libros.

Una base de datos permite almacenar datos y relaciones que se pueden convertir en información. 

## Clase 5 Comando CREATE

Lo primero que se va a realizar es crear las diferentes tablas que se requieren para iniciar con el proyecto con base al diagrama se ira creando la tabla y cada columna se ira creando de un tipo de dato diferente donde se usaran los mas prácticos o comunes.

En general existen diferentes tipos de tablas, pero se va a hablar de los 2 principales tablas **InnoDB** y **MyISAM** que provee MySQL por defecto

**InnoDB**

Es una base de datos mas nueva, robusta y recuperable en caso de que exista un fallo en el disco duro pero es mas lenta

**MyISAM**

Es una tabla directa, sencilla y rapida. Las operaciones y transacciones son 1 a 1 por tal razon la velocidad de lectura y escritura es mayor.

Esto afecta la estrategia, existen 2 tipos de tablas o arquitectura que se van a usar que es una **tabla de catalogo** y una **tabla de operacion**, la diferencia es que la tabla de catalogo crecerá en un orden lento por tal razón se utilizara **InnoDb**, las tablas que crecen y se utilizan mucho acceso al disco duro sera en **MyISAM** para darle mayor agilidad al sistema


## Clase 6 Tipos de columnas / Creación de la tabla books

Primer comando a utilizar en la terminal de mysql

```
mysql> CREATE database platzi_operation;
Query OK, 1 row affected (1.25 sec)
```
tambien crea la base con una pregunta condicional pero no se crea otra asi diga OK porque ya esta creada

```
mysql> CREATE DATABASE IF NOT EXISTS platzi_operation;
Query OK, 1 row affected, 1 warning (0.03 sec)
```

pero al colocar SHOW warnings indica que no se puede crear esa tabla de datos porque ya existe

```
mysql> SHOW warnings;
+-------+------+-----------------------------------------------------------+
| Level | Code | Message                                                   |
+-------+------+-----------------------------------------------------------+
| Note  | 1007 | Can't create database 'platzi_operation'; database exists |
+-------+------+-----------------------------------------------------------+
1 row in set (0.01 sec)

```

si nuevamente se coloca 

```
mysql> CREATE database platzi_operation;
ERROR 1007 (HY000): Can't create database 'platzi_operation'; database exists
```
saca directamente un error donde ya no aparece **Query OK**, en la sentencia anterior se indica que si no puede suceder se muestra como **warning**, pero si depende del flujo el error es diferente

con show databases se muestran las tablas que estan creadas en mysql

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| platzi_operation   |
| sys                |
+--------------------+
5 rows in set (0.09 sec)
```
para usar la tabla creada

```
mysql> use platzi_operation;
Database changed
```
la sentencia indica que el puntero de la consola ahora se encuentra en la tabla

si se ejecuta el siguiente comando

```
mysql> show tables;
Empty set (0.01 sec)
```
sale **Empty set**, esta sentencia es cuando se hace un query a cualquier elemento de la base de datos y no trae algun tipo de informacion

para empezar a crear la tabla se puede coger un documento vacio y especificar la siguiente instruccion, no ejecutar ni pegar en la terminal hasta que se indique en la siguiente clase.

**Creacion de la libreria**
```
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    author_id INTEGER UNSIGNED,
    title VARCHAR(100) NOT NULL,
    year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER NOT NULL DEFAULT 1,
    description TEXT
);
```
- Es una buena practica que cada tabla se llame en el plural del sustantivo que se va a guardar y es una practica o convención muy usada que le permite a otras personas identificar como se esta trabajando

- MySQL permite mayusculas y minusculas tanto en columnas y filas. 

- Es buena practica que todos los nombres de columnas y tablas vayan en minusculas y todas las palabras reservadas del lenguaje vayan en mayusculas

- **IF NOT EXISTS** es una sentencia para evitar crear posiblemente una tabla con el mismo nombre

- Toda tabla necesita un Id que lo que hace es poder ubicar a una tupla de una manera única y para eso se debe usar un entero **(book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT)** que sera auto incremental como lo indica la sentencia **AUTO_INCREMENT**, el primer tipo de datos usado en las tablas es el entero **INTEGER** y como característica tiene que es un **PRIMARY KEY**.

- La tabla al ser auto incremental indica que por ejemplo al ir agregando un dato ejemplo.

    Pedro

    Maria

    Gonzalo

    estos van a identificarse en orden:

    1 Pedro

    2 Maria

    3 Gonzalo
    
    pero en el caso que se elimine cualquiera de estos por ejemplo el 3 que es Gonzalo, e ingresar un 4 dato(Julio), así no exista el 3 dato, la secuencia va continuar

    1 Pedro

    2 Maria

    4 Julio

- la sentencia **UNSIGNED** sirve para que el numero no muestre un valor de negativo o positivo, se podría llamar como absoluto para que no diferencie entre los 2

- Existen otra sentencias para los enteros como lo son:

    **TINYINT**: Es un número entero con o sin signo. Con signo el rango de valores válidos va desde -128 a 127. Sin signo, el rango de valores es de 0 a 255

    **BIGINT**: Número entero con o sin signo. Con signo el rango de valores va desde -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807. Sin signo el rango va desde 0 a 18.446.744.073.709.551.615.

    **INTEGER**: Número entero con o sin signo. Con signo el rango de valores va desde -2147483648 a 2147483647. Sin signo el rango va desde 0 a 429.4967.295

    Estos ademas también tienen que ver con el tamaño en uso de memoria

- seguido va otra columna para el autor **author_id INTEGER UNSIGNED** la cual se le hará una referencia numérica para trabajar como relación con la tabla que se crea en la siguiente clase

- Seguido va otra columna para el titulo **title VARCHAR(100) NOT NULL**, donde el tipo de dato VARCHAR permite guardar una cadena de caracteres y lo que va entre paréntesis es la capacidad de caracteres que va a almacenar el titulo, **NOT NULL**, significa que no se permite vació. Esto refiere a que **NULL** como tal es un elemento vació pero en el momento que existen **""** o **''** significa que asi no exista nada ya no es un elemento vació

- Seguido va otra columna para el año **year INTEGER UNSIGNED NOT NULL DEFAULT 1900**, el **DEFAULT** se indica como un ejemplo para este caso que el año viene predeterminado con 1900

- Seguido va otra columna para el lenguaje **language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language**, donde se coloca 2 como maximo de caracteres permitidos que seria la abreviación internacional para los idiomas y **COMMENT** es un comentario que se coloca en la tabla, pero que solamente puede ser visto por alguien que este usando la misma estructura de tabla en el Backend.

- Seguido va otra columna para la imagen **cover_url VARCHAR(500)**, la cual se recomienda no insertar en forma de imagen si no la Url para redirigir el acceso a una imagen

- Seguido va otra columna para el precio **price DOUBLE(6,2) NOT NULL DEFAULT 10.0** donde se indica que se va a colocar un decimal de 4 numeros + 2 decimales que van despues de la coma **0000.00**

- Seguido va otra columna para indicar si se puede vender o no **price DOUBLE(6,2) NOT NULL DEFAULT 10.0,**, el parámetro recibe solo 0 o 1, es decir falso o verdadero y por default viene que si es vendible

- Seguido va otra columna que indica que por default esos libros tienen una copia **copies INTEGER NOT NULL DEFAULT 1**

- Por ultimo viene la descripción **description TEXT** donde el tipo de dato es **TEXT** y este puede almacenar cualquier cantidad de caracteres


## Clase 7 Tipos de columnas / Creación de la tabla authors

Se crea la tabla para el autor que es la que tiene que relacionarse con la segunda columna de la primera tabla y para que se la relacion entre las mismas estas deben tener el mismo tipo de datos

```
CREATE TABLE IF NOT EXISTS authors(
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(3)
);
```

a continuacion pegar en la consola la primer tabla y posteriormente la segunda tabla

```
mysql> CREATE TABLE IF NOT EXISTS books (
    ->     book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    ->     author_id INTEGER UNSIGNED,
    ->     title VARCHAR(100) NOT NULL,
    ->     year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    ->     language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    ->     cover_url VARCHAR(500),
    ->     price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    ->     sellable TINYINT(1) DEFAULT 1,
    ->     copies INTEGER NOT NULL DEFAULT 1,
    ->     description TEXT
    -> );
Query OK, 0 rows affected, 2 warnings (2.16 sec)

mysql> CREATE TABLE IF NOT EXISTS authors(
    ->     author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(100) NOT NULL,
    ->     nationality VARCHAR(3)
    -> );
Query OK, 0 rows affected (0.37 sec)

mysql> show tables;
+----------------------------+
| Tables_in_platzi_operation |
+----------------------------+
| authors                    |
| books                      |
+----------------------------+
2 rows in set (0.00 sec)

```

los 3 warnings que en mi caso salieron informan que la especificacion de tipos de datos de punto flotante esta obsoleta y se eliminara en una version futura, y que la tabla books ya esta creada

```
mysql> show warnings
    -> ;
+---------+------+------------------------------------------------------------------------------------------------------------------+
| Level   | Code | Message                                                                                                          |
+---------+------+------------------------------------------------------------------------------------------------------------------+
| Warning | 1681 | Specifying number of digits for floating point data types is deprecated and will be removed in a future release. |
| Warning | 1681 | Integer display width is deprecated and will be removed in a future release.                                     |
| Note    | 1050 | Table 'books' already exists                                                                                     |
+---------+------+------------------------------------------------------------------------------------------------------------------+
3 rows in set (0.00 sec)

```

para mirar si hay contenido dentro de las tablas se usa la siguiente sentencia

 ```
mysql> select * from books;
Empty set (0.00 sec)

mysql> select * from authors;
Empty set (0.00 sec)

 ```

 para borrar una tabla se usa la sentencia **DROP**, pero es recomendable que antes de hacer cualquier cosa observarla y estar segur(@) de lo que se esta haciendo, la sentencia sirve para eliminar una base de datos, contenido o tabla

 ```
mysql> DROP table authors;
Query OK, 0 rows affected (0.36 sec)

mysql> show tables;
+----------------------------+
| Tables_in_platzi_operation |
+----------------------------+
| books                      |
+----------------------------+
1 row in set (0.00 sec)
 ```

 en este caso se borra como ejemplo, porque no tiene datos y la estructura ya esta definida, entonces se vuelve a crear 

 ```
mysql> CREATE TABLE IF NOT EXISTS authors(     author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,     name VARCHAR(100) NOT NULL,     nationality VARCHAR(3) );
Query OK, 0 rows affected (1.04 sec)

mysql> show tables;
+----------------------------+
| Tables_in_platzi_operation |
+----------------------------+
| authors                    |
| books                      |
+----------------------------+
2 rows in set (0.01 sec)

mysql> 

 ```

 la sentencia **describe** y **desc**, indica que columnas existen en cada una de las tablas

 ```
mysql> describe authors;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| author_id   | int unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100) | NO   |     | NULL    |                |
| nationality | varchar(3)   | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.12 sec)

mysql> desc books;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| book_id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| author_id   | int unsigned | YES  |     | NULL    |                |
| title       | varchar(100) | NO   |     | NULL    |                |
| year        | int unsigned | NO   |     | 1900    |                |
| language    | varchar(2)   | NO   |     | es      |                |
| cover_url   | varchar(500) | YES  |     | NULL    |                |
| price       | double(6,2)  | NO   |     | 10.00   |                |
| sellable    | tinyint(1)   | YES  |     | 1       |                |
| copies      | int          | NO   |     | 1       |                |
| description | text         | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
10 rows in set (0.01 sec)

 ```

 si se requiere ver el comentario que quedo en laguage se puede utilizar **show full columns rom books**

 ```
mysql> show full columns from books;
+-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| Field       | Type         | Collation          | Null | Key | Default | Extra          | Privileges                      | Comment            |
+-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| book_id     | int unsigned | NULL               | NO   | PRI | NULL    | auto_increment | select,insert,update,references |                    |
| author_id   | int unsigned | NULL               | YES  |     | NULL    |                | select,insert,update,references |                    |
| title       | varchar(100) | utf8mb4_0900_ai_ci | NO   |     | NULL    |                | select,insert,update,references |                    |
| year        | int unsigned | NULL               | NO   |     | 1900    |                | select,insert,update,references |                    |
| language    | varchar(2)   | utf8mb4_0900_ai_ci | NO   |     | es      |                | select,insert,update,references | ISO 639-1 Language |
| cover_url   | varchar(500) | utf8mb4_0900_ai_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
| price       | double(6,2)  | NULL               | NO   |     | 10.00   |                | select,insert,update,references |                    |
| sellable    | tinyint(1)   | NULL               | YES  |     | 1       |                | select,insert,update,references |                    |
| copies      | int          | NULL               | NO   |     | 1       |                | select,insert,update,references |                    |
| description | text         | utf8mb4_0900_ai_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
+-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
10 rows in set (0.03 sec)

 ```
 la palabra **year** es una palabra reservada del lenguaje al igual que **language**, para que el lenguaje diferencie que es una palabra no reservada de su mismo lenguaje, se pueden colocar comillas sencillas invertidas entre ellas es decir **`year`**, **`language`**, **`description`**  y **`name`**. 

 lo que se puede hacer es borrar la tabla hacer la correccion en estos valores y nuevamente crearlas repitiendo los pasos