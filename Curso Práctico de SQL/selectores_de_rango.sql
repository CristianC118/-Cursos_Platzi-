/*Rangos y solapes*/

-- Ejemplos iniciales --
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (11,12,13,14,15,16,17,18,19,20);

SELECT *
FROM platzi.alumnos
WHERE tutor_id >= 1
    AND tutor_id <= 10;

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 11 AND 20;

-- ¿En rango? --
SELECT int4range(10, 20) @> 3;

-- ¿Se solapan? --
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

-- Obtener el límite superior --
SELECT upper(int8range(15, 25));

-- Calcular la intersección --
SELECT int4range(10, 20) * int4range(15, 25);

-- ¿Rango vacío?
SELECT isempty(numrange(1, 5));

-- Filtrar alumnos cuyo tutor_id esté entre 1 y 10 --
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;

/*Reto: Ver intersección o valores en común entre tutor_id y carrera_id*/
/*1*/
SELECT INT4RANGE(MIN(tutor_id), MAX(tutor_id)) * INT4RANGE(MIN(carrera_id), MAX(carrera_id))
FROM platzi.alumnos;

/*2*/
SELECT 
	numrange(min_carrera, max_carrera) * numrange(min_tutor, max_tutor)
FROM (
	SELECT 
		MIN(carrera_id) as min_carrera,
		MAX(carrera_id) as max_carrera,
		MIN(tutor_id) as min_tutor,
		MAX(tutor_id) as max_tutor
	FROM platzi.alumnos
) AS rangos;

/*3*/
SELECT numrange(
	(SELECT min(tutor_id) FROM platzi.alumnos),
	(SELECT max(tutor_id) FROM platzi.alumnos)
) * numrange(
	(SELECT min(carrera_id) FROM platzi.alumnos),
	(SELECT max(carrera_id) FROM platzi.alumnos)
);

/*Extras*/
SELECT *
FROM platzi.alumnos
WHERE tutor_id= carrera_id;
---
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (carrera_id);