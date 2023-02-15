
-- ENUM hace referencia a Enumerated Types, algo a tener en cuenta que esta funcion es case sensitive
create type humor as enum('triste', 'normal', 'feliz');

create table persona_prueba(
	nombre text,
	humor_actual humor
);
-- al tratar de insertar un dato que no está predefinido en la creación de datos
insert into persona_prueba values ('Pablo', 'feliz');

select * from persona_prueba;