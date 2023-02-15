/* Nota: 
1- Count(*) : Cuenta la cantidad de registros (Cantidad de filas) de la consulta (todas, sin discriminar si 
son duplicados).

2- Count(Distinct <Campo objetivo >) : Cuenta la cantidad distinta de registros de la consulta 
(discriminando duplicados, considerando solo los campos únicos).
*/

select max(ultima_actualizacion) as fecha_ultima_actualizacion,
	clasificacion,
	count(*) as cantidad_peliculas
from peliculas
where duracion_renta> 3
group by clasificacion, ultima_actualizacion
order by fecha_ultima_actualizacion;