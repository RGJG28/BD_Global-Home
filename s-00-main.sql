--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO, PAREDES PACAB ROSAURA ELENA.
--@Fecha creación: 05/04/2022
--@Descripción: SCRIPT-PRINCIPAL.


connect sys/system as sysdba;


-------------------------------------------------------------------------------------------------------------
----------------------------------------------ELIMINACIÓN DE USUARIOS------------------------------------------------
-------------------------------------------------------------------------------------------------------------


set serveroutput on
declare
  v_count number(1,0);
begin 
  select count(*) into v_count
  from dba_users
  where username = 'JP_PROY_INVITADO' OR username = 'JP_PROY_ADMIN';
  if v_count > 0 then
    execute immediate 'drop user JP_PROY_INVITADO cascade';
    execute immediate 'drop user JP_PROY_ADMIN cascade';
    dbms_output.put_line('Usuarios eliminados'); 
  else
    dbms_output.put_line('Los usuarios no requieren ser eliminados');
  end if;

-------------------------------------------------------------------------------------------------------------
----------------------------------------------ELIMINACIÓN DE ROLES------------------------------------------------
-------------------------------------------------------------------------------------------------------------

  select count(*) into v_count
  from dba_roles
  where role = 'ROL_INVITADO' OR role = 'ROL_ADMIN';
  if v_count > 0 then
    execute immediate 'drop role ROL_INVITADO';
    execute immediate 'drop role ROL_ADMIN';
    dbms_output.put_line('Roles eliminados'); 
  else
    dbms_output.put_line('Los roles no requieren ser eliminados');
  end if;
end;
/
set serveroutput off

-------------------------------------------------------------------------------------------------------------
----------------------------------------------INVOCACIÓN DE SCRIPTS------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt Creando usuarios
@@s-01-usuarios.sql
Prompt Creando tablas
@@s-02-entidades.sql
Prompt Creando tablas temporales
@@s-03-tablas-temporales.sql
Prompt Creando tablas temporales
@@s-04-tablas-externas.sql
Prompt Creando tablas externas
@@s-05-secuencias.sql
Prompt Creando indices
@@s-06-indices.sql
Prompt Creando sinonimos
@@s-07-sinonimos.sql
Prompt Creando vistas
@@s-08-vistas.sql
Prompt Carga inicial
@@s-09-carga-inicial.sql
commit;
--Prompt creando función Buscar usuario
--@@s-15-fx-buscar-usuario.sql
Prompt Creando Trigger de promociones
@@s-11-tr-descuentos-cobro
Prompt Validando Trigger de promociones
@@s-12-tr-descuentos-cobro-prueba
Prompt Validando cambios en tabla tarjeta de credito y depurando registros
@@s-14-p-deputa-tarjeta-prueba.sql
Prompt Consultas
@@s-10-consultas.sql
Prompt Prueba Procdimiento penalizacion_calificacion
@@s-14-p-penalizacion_calificacion-prueba.sql
Prompt Probando procedimiento registro_vivienda
@@s-14-p-registro-vivienda-prueba.sql
Prompt Probando trigger envio_notificación
@@s-12-tr-envio_notificacion-prueba.sql
Prompt Prueba Función genera_csv
@@s-16-fx-genera_csv-prueba.sql
Prompt Manejo de archivos Blob
@@s-18-lob-carga_imagen-prueba.sql



