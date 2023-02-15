/*Operaciones con la misma tabla*/
-- Alumnos por carrera --
select carrera_id, count(*) as cuenta
from platzi.alumnos
group by carrera_id
order by cuenta desc;

/*-- Borrar carreras con id entre 30 y 40 --
DELETE FROM platzi.carreras
WHERE id BETWEEN 30 AND 40;*/

-- Exlusive left join --
select 
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
from platzi.alumnos as a
	left join platzi.carreras as c
	on a.carrera_id= c.id
where c.id is null
order by a.carrera_id;

/*Reto: Hacer left join sin excluir gente*/
/*1*/
select 
	a.id,
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
from platzi.alumnos as a
	left join platzi.carreras as c
	on a.carrera_id= c.id
order by a.carrera_id;

/*2*/
select 
	a.id,
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
from platzi.alumnos as a
	full outer join platzi.carreras as c
	on a.carrera_id= c.id
order by a.carrera_id;

/*3*/
select a.id, a.nombre, a.apellido, a.carrera_id, c.id, c.carrera
from platzi.alumnos as a
	left join platzi.carreras as c
	on c.id= a.carrera_id;