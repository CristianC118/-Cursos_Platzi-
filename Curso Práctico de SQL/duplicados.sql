/*Borrar los registros duplicados de una tabla*/

-- Subquery by id --
select *
from platzi.alumnos as ou
where (
	select count(*)
	from platzi.alumnos as inr
	where ou.id= inr.id
)> 1;

-- Hash text --
SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;

-- Hash excluyendo ID --
select (
  platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
			 )::text, count(*)
from platzi.alumnos
group by   
	platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
having count(*)> 1;

-- Partición por todos los campos excepto ID --
select *
from (
	select id,
	row_number() over(
		partition by
			nombre,
			apellido,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		order by id asc
	) as cantidad_dupli,
	*
	from platzi.alumnos
) as duplicados
where duplicados.cantidad_dupli> 1;

/*Reto Eliminar Duplicado*/
delete from platzi.alumnos
where id in (
select id
from (
	select id,
	row_number() over(
		partition by
			nombre,
			apellido,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		order by id asc
	) as cantidad_dupli
	from platzi.alumnos
) as duplicados
where duplicados.cantidad_dupli> 1);