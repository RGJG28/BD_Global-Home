--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO, PAREDES PACAB ROSAURA ELENA.
--@Fecha creación: dd/05/2022
--@Descripción: CREACION DE USUARIOS Y PERMISOS NECESARIOS PARA EL CASO DE ESTUDIOS.


-------------------------------------------------------------------------------------------------------------
----------------------------------------------CREANDO USUARIO------------------------------------------------
-------------------------------------------------------------------------------------------------------------

Prompt crear usuario invitado
--drop user jp_proy_invitado cascade;
create user jp_proy_invitado identified by mg quota unlimited on users;

Prompt crear usuario invitado
--drop user jp_proy_admin cascade;
create user jp_proy_admin identified by mg quota unlimited on users;

-------------------------------------------------------------------------------------------------------------
-----------------------------------------------CREANDO ROLES-------------------------------------------------
-------------------------------------------------------------------------------------------------------------

Prompt creando rol_admin 

--drop role rol_admin;
create role rol_admin;
grant create session,create table,create sequence ,create synonym, create public synonym ,create view,create trigger, create procedure to rol_admin;
 
Prompt creando rol_invitado 

--drop role rol_invitado;
create role rol_invitado;
grant create session, create synonym to rol_invitado;
-------------------------------------------------------------------------------------------------------------
----------------------------------------------ASIGNANDO ROLES------------------------------------------------
-------------------------------------------------------------------------------------------------------------

grant rol_invitado to jp_proy_invitado;
grant read, write on directory tmp_dir to jp_proy_invitado;
grant rol_admin to jp_proy_admin;
grant read, write on directory tmp_dir to jp_proy_admin;


prompt creando directorio tmp_dir
create or replace directory tmp_dir as '/tmp/bd-unam/proy-final-csv';

prompt creando el directorio /tmp/bd-unam en caso de no existir
!mkdir -p /tmp/bases
prompt copiando los archivos csv a /tmp/bd-unam
!cp pago_vivienda_ext.csv /tmp/bd-unam/proy-final-csv
!cp vivienda_venta_ext.csv /tmp/bd-unam/proy-final-csv
!cp respaldo_usuario.csv /tmp/bd-unam/proy-final-csv
prompt cambiando permisos
/*
!chmod 755 /tmp/bd-unam
!chown oracle /tmp/bd-unam/proy-final-csv
!chmod 755 /tmp/bd-unam/proy-final-csv
!chmod 755 /home/rodrigogjg/Pictures/Global_Home
!chmod 755 /tmp/bd-unam/proy-final-lobs
!chown rodrigogjg /tmp/bd-unam/proy-final-lobs

*/
