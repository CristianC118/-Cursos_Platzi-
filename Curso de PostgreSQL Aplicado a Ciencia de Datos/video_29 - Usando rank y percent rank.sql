
-- devuelve percentil
select
	peliculas.pelicula_id as id,
	peliculas.titulo,
	count(*) as numero_rentas,
	percent_rank() over (
		order by count(*) desc
	) as lugar
from rentas
	inner join inventarios on rentas.inventario_id= inventarios.inventario_id
	inner join peliculas on inventarios.pelicula_id= peliculas.pelicula_id
group by peliculas.pelicula_id
order by numero_rentas desc;

-- dense_rank Devuelve Rangos
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
order by numero_rentas desc;