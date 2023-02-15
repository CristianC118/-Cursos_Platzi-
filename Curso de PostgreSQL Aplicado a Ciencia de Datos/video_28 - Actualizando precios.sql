
select 
	peliculas.pelicula_id,
	tipos_cambio.tipo_cambio_id,
	tipos_cambio.cambio_usd * peliculas.precio_renta as precio_mxn
from 
	peliculas,
 	tipos_cambio
where tipos_cambio.codigo= 'MXN';

-- Código para el Trigger: update_precio_tipo_cambio
begin
insert into 
	precio_peliculas_tipo_cambio(
	pelicula_id,
	tipo_cambio_id,
	precio_tipo_cambio,
	ultima_actualizacion
	)
	select 
		new.pelicula_id,
		tipos_cambio.tipo_cambio_id,
		tipos_cambio.cambio_usd * new.precio_renta as precio_tipo_cambio,
		current_timestamp
	from tipos_cambio
	where tipos_cambio.codigo = 'MXN';
	return new;
end

-- Creación del Trigger
create trigger trigger_update_tipos_cambio
    after insert or update
    on public.peliculas
    for each row
    execute procedure public.precio_peliculas_tipo_cambio();
		
/*
	Nota:
Estaba un poco perdido en la parte de la función trigger ahora que eh revisado veo que primero va el insert y 
luego el select para considerar la conversión entonces lo que va ser el disparador es que cada vez que nosotros 
cambiemos un monto el disparado manda el update luego la función trigger se ejecuta y realiza la inserción con los 
campos de la nueva tabla que se realizo previamente luego el select funciona como values ya que recogera lo que se 
selecciona entonces insert into actualiza el dato.

Que beneficio tenemos con esto: que cada vez que queramos actualizar un monto en cualquier precio solamente vas a la 
tabla cambias el precio.
Cual es el superpoder : El resto lo hará el disparador.
*/