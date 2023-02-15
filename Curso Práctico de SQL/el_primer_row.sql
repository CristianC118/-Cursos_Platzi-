/*Primer row de la tabla*/

/*1*/
select *
from platzi.alumnos
fetch first 5 rows only;

/*2*/
select *
from (
	select row_number() over() as row_id, *
	from platzi.alumnos
) as alumnos_with_row_num
where row_id< 6;

/*3*/
select *
from platzi.alumnos
limit 5;

/*4*/
select *
from platzi.alumnos
where id< 6;

/*5*/
SELECT * FROM platzi.alumnos WHERE id between 1 and 5;