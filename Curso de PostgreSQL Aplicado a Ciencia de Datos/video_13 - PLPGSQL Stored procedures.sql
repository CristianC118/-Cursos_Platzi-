-- PLPGSQL: Stored procedures

-- crea o reemplaza un procedimiento con lenguaje estandar SQL
create or replace procedure test_dropcreate_procedure()
language sql
as $$
	drop table if exists master;
  create table a_master(bbb char(5) constraint firstkey primary key);
$$;

-- llama a la tabla
call test_dropcreate_procedure();

-- crea o reemplaza una funcion con lenguaje estandar PLPGSQL
create or replace function test_dropcreate_function()
returns void
language plpgsql
as $$
begin -- necesitamos begin para comenzar la creacion
	drop table if exists a_master;
	create table a_master(bbb char(5) constraint firstkey primary key, ccc char(5));

	drop table if exists a_replica;
	create table a_replica(bbba char(5) constraint secondkey primary key, ccca char(5));
end -- y terminamos con end
$$;

-- llama a la funcion
select test_dropcreate_function();

-- Nota: Las PRIMARY KEYS deben de ser únicas en toda la DB.

/*
PLPGSQL - Procedural Language PostgreSQL

Lenguaje que Postgres creó para hacer programación más ordenada y procedural y tiene un componente muy fuerte para 
hacer triggers y store procedures.

	Un procedure o procedimiento:

Es una serie de pasos (similar a una función).
Tienen la característica de que NO regresa ningún valor.
Son parte de SQL Standard.
PLPGSQL es un superset, lenguaje ampliado del Standard SQL , donde se pueden hacer todas las sentencias SQL normales 
o estandar, pero por encima de ello, tiene funciones muy específicas para hacer ciertas cosas, como las funciones, 
procedures o triggers.

	Las funciones:

Son mucho más avanzadas
Permiten más flexibilidad
Retornan tipos de datos
NO son estándar, por lo que necesitaremos PLPGSQL.
*/