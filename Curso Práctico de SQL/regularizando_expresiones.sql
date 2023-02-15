/*Usar expresiones regulares*/

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}';
/* 
~*: De forma global.
[A-Z0-9.%+-]: Que vayan de la A a la Z sin contar mayúsculas o minúsculas y que vayan 
del 0 al 9(alfanuméricos) o que incluyan algunos caracteres como ._%+-
@[A-Z0-9.-]: específicamente debe existir el caracter @ y luego los demás caracteres y puede tenr . o -
\.[A-Z]{2,4}: termina en . y al final van de 2 a 4 caracteres max.
*/


SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@google[A-Z0-9.-]+\.[A-Z]{2,4}';
-- filtrar correos de google


/*Si en una vista se desea ocultar el nombre de usuario en la dirección de 
correo electrónico se podría usar regex y lpad*/
SET search_path = 'platzi';
SELECT lpad((regexp_matches(email, '^(.*)(@.*)$'))[2], LENGTH(email), '*') AS token_email FROM alumnos;