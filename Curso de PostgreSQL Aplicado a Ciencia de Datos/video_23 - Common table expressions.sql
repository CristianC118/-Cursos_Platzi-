-- Common table expressions

-- con with se define una CTE's
-- creación de una tabla recursiva
with recursive tabla_recursiva(n) as (
	values(1)
	union all
	select n + 1 -- n seria el valor actual de la iteración igual al i de for (python)
	from tabla_recursiva 
		where n < 100
) select sum(n) from tabla_recursiva;