/*Operaciones con la misma tabla*/

-- Relacion alumno / tutor --
SELECT	a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Operaciones de texto concat --
SELECT	CONCAT(a.nombre, ' ', a.apellido) AS alumno,
		CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Contando alumnos por tutor --
SELECT	CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 5;


/*Reto: Promedio general de alumnos por tutor*/
/*1*/
select avg(p_alumnos) as promedio_alumnos
from (
	select count(*) as p_alumnos
	from platzi.alumnos
	group by tutor_id
) as tabla;

/*2*/
SELECT AVG(alumnos_por_tutor) AS promedio_alumnos
FROM(
SELECT CONCAT(t.nombre,' ',	t.apellido) AS tutor,
		COUNT(*)   AS alumnos_por_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id=t.id

GROUP BY tutor	
ORDER BY alumnos_por_tutor DESC
) AS promedio

/*3??*/
select avg(cant_alumnos)
from(
	select concat(pa_cp.nombre, ' ', pa_cp.apellido) as tutor,
		count(*) as cant_alumnos
	from platzi.alumnos as pa_or -- pa: platzi alumnos | or: original
	inner join platzi.alumnos as pa_cp -- cp: copy
		on pa_or.tutor_id= pa_cp.id
	-- todo tutor es a la vez alumno, por eso el self join
group by tutor
order by cant_alumnos desc
) as query_cant_alumnos;