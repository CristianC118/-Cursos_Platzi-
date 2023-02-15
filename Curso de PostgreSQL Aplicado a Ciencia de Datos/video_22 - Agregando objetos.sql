

select
	min(
		cast(
			info -> 'items' ->> 'cantidad' as int
		)
	),
	
	max(
		cast(
			info -> 'items' ->> 'cantidad' as int
		)
	),
	
	sum(
		cast(
			info -> 'items' ->> 'cantidad' as int
		)
	),
	
	avg(
		cast(
			info -> 'items' ->> 'cantidad' as int
		)
	)
from ordenes;