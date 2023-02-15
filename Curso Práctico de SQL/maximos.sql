/*Encontrar máximos*/

-- Máximo absoluto de la tabla --
select *
from platzi.alumnos
order by fecha_incorporacion desc
limit 1;

-- Intento por GROUP BY --
SELECT carrera_id, fecha_incorporacion
FROM platzi.alumnos
GROUP BY carrera_id, fecha_incorporacion
ORDER BY fecha_incorporacion DESC;

-- Funcion MAX --
SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

/*Reto: Sacar el mínimo nombre que existe alfabeticamente. Mínimo por ID tutor*/
/*1*/
select max(nombre)
from platzi.alumnos

/*2*/
SELECT tutor_id,MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id;

/*3*/
select *
from platzi.alumnos
where tutor_id= 1;

/*4*/
SELECT	tutor_id, MIN(nombre)
FROM	platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;

/* Reto Personal: El estudiante que se matriculó de ultimo en cada carrera*/

SELECT *
FROM(
	SELECT DISTINCT  MAX(fecha_incorporacion) as t, carrera_id
	FROM platzi.alumnos AS a1
	GROUP BY carrera_id
) AS seleccion 

INNER JOIN platzi.alumnos
ON seleccion.t = fecha_incorporacion
ORDER BY alumnos.carrera_id;