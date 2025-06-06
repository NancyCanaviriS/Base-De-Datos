--Solucion en el sqlzoo


--------------***SELECT basics*****
  1.
--El ejemplo utiliza una cl�usula WHERE para mostrar la poblaci�n de 'Francia'. 
--Tenga en cuenta que las cadenas deben estar entre 'comillas simples';
--Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'germany'

  2.
--Comprobar una lista La palabra IN nos permite comprobar si un elemento est� en una lista. 
--El ejemplo muestra el nombre y la poblaci�n de los pa�ses 'Brasil', 'Rusia', 'India' y 'China'.
--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  3.
--�Qu� pa�ses no son ni demasiado peque�os ni demasiado grandes? 
--Permite la comprobaci�n de rango (el rango especificado incluye los valores de l�mite).
--El siguiente ejemplo muestra pa�ses con un �rea de 250.000-300.000 kil�metros cuadrados.
--Modif�quelo para mostrar el pa�s y el �rea de los pa�ses con un �rea entre 200.000 y 250.000. BETWEEN
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

  --------------***SELECT names*****

--Puede usarlo para encontrar los pa�ses que comienzan con "B". WHERE name LIKE 'B%'
--El % es un comod�n, puede coincidir con cualquier car�cter.
--Buscar el pa�s que comienza con Y
  1.
SELECT name FROM world
  WHERE name LIKE 'Y%'

  2.
--Encuentra los pa�ses que terminan en y
SELECT name FROM world
  WHERE name LIKE '%y'

  3.
--Encuentra los pa�ses que contienen la letra x
SELECT name FROM world
  WHERE name LIKE '%x%'

  4.
--Iceland, Switzerland terminan land - �pero hay otras?
--Encuentra los pa�ses que terminan en land
SELECT name FROM world
  WHERE name LIKE '%land'

  5.
--Columbia comienza con una C y termina con ia, hay dos m�s como esta.
--Encuentra los pa�ses que comienzan con C y terminan con ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

  6.
--Grecia tiene una doble e, �qui�n tiene una doble o?
--Encuentra el pa�s que tiene oo en el nombre
SELECT name FROM world
  WHERE name LIKE '%oo%'

  7.
--Bahamas tiene tres a, �qui�n m�s?
--Encuentre los pa�ses que tienen tres o m�s a en el nombre
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  8.
--India y Angola tienen una n como segundo car�cter. 
--Puede utilizar el car�cter de subrayado como un comod�n de un solo car�cter.
--Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

  9.
--Lesotho y Moldova tienen dos caracteres o separados por otros dos caracteres.
--Encuentre los pa�ses que tienen dos caracteres "o" separados por otros dos.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

10.
--Cuba y Togo tienen nombres de cuatro personajes.
--Encuentra los pa�ses que tienen exactamente cuatro caracteres.
SELECT name FROM world
 WHERE name LIKE '____'

11.
--La capital de Luxemburgo es Luxemburgo. Mostrar todos los pa�ses en los que la capital es la misma que el nombre del pa�s
--Busca el pa�s donde el nombre es la capital.
SELECT name
  FROM world
 WHERE name = capital;

12
--La capital de M�xico es la Ciudad de M�xico. Muestra todos los pa�ses donde la capital tiene el pa�s junto con la palabra "Ciudad".
--Encuentre el pa�s donde la capital es el pa�s m�s "Ciudad".
SELECT name
FROM world
WHERE capital = CONCAT(name,' City');
13
--Encuentre la capital y el nombre donde la capital incluye el nombre del pa�s.

SELECT capital,name
FROM world
WHERE capital like concat('%',name,'%')
14
--Encuentre la capital y el nombre donde la capital es una extensi�n del nombre del pa�s.
--Debes incluir la Ciudad de M�xico, ya que es m�s larga que M�xico. 
--No debes incluir Luxemburgo ya que la capital es la misma que el pa�s.
SELECT capital,name
FROM world
WHERE capital like concat('%',name,'%') and capital >name
15
--La capital de M�naco es Monaco-Ville: este es el nombre de M�naco y la extensi�n es -Ville.
--Muestre el nombre y la extensi�n donde la capital es una extensi�n adecuada (no vac�a) del nombre del pa�s.
--Puede utilizar la funci�n SQL REPLACE.
SELECT name,REPLACE(capital,name,'')
FROM world
WHERE capital like concat('%',name,'%') and capital >name

  --------------*** SELECT from World*****

