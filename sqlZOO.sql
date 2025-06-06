--Solucion en el sqlzoo


--------------***SELECT basics*****
  1.
--El ejemplo utiliza una cláusula WHERE para mostrar la población de 'Francia'. 
--Tenga en cuenta que las cadenas deben estar entre 'comillas simples';
--Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'germany'

  2.
--Comprobar una lista La palabra IN nos permite comprobar si un elemento está en una lista. 
--El ejemplo muestra el nombre y la población de los países 'Brasil', 'Rusia', 'India' y 'China'.
--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  3.
--¿Qué países no son ni demasiado pequeños ni demasiado grandes? 
--Permite la comprobación de rango (el rango especificado incluye los valores de límite).
--El siguiente ejemplo muestra países con un área de 250.000-300.000 kilómetros cuadrados.
--Modifíquelo para mostrar el país y el área de los países con un área entre 200.000 y 250.000. BETWEEN
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

  --------------***SELECT names*****

--Puede usarlo para encontrar los países que comienzan con "B". WHERE name LIKE 'B%'
--El % es un comodín, puede coincidir con cualquier carácter.
--Buscar el país que comienza con Y
  1.
SELECT name FROM world
  WHERE name LIKE 'Y%'

  2.
--Encuentra los países que terminan en y
SELECT name FROM world
  WHERE name LIKE '%y'

  3.
--Encuentra los países que contienen la letra x
SELECT name FROM world
  WHERE name LIKE '%x%'

  4.
--Iceland, Switzerland terminan land - ¿pero hay otras?
--Encuentra los países que terminan en land
SELECT name FROM world
  WHERE name LIKE '%land'

  5.
--Columbia comienza con una C y termina con ia, hay dos más como esta.
--Encuentra los países que comienzan con C y terminan con ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

  6.
--Grecia tiene una doble e, ¿quién tiene una doble o?
--Encuentra el país que tiene oo en el nombre
SELECT name FROM world
  WHERE name LIKE '%oo%'

  7.
--Bahamas tiene tres a, ¿quién más?
--Encuentre los países que tienen tres o más a en el nombre
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  8.
--India y Angola tienen una n como segundo carácter. 
--Puede utilizar el carácter de subrayado como un comodín de un solo carácter.
--Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

  9.
--Lesotho y Moldova tienen dos caracteres o separados por otros dos caracteres.
--Encuentre los países que tienen dos caracteres "o" separados por otros dos.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

10.
--Cuba y Togo tienen nombres de cuatro personajes.
--Encuentra los países que tienen exactamente cuatro caracteres.
SELECT name FROM world
 WHERE name LIKE '____'

11.
--La capital de Luxemburgo es Luxemburgo. Mostrar todos los países en los que la capital es la misma que el nombre del país
--Busca el país donde el nombre es la capital.
SELECT name
  FROM world
 WHERE name = capital;

12
--La capital de México es la Ciudad de México. Muestra todos los países donde la capital tiene el país junto con la palabra "Ciudad".
--Encuentre el país donde la capital es el país más "Ciudad".
SELECT name
FROM world
WHERE capital = CONCAT(name,' City');
13
--Encuentre la capital y el nombre donde la capital incluye el nombre del país.

SELECT capital,name
FROM world
WHERE capital like concat('%',name,'%')
14
--Encuentre la capital y el nombre donde la capital es una extensión del nombre del país.
--Debes incluir la Ciudad de México, ya que es más larga que México. 
--No debes incluir Luxemburgo ya que la capital es la misma que el país.
SELECT capital,name
FROM world
WHERE capital like concat('%',name,'%') and capital >name
15
--La capital de Mónaco es Monaco-Ville: este es el nombre de Mónaco y la extensión es -Ville.
--Muestre el nombre y la extensión donde la capital es una extensión adecuada (no vacía) del nombre del país.
--Puede utilizar la función SQL REPLACE.
SELECT name,REPLACE(capital,name,'')
FROM world
WHERE capital like concat('%',name,'%') and capital >name

  --------------*** SELECT from World*****

