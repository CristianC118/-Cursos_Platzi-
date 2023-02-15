-- Trabajando con Objetos / JSON

-- creación de una tabla para formato json
create table ordenes (
	id serial not null primary key,
	info json not null
);

-- Inserción de Datos
insert into ordenes(info)
values
	(
		'{"cliente": "David Sanchez", "items": {"producto": "Biberón", "cantidad": 24}}'
  ),
	
	(
    '{ "cliente": "Edna Cardenas", "items": {"producto": "Carro de juguete","cantidad": 1}}'
	),
	
	(
    '{ "cliente": "Israel Vazquez", "items": {"producto": "Tren de juguete","cantidad": 2}}'
  );
	

-- Extrae los datos con formato JSON
select
	info -> 'cliente' as cliente
from ordenes;

-- Extrae los datos con el tipo de dato asignado por Postgres
select
	info ->> 'cliente' as cliente
from ordenes;

-- usando filtros con un campo json
select
	info ->> 'cliente' as cliente
from ordenes
where info -> 'items' ->> 'producto'= 'Biberón';


/*
PostgreSQL permite trabajar directamente con objetos tipo JSON esto es una funcionalidad que no brindan todos 
los manejadores de datos porque trabajar con objetos JSON es complicado ya que son una cadena de texto con una 
estructura especifica, y lo que suele ocurrir es que los manejadores de datos guardan un string que evalúan en cada 
consulta que se les haga.

PostgresSQL posee el tipo de dato json y jsonb que guarda los datos de forma binaria, estos tipos de datos permiten 
que internamente postgresql guarde una estructura con la que puede trabajar más cómodamente los tipos de datos json.

JSON Texto plano - Es unicamente un string de texto.
JSON Binary - Es más rápido de procesar ya que se guarda como un archivo binario.
El uso de objetos nos dará más flexibilidad en el trabajo.
*/