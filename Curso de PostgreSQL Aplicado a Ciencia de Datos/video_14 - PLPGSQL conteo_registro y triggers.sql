-- crear un conteo total de peliculas
create or replace function count_total_movies()
returns int
language plpgsql
as $$
begin
	return count(*) from peliculas;
end
$$;

select count_total_movies();

-- al haber un insert en un tabla duplica ese registro en otra tabla
create or replace function duplicate_records()
returns trigger
language plpgsql
as $$
begin
	insert into a_replica(bbba, ccca)
	values (new.bbb, new.ccc);
	return new;
end
$$;

-- creando el trigger
create trigger a_master_changes
	before insert
	on a_master
	for each row
	execute procedure duplicate_records();

-- insertando valores para probar el trigger
insert into a_master(bbb, ccc)
values ('abcde', 'efghi')