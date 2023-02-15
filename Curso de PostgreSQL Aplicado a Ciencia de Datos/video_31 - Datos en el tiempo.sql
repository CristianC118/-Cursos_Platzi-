-- Cuantas Rentas tuvo una película en X año y X mes
select
	date_part('year', rentas.fecha_renta) as anio,
	date_part('month', rentas.fecha_renta) as mes,
	peliculas.titulo,
	count(*) as numero_rentas
from rentas
	inner join inventarios on rentas.inventario_id= inventarios.inventario_id
	inner join peliculas on peliculas.pelicula_id= inventarios.pelicula_id
group by anio, mes, peliculas.pelicula_id;

-- Número de Rentas de acuerdo al X año y X mes
select
	date_part('year', rentas.fecha_renta) as anio,
	date_part('month', rentas.fecha_renta) as mes,
	count(*) as numero_rentas
from rentas
group by anio, mes
order by anio, mes;


-- Extra 1
-- Cant de pagos por año, mes, costos percibidos y película
SELECT date_part('year', pagos.fecha_pago) AS anio,
	date_part('month', pagos.fecha_pago) AS mes,
	COUNT (*) AS Cant_pagos,
	SUM (cantidad) AS Cant_$_Rentas,
	peliculas.titulo
FROM pagos
	INNER JOIN rentas ON rentas.renta_id = pagos.renta_id
	INNER JOIN inventarios ON inventarios.inventario_id = rentas.inventario_id
	INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.titulo, anio, mes
ORDER BY cant_pagos DESC;

-- Extra 2
-- Cant de pagos por año, mes, costos percibidos
SELECT date_part('year', pagos.fecha_pago) AS anio,
	date_part('month', pagos.fecha_pago) AS mes,
	COUNT (*) AS Cant_pagos,
	SUM (cantidad) AS Cant_$_Rentas
FROM pagos
GROUP BY anio, mes
ORDER BY anio, mes, cant_pagos DESC;

-- Extra 3
-- Consulta para sacar la Cantidad de pagos mensuales
SELECT
	EXTRACT(YEAR FROM fecha_pago) as anio,
	EXTRACT(MONTH FROM fecha_pago) as mes,
	SUM(cantidad) as total_pago_mensual
FROM pagos
group by anio, mes;