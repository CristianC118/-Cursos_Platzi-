/*Tipos de JOIN*/
-- Left Join Exclusivo: Intersección --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL;

-- Left Join --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Right Join Exclusivo: Intersección --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id;

-- Right Join --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Inner Join: Producto cartesiano | Solo las que existen en ambas tablas--
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	INNER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Diferencia simétrica --
select
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
from platzi.alumnos as a
	full outer join platzi.carreras as c
	on a.carrera_id= c.id
where a.id is null
	or c.id is null
order by a.carrera_id desc, c.id desc;