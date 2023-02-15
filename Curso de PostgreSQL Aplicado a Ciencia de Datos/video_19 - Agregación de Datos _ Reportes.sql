-- Agregación de Datos: hallar forma de juntar para sacar totales de datos sumarizados para usarlos en reportes o BI

-- sentencia MAX
select max(precio_renta)
from peliculas;

-- agrupación con MAX
select titulo, max(precio_renta)
from peliculas
group by titulo;

-- funcion sum
select sum(precio_renta)
from peliculas;

-- funcion count
SELECT clasificacion, count(*)
from peliculas
group by clasificacion;

-- funcion avg
select avg(precio_renta)
from peliculas;

-- cuál es el precio promedio dependiendo la clasificación de la película
select clasificacion, avg(precio_renta) as precio_avg
from peliculas
group by clasificacion
order by precio_avg desc;

-- duración de la película de acuerdo a su clasificación
select clasificacion, avg(duracion) as duracion_avg
from peliculas
group by clasificacion
order by duracion_avg desc;

-- promedio de la duracion de la renta
select clasificacion, avg(duracion_renta) as duracion_renta_avg
from peliculas
group by clasificacion
order by duracion_renta_avg desc;


/*
		Notas:
	A tener en cuenta que count(*) cuenta todas la filas y count(campo) no toma encuenta 
los campos con valores nulos al realizar la cuenta.
*/

-- pista... funcion min
-- Reto: sacar el mínimo de la tabla  y el mínimo agrupado por grupo de películas
