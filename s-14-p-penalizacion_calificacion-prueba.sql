--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO, PAREDES PACAB ROSAURA ELENA.
--@Fecha creación: 04/06/2022
--@Descripción: Procedimiento para penalizar la calificación de una vivienda para alquiler que no responde mensajes.
connect jp_proy_admin/mg

Prompt Creando trigger vivienda_alquiler_inactiva
@@s-11-tr-vivienda-alquiler-inactiva.sql
Prompt Creando trigger historico_est_vivienda
@@s-11-tr-historico_est_vivienda.sql
Prompt Creando Procedimiento penalizacion_calificacion
@@s-13-p-penalizacion_calificacion.sql

set serveroutput on
select q.mensaje_id,q.visto,q.respuesta_id,q.vivienda_id,v.usuario_id,
  a.alquiler_id, ca.calificacion_alquiler_id,ca.calificacion,v.estatus_vivienda_id
  from(
    select *
      from mensaje
    where visto = 1
  intersect
    select *
      from mensaje
    where respuesta_id is null
  intersect
    select *
      from mensaje 
  ) q 
  join vivienda v
  on v.vivienda_id = q.vivienda_id
  join vivienda_vacacionar vv
  on v.vivienda_id = vv.vivienda_id
  join alquiler a
  on vv.vivienda_id = a.vivienda_id
  join calificacion_alquiler ca
  on ca.alquiler_id = a.alquiler_id; 


begin
  dbms_output.put_line('Empezando proceso de penalización en la calificación de viviendas para alquilar');
  penalizacion_calificacion();
  dbms_output.put_line('El Procedimiento finalizo correctamente');

  commit;
  exception
    when others then
      dbms_output.put_line('Codigo: ' || sqlcode);
      dbms_output.put_line('Mensaje: ' || sqlerrm);
      rollback;
end;
/

select q.mensaje_id,q.visto,q.respuesta_id,q.vivienda_id,v.usuario_id,
  a.alquiler_id, ca.calificacion_alquiler_id,ca.calificacion,v.estatus_vivienda_id
  from(
    select *
      from mensaje
    where visto = 1
  intersect
    select *
      from mensaje
    where respuesta_id is null
  intersect
    select *
      from mensaje 
  ) q 
  join vivienda v
  on v.vivienda_id = q.vivienda_id
  join vivienda_vacacionar vv
  on v.vivienda_id = vv.vivienda_id
  join alquiler a
  on vv.vivienda_id = a.vivienda_id
  join calificacion_alquiler ca
  on ca.alquiler_id = a.alquiler_id; 

select * from hist_estatus_vivienda
where fecha_estatus = sysdate;
