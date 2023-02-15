-- creacion de la funcion
create or replace function movies_stats()
returns void
language plpgsql
as $$
declare -- Declaracion de variables 
	total_rated_r real:= 0.0;
	total_larger_than_100 real:= 0.0;
	total_published_2006 real:= 0.0;
	average_duracion real:= 0.0;
	average_rental_price real:= 0.0;
begin -- asignar a cada variable el valor de la consulta a realizar
	total_rated_r := count(*) from peliculas where clasificacion= 'R';
	total_larger_than_100 := count(*) from peliculas where duracion> 100;
	total_published_2006 := count(*) from peliculas where anio_publicacion= 2006;
	average_duracion := avg(duracion) from peliculas;
	average_rental_price := avg(precio_renta) from peliculas;
	
	truncate table peliculas_estadisticas; -- borra lo que hay en la tabla y guarda nuevos datos
	
	insert into peliculas_estadisticas(tipo_estadistica, total)
	values
		('Peliculas con clasificacion R', total_rated_r),
		('Peliculas de mas de 100 minutos', total_larger_than_100),
		('Peliculas publicadas en 2006', total_published_2006),
		('Promedio de duracion en minutos', average_duracion),
		('Precio promedio de renta', average_rental_price);
end
$$;

-- Llamada a la funcion
select movies_stats();