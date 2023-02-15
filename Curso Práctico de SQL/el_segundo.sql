/*
 * Encuentra la segunda colegiatura más alta
 * encuentra todos los alumnos con esa misma colegiatura
 */

-- Contar por join entre las tablas /trae la segunda colegiatura más alta--
select distinct colegiatura
from platzi.alumnos as a1
where 2= (
	select count(distinct colegiatura)
	from platzi.alumnos as a2
	where a1.colegiatura<= a2.colegiatura
);

-- Sencillo con limit /trae la segunda colegiatura más alta con el tutor--
select distinct colegiatura, tutor_id
from platzi.alumnos
where tutor_id= 1
order by colegiatura desc
limit 1 offset 1;

-- Join con subquery /trae la segunda colegiatura más alta con todos los datos + columna extra--
select *
from platzi.alumnos as datos_alumnos
inner join(
	select distinct colegiatura
	from platzi.alumnos
	where tutor_id= 20
	order by colegiatura desc
	limit 1 offset 1
) as segunda_mayor_colegiatura
on datos_alumnos.colegiatura= segunda_mayor_colegiatura.colegiatura;


-- Subquery en Where / trae la segunda colegiatura más alta con todos los datos--
select *
from platzi.alumnos as datos_alumnos
where colegiatura= (
	select distinct colegiatura
	from platzi.alumnos
	where tutor_id= 20
	order by colegiatura desc
	limit 1 offset 1
);


/* trae la segunda mitad de la tabla */

/*1*/
select *
from platzi.alumnos
limit 501 offset 499;

/*2*/
select *
from platzi.alumnos
where id>= 500;

/*3*/
select *
from platzi.alumnos
offset(
	select (count(id)/2)
	from platzi.alumnos
);

/*3 (Forma 2)*/
select row_number() over() as row_id, *
from platzi.alumnos
offset(
	select (count(id)/2)
	from platzi.alumnos
);