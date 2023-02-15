-- Obtener la colegiatura promedio por carrera --
select *,
	avg(colegiatura) over(partition by carrera_id)
from platzi.alumnos;

-- Si no se especifica una partición se toma toda la info de la tabla --
select *,
	avg(colegiatura) over()
from platzi.alumnos;

-- Obtener la suma de las colegiaturas incrementales de menor a mayor --
-- Con order by se toamen todos los valores ordenados antes o iguales a la tupla actual --
select *,
	sum(colegiatura) over(order by colegiatura)
from platzi.alumnos;

-- Obtener la suma de colegiaturas por carrera ordenadas por colegiatura de menor a mayor --
select *,
	sum(colegiatura) over(partition by carrera_id order by colegiatura)
from platzi.alumnos;

-- Obtener el lugar que ocupa la tupla actual en el frame de carrera con orden por colegiatura de mayor a menor --
select *,
	rank() over(partition by carrera_id order by colegiatura desc)
from platzi.alumnos;

-- Obtener el lugar que ocupa la tupla actual en el frame de carrera con orden por colegiatura de mayor a menor --
-- Con orden posterior --
select *,
	rank() over(partition by carrera_id order by colegiatura desc) as brand_rank
from platzi.alumnos
order by carrera_id, brand_rank;

-- Intento de wherer en el mismo query --
select *,
	rank() over(partition by carrera_id order by colegiatura desc) as brand_rank
from platzi.alumnos
where brand_rank< 3
order by carrera_id, brand_rank;

-- Filtrado where en subquery --
select *
from (
	select *,
	rank() over(partition by carrera_id order by colegiatura desc) as brand_rank
	from platzi.alumnos
) as rank_colegiaturas_por_carreras
where brand_rank< 3
order by brand_rank;