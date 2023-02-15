/*Extraer partes de una fecha*/

-- Con EXTRACT --
SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

-- Con DATE_PART --
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT  DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
        DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
        DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos;


/*Reto: Extrea Horas, Minutos y Segundos*/

/*1*/
select extract(hour from fecha_incorporacion) as hora_inco,
	extract(minute from fecha_incorporacion) as minuto_inco,
	extract(second from fecha_incorporacion) as segundo_inco
from platzi.alumnos;

/*2*/
select date_part('hour', fecha_incorporacion) as hora_inco,
	date_part('minute', fecha_incorporacion) as minuto_inco,
	date_part('second', fecha_incorporacion) as segundo_inco
from platzi.alumnos;