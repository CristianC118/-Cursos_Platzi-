/*Generar un triángulo*/

-- Funcion lpad --
SELECT lpad('sql', 15, '*');

-- Lpad con incrementales --
SELECT lpad ('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

-- Generar un triángulo usando Lpad --
SELECT lpad ('*', id, '*')
FROM platzi.alumnos
WHERE id < 4;

-- Desordenando el triángulo --
SELECT lpad ('*', id, '*')
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

-- Tabla con row_id --
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <= 5;

-- lpad con row_id --
SELECT lpad('*', CAST (row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <= 10;

-- Reordenando lpad con row_id --
SELECT lpad('*', CAST (row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <= 10;

/*Notas*/

/*1- Diagrama de Barras de una variable*/
SELECT CONCAT(nombre, ' ', apellido) ,colegiatura, LPAD('|', CAST(colegiatura AS int)/100, '|') AS coleg_bar
FROM platzi.alumnos;

/*2- Tokenizar información*/
SELECT rpad(SUBSTR(nombre, 1, 2),LENGTH(nombre),'*'), nombre,
       rpad(SUBSTR(apellido, 1, 2),LENGTH(apellido),'*'), apellido,
	   rpad(SUBSTR(email, 1, 2),LENGTH(email),'*'), email
FROM platzi.alumnos;

/*3- Colocar puntuación*/
select a.id, a.nombre, a.apellido, a.promedio, lpad('⭐', cast(promedio as int)/2,'⭐') as puntaje
from platzi.alumnos as a
order by promedio  desc;