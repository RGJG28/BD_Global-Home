# Global-Home
Proyecto realizado para la materia de Base de Datos,donde se hace la base de datos relacional para una empresa renta y/o venta de viviendas con ayuda de OracleSQL, haciendo uso de PL/SQL

Autores: 
- Jimenez Garcia Rodrigo Gaudencio @RGJG28
- Paredes Pacab Rosaura Elena 

## Instalación de dependencias
No se requiere la instalacion previa de ningun libreria adicional, basta con tener un sistema linux con oracle 19C configurado.

En esta parte hemos implementado un script que nos automatiza la creacion de la base de datos, s-00-main.sql, por lo que se presentan las instrucciones para descargar el proyecto y ejecutar el script.

```bash
git clone https://github.com/RGJG28/BD_Global-Home.git 
cd BD_Global-Home
sqlplus usuario/contraseña@nombre_base_datos @s-00-main.sql
```
## Caso de estudio
Global Home es una empresa que cuenta con un sitio Web destinado a la renta y/o venta
de viviendas ya sea por periodos largos o simplemente para propósitos de vacaciones. Se
requiere realizar la construcción de una base de datos relacional que permita
implementar las siguientes funcionalidades tanto en su sitio web como en su aplicación
móvil.
Registro de viviendas. Cualquier interesado en rentar o vender una vivienda puede realizar
su registro en el sitio web de Global Home. Los datos generales que se desea registrar para
cada vivienda son: ubicación (latitud y longitud), dirección completa (no se requiere
desglosar), capacidad máxima de personas y un campo de texto abierto hasta de 2000
caracteres para agregar una descripción general de la vivienda, dueño de la vivienda
(usuario).
Con la finalidad de hacer publicidad de las viviendas, se permite el registro de hasta 20
imágenes que muestran las características de la vivienda. A cada imagen se le asocia una
numeración (imagen 1, imagen 2,…, imagen 20). Esto con la finalidad de mostrarlas en el
orden correcto en el sistema web.
La empresa cuenta con un catálogo de servicios generales que es empleado para asociar a
las viviendas. Este catálogo permite indicar, por ejemplo, si la vivienda cuenta con aire
acondicionado, WiFi, Gimnasio, Servicios de TV privada, etc. Para cada servicio se guarda el
nombre, descripción y un pequeño ícono que es empleado en el sitio web. Una vivienda
puede contar con diversos servicios.
Global Home clasifica a las viviendas en los siguientes grupos: viviendas para rentar,
viviendas para vacacionar y viviendas para vender.
Para las viviendas de renta se almacena la renta mensual y el día del mes en el que se
debe realizar el depósito. Estos depósitos se realizan empleando una Clave Interbancaria
(CLABE). Para comodidad del cliente, Global Home asigna a cada vivienda de Renta una
lista de CLABEs donde se puede realizar el depósito. Se requiere almacenar dicha lista.
Para el caso de las viviendas destinadas para propósitos de vacaciones, se requiere
almacenar el costo por día, el número máximo de días que se puede ocupar y el costo del
importe que debe pagarse como depósito para apartar la vivienda, útil en especial para
temporadas altas.
Las viviendas que se registran para venta requieren almacenar el número catastral de la
vivienda, folio de 18 caracteres de la escritura y un documento PDF con el resultado del
avalúo de la propiedad que justifica su precio, así como el precio inicial de venta.
Tanto las personas que registran viviendas (dueños) como las que desean rentar o comprar
(clientes) se consideran como usuarios del sistema. Se requiere almacenar la siguiente
información: correo electrónico único, nombre de usuario (10 caracteres), nombre real,
apellido paterno, apellido materno (opcional), contraseña de 8 a 15 caracteres.
El sistema permite que una vivienda esté disponible en el sistema tanto para rentas como
para propósitos de vacaciones. Las viviendas que son registradas para vender no pueden
ser ofrecidas para renta.
Tanto el sistema web como la aplicación móvil cuentan con un sistema de mensajería que
permite intercambiar mensajes entre los dueños y un posible cliente. Cada mensaje se
integra de un título de hasta 40 caracteres y el cuerpo del mensaje de hasta 500
caracteres. El mensaje debe ser almacenado y asociado con la vivienda de interés, el
usuario que lo genera y una bandera que indica si el mensaje fue leído. Cada mensaje
cuenta con una respuesta el cual también se considera como mensaje. Se requiere asociar
la respuesta a cada mensaje enviado.
Cuando un usuario desea alquilar una vivienda para vacacionar se realiza el registro de un
nuevo alquiler con la siguiente información: Folio de alquiler (8 caracteres), usuario que
solicita el alquiler, vivienda de interés, periodo de ocupación. El sistema solicitará (en caso
de no existir) los datos de una tarjeta de crédito para realizar el pago por los días que va a
permanecer el cliente en la vivienda. Por seguridad se desea almacenar esta información
de forma separada: 16 dígitos de la tarjeta, mes de expiración (mm), año de expiración
(aaaa) y número de seguridad (4 dígitos)
Cuando un usuario decide rentar una vivienda, se realiza la captura de un contrato de
renta. Se guarda en folio del contrato (8 caracteres), la fecha de contrato, el usuario que lo
solicita y un documento PDF que contiene las cláusulas y las firmas de conformidad.
Para el caso de las viviendas en venta, únicamente se almacena al usuario que realiza la
compra, el importe de la comisión que Global Home le descuenta al dueño anterior como
parte de los servicios de publicidad del sitio web y la clave interbancaria donde el nuevo
dueño realizará los depósitos bancarios. Para este tipo de vivienda, el sistema permite
realizar el pago de la vivienda en varias mensualidades, hasta en 240 mensualidades. Para
cada pago realizado el sistema debe almacenar la fecha de pago, el importe del pago y un
archivo PDF que sirve como evidencia del depósito realizado.
Para controlar la situación de cada vivienda, se ha diseñado una serie de estados:
<br>
<p><strong>DISPONIBLE</strong></p> 
<span style="color:red">EN RENTA</span>, <span style="color:red">ALQUILADA</span>, <span style="color:red">EN VENTA</span>, <span style="color:red">VENDIDA</span>, <span style="color:red">INACTIVA</span>. 
</br>
Estos estados se almacenan
en un catálogo con su clave y descripción. Se requiere conocer en todo momento la
situación de la vivienda y almacenar la historia de cambios de estado.
Únicamente para las viviendas empleadas para vacacionar existen 2 servicios que Global
Home ofrece. El primer servicio se trata de un sistema de notificaciones en el que el
sistema enviará un mensaje SMS al usuario en cuanto una vivienda esté disponible para
ser alquilada. Se deberá almacenar la lista de usuarios que están interesados en una o
más viviendas, así como el número de celular al que será enviado el mensaje. Una vez que
el mensaje se envía, se activa una bandera de “notificación enviada”. El segundo servicio
se refiere a la posibilidad de calificar a una vivienda para vacacionar. El usuario podrá
asignarle una calificación (hasta 5 estrellas) y una descripción que justifique su calificación.
Se requiere almacenar estos datos, así como la fecha en la que se realiza la evaluación.
## Solución propuesta
### Modelo entidad-relación
![Modelo entidad-relación](https://github.com/RGJG28/BD_Fumigadora/blob/main/src/BD_proyecto_fumigadora_MER.png)
### Modelo relacional
![Modelo relacional](https://github.com/RGJG28/BD_Fumigadora/blob/main/src/Proyecto_fumigadora_ET.jpg)
