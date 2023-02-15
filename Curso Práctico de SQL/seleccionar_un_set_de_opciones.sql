/* Seleccionar resultados en un set */

-- In array --
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id IN (1,2,3,4,5);

-- In con subquery --
SELECT *
FROM platzi.alumnos
WHERE id IN (
    SELECT id
    FROM platzi.alumnos
    WHERE tutor_id = 30
);

/* Traer todos los alumnos que no se encuentren en la lista */

/*1*/
select *
from (
	select row_number() over() as row_id, *
	from platzi.alumnos
) as alumnos_with_row_num
where row_id not in (1, 5, 10, 12, 15, 20);

/*2*/
select *
from platzi.alumnos
where id in (
	select id
	from platzi.alumnos
	where tutor_id not in (1)
);

/*3*/
select *
from platzi.alumnos
where id in(
	select id
	from platzi.alumnos
	where tutor_id!= 26
);