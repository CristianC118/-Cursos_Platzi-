-- Para Proyecto de Dashboards

-- Top 10 Películas más Rentadas
select
	peliculas.pelicula_id as id,
	peliculas.titulo,
	count(*) as numero_rentas
from rentas
	inner join inventarios on rentas.inventario_id= inventarios.inventario_id
	inner join peliculas on inventarios.pelicula_id= peliculas.pelicula_id
group by peliculas.pelicula_id
order by numero_rentas desc
limit 10;


-- con Windows Functions... agregando el puesto que ocupa cada registro
select
	peliculas.pelicula_id as id,
	peliculas.titulo,
	count(*) as numero_rentas,
	row_number() over (
		order by count(*) desc
	) as lugar
from rentas
	inner join inventarios on rentas.inventario_id= inventarios.inventario_id
	inner join peliculas on inventarios.pelicula_id= peliculas.pelicula_id
group by peliculas.pelicula_id
order by numero_rentas desc
limit 10;


/*
	Nota:
En los casos que están empatados en vez de utilizar la función ROW_NUMBER(), se utilizaría la 
función la función DENSE_RANK()
*/

select
	peliculas.pelicula_id as id,
	peliculas.titulo,
	count(*) as numero_rentas,
	dense_rank() over (
		order by count(*) desc
	) as lugar
from rentas
	inner join inventarios on rentas.inventario_id= inventarios.inventario_id
	inner join peliculas on inventarios.pelicula_id= peliculas.pelicula_id
group by peliculas.pelicula_id
order by numero_rentas desc
limit 10;


-- Extra 1
SELECT peliculas.pelicula_id AS id, 
	peliculas.titulo,
	COUNT(*) AS numero_rentas,
	-- Window function del top, si se repite el top tienen el mismo lugar
	DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS top 
FROM rentas
	JOIN inventarios 
		ON inventarios.inventario_id = rentas.inventario_id
	JOIN peliculas 
		ON peliculas.pelicula_id = inventarios.pelicula_id
GROUP BY peliculas.pelicula_id
HAVING COUNT(*) > 24 -- Filtrando los 10 mas rentados
ORDER BY numero_rentas DESC;

-- Extra 2
SELECT peliculas.pelicula_id, peliculas.titulo, SUM(cantidad)
FROM (
    SELECT inventario_id, COUNT(*) AS cantidad
    FROM rentas 
    GROUP BY inventario_id
    ) AS busqueda FULL OUTER JOIN inventarios ON
    busqueda.inventario_id=inventarios.inventario_id
    INNER JOIN peliculas ON peliculas.pelicula_id=inventarios.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY SUM(cantidad) DESC