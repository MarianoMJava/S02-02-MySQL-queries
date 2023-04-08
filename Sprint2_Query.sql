#SCRIPT 2#
#DIAGRAMA UNIVERSIDAD#
#Ejercicio1#
SELECT apellido1 , apellido2, nombre , tipo FROM persona WHERE tipo = "Alumno" ORDER BY apellido1, apellido2, nombre  ASC;

#Ejercicio 2#
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;

#Ejercicio 3#
SELECT * FROM persona WHERE tipo = "Alumno" AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-12';

#EJercicio4#
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE '%k';

#Ejercicio 5#
SELECT * FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;

#Ejercicio 6#
SELECT  per.apellido1, per.apellido2, per.nombre,d.nombre AS "Departamento" FROM profesor AS p JOIN departamento AS d ON d.id = p.id_departamento JOIN persona AS per ON p.id_profesor = per.id ORDER BY apellido1, nombre ASC;

#Ejercicio 7#

SELECT p.nombre, p.apellido1, p.apellido2, p.nif, asignatura.nombre AS asignatura, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura AS aa JOIN curso_escolar AS ce ON aa.id_curso_escolar = ce.id JOIN asignatura  ON aa.id_asignatura = asignatura.id JOIN persona AS p ON p.id = aa.id_alumno WHERE p.nif = '26902806M';

#Ejercicio 8#
SELECT  departamento.nombre AS 'departamentos'  FROM asignatura AS a JOIN grado ON a.id_grado = grado.id JOIN profesor ON a.id_profesor = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;

#Ejercicio 9#
SELECT p.id, p.nombre, p.apellido1, ce.anyo_inicio, ce.anyo_fin, a.nombre AS 'Nombre_asignatura' FROM alumno_se_matricula_asignatura AS am JOIN curso_escolar AS ce ON am.id_curso_escolar = ce.id JOIN persona AS p ON am.id_alumno = p.id JOIN asignatura AS a ON am.id_asignatura = a.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

#LEFT JOIN & RIGHT JOIN#
#Ejercicio 1#
SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre AS 'Departamento', persona.tipo FROM profesor RIGHT JOIN persona ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.nombre;

#Ejercicio 2#
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE tipo = 'profesor' AND profesor.id_departamento IS NULL;

#EJERCICIOS RESUMEN
#Ejercicio 1#
SELECT COUNT(id), tipo FROM persona WHERE tipo = 'alumno';

#Ejercicio 2#
SELECT COUNT(id) FROM persona WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' ;

#Ejercicio 3#
SELECT departamento.nombre, COUNT(id_profesor) FROM profesor JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.id ORDER BY COUNT(id_profesor) DESC;

#Ejercicio 4#
SELECT departamento.nombre, COUNT(id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(id_profesor) DESC;

#Ejercicio 5#
SELECT grado.nombre, COUNT(asignatura.id) FROM asignatura RIGHT JOIN grado ON grado.id = asignatura.id GROUP BY grado.id  ORDER BY COUNT(asignatura.id) DESC; 

#Ejercicio 6#
SELECT COUNT(a.id) AS 'NroMaterias', g.nombre  FROM asignatura AS a JOIN grado AS g ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.id) > 40;

#Ejercicio 7#
SELECT a.tipo, SUM(creditos) FROM asignatura AS a GROUP BY a.tipo;

#Ejercicio 8#
SELECT COUNT(am.id_alumno) AS 'AlumnosMatriculados', ce.anyo_inicio  FROM alumno_se_matricula_asignatura AS am RIGHT JOIN curso_escolar AS ce ON am.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio;

#Ejercicio 9#
SELECT COUNT(asignatura.id) AS 'CantAsig.', persona.nombre, persona.apellido1, persona.apellido2 FROM profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN persona ON persona.id = profesor.id_profesor GROUP BY profesor.id_profesor  ORDER BY COUNT(asignatura.id) DESC ;

#DIAGRAMA TIENDA#
#Ejercicio 1#
SELECT nombre FROM producto;

#Ejercicio 2#
SELECT nombre, precio FROM producto;

#Ejercicio 3#
SELECT * FROM producto;

#Ejercicio 4#
SELECT nombre, precio AS 'precioEuro', precio*1.09 AS 'precioDolar' FROM producto;

#Ejercicio 5#
SELECT nombre AS 'nombreProducto', precio AS 'Euro', precio*1.09 AS 'Dolar' FROM producto;

#Ejercicio 6#
SELECT UCASE(producto.nombre), precio FROM producto;

#Ejercicio 7#
SELECT LCASE(producto.nombre), precio FROM producto;

#Ejercicio 8#
SELECT nombre, UCASE(SUBSTRING(nombre,1,2)) AS 'Iniciales' FROM fabricante;

#Ejercicio 9#
SELECT nombre, precio, ROUND(precio, 0) AS 'PrecioRedondeado' FROM producto;

#Ejercicio 10#
SELECT nombre, precio, TRUNCATE(precio, 0) AS 'PrecioTruncado' FROM producto;

#Ejercicio 11#
SELECT f.codigo AS 'CodigoFabricante' , p.nombre AS 'NombreProducto', precio  FROM fabricante AS f JOIN producto AS p ON f.codigo = p.codigo_fabricante;

#Ejercicio 12#
SELECT f.codigo AS 'CodigoFabricante' FROM fabricante AS f JOIN producto AS p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo;

#Ejercicio 13#
SELECT nombre FROM fabricante ORDER BY nombre ASC;

#Ejercicio 14#
SELECT nombre FROM fabricante ORDER BY nombre DESC;

#Ejercicio 15#
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

#EJercicio 16#
SELECT * FROM fabricante LIMIT 5;

#Ejercicio 18#
SELECT * FROM producto ORDER BY precio ASC LIMIT 1;

#Ejercicio 19#
SELECT * FROM producto ORDER BY precio DESC LIMIT 1;