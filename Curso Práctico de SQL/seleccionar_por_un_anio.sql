/*Filtrar los alumnos que se inscribieron en 2019*/

-- Filtro EXTRACT --
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2019;

-- Filtro DATE_PART --
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

-- Filtro subquery DATE_PART --
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2019;


/*Reto: que alumnos se incorporaron en mayo de 2018*/

/*1*/
select id, nombre, colegiatura, fecha_incorporacion, carrera_id
from platzi.alumnos
where (extract(month from fecha_incorporacion))= 5
	and (extract(year from fecha_incorporacion))= 2018;
	
/*2*/
select *
from platzi.alumnos
where fecha_incorporacion::text like'2018-05%';

/*3 'Bueno para sacar trimestre'*/
select *
FROM platzi.alumnos
where fecha_incorporacion>= '2018-05-01' 
	and fecha_incorporacion< '2018-06-01';

/*4*/
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
			DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2018
	AND	mes_incorporacion = 5;

/*5 'Día de la semana donde más se registraron en 2018'*/
select count(*) as total,
case
	when extract(dow from fecha_incorporacion)= 0 then 'Domingo'
	when extract(dow from fecha_incorporacion)= 1 then 'Lunes'
	when extract(dow from fecha_incorporacion)= 2 then 'Martes'
	when extract(dow from fecha_incorporacion)= 3 then 'Miercoles'
	when extract(dow from fecha_incorporacion)= 4 then 'Jueves'
	when extract(dow from fecha_incorporacion)= 5 then 'Viernes'
	when extract(dow from fecha_incorporacion)= 6 then 'Sabado'
end dia_semana
from platzi.alumnos
where extract(year from fecha_incorporacion)= 2018
group by dia_semana
order by total desc;

/*6 'Mes que más incorporaciones hubo'*/
select count(extract(month from fecha_incorporacion)) as conteo,
extract(month from fecha_incorporacion) as mes
from platzi.alumnos
group by mes
order by conteo desc;