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
   1
  --Observe el resultado de ejecutar este comando SQL para mostrar el nombre, el continente y la poblaci�n de todos los pa�ses.
   SELECT name, continent,
   population FROM world
   2
  --Muestre el nombre de los pa�ses que tienen una poblaci�n de al menos 200 millones de habitantes. 200 millones es 200000000, hay ocho ceros.
  SELECT name 
  FROM world
  WHERE population >= 200000000
  3
   --Give the and the per capita GDP pa�ses con una poblaci�n de al menos 200 millones. namepopulation
    SELECT name, GDP/population 
    FROM world
    WHERE population >= 200000000
   4
   --Mostrar el y en millones para los pa�ses de la 'South America'. 
   --Divida la poblaci�n por 1000000 para obtener la poblaci�n en millones. name-population-
       SELECT name, population/1000000
    FROM world
    WHERE continent = 'South America'
   5
   --Mostrar el y para Francia, Alemania, Italia name-population
        SELECT name, population
    FROM world
    WHERE name in( 'France','Italy','Germany')
	6
	--Mostrar los pa�ses que tienen un que incluye la palabra 'United' name
	 SELECT name
    FROM world
    WHERE name like '%United%'
	7
	--Dos formas de ser grande: Un pa�s es grande si tiene una superficie de m�s de 3 millones de kil�metros cuadrados o tiene una poblaci�n de m�s de 250 millones.
	--Muestre los pa�ses que son grandes por superficie o grandes por poblaci�n. Mostrar nombre, poblaci�n y �rea.
	    SELECT name,population,area
    FROM world
    WHERE area> 3000000 or population> 250000000
	8
	--Exclusivo OR (XOR). Muestre los pa�ses que son grandes por superficie (m�s de 3 millones) o grandes 
	--por poblaci�n (m�s de 250 millones), pero no por ambos. Mostrar nombre, poblaci�n y �rea.
	    SELECT name,population,area
    FROM world
    WHERE area> 3000000 xor population> 250000000
	9
	--Muestre el y en millones y el GDP en miles de millones para los pa�ses de la 'South America'.
	--Utilice la funci�n REDONDEAR para mostrar los valores con dos decimales. name-population-continent
		select name,round(population/1000000,2) ,round(GDP/1000000000,2)
    from world
	where continent = 'South America'
	10
	--Muestra el GDP per c�pita de aquellos pa�ses con un PIB de al menos un bill�n (1000000000000; es decir, 12 ceros). 
	--Redondee este valor al 1000 m�s cercano. name
	SELECT name, round(GDP/population,-3) 
    FROM world
    WHERE gdp>= 
	
--------------***SELECT from Nobel*****

1
--Cambie la consulta que se muestra para que muestre los premios Nobel de 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2
--Mostrar qui�n gan� el premio de literatura en 1962.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
3
--Muestra el a�o y el tema que le vali� el premio a 'Albert Einstein'.

SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein'
4
--Mencione el nombre de los ganadores de la "paz" desde el a�o 2000, incluido el 2000.
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
5
--SMostrar todos los detalles (a�o, tema, ganador) de los
--ganadores del Premio de Literatura de 1980 a 1989 inclusive.
SELECT *
  FROM nobel
WHERE yr>=1980 and yr<=1989
and subject ='Literature'
6
--SMostrar todos los detalles de los ganadores presidenciales:
--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter','Barack Obama')
7
--Mostrar los ganadores con el nombre de pila John
SELECT winner FROM nobel
  WHERE winner LIKE 'JOHN %'
8
--Muestre el a�o, la materia y el nombre de los ganadores
--de f�sica de 1980 junto con los ganadores de qu�mica de 1984.
SELECT * FROM nobel
  WHERE yr = 1980 AND subject = 'Physics'
     OR yr = 1984 AND subject = 'Chemistry'
9
--Muestre el a�o, el tema y el nombre de los ganadores de 1980, excluyendo qu�mica y medicina.
SELECT * FROM nobel
  WHERE yr = 1980
    AND subject NOT IN ('Chemistry','Medicine')
10
--Muestre el a�o, el tema y el nombre de las personas que ganaron un 
--premio de "Medicina" en un a�o temprano (antes de 1910, sin incluir 1910) 
--junto con los ganadores de un premio de "Literatura" en un a�o posterior 
--(despu�s de 2004, incluido 2004)
SELECT * FROM nobel
  WHERE yr < 1910 AND subject = 'Medicine'
     OR yr >= 2004 AND subject = 'Literature'

--Harder Questions
11
--Encuentra todos los detalles del premio ganado por PETER GR�NBERG
SELECT * FROM nobel
  WHERE winner = 'Peter Gr�nberg'
12
--Encuentra todos los detalles del premio ganado por EUGENE O'NEILL
SELECT * FROM nobel
  WHERE winner = 'Eugene O''Neill'
13
--Enumere los ganadores, el a�o y el tema donde el ganador comienza con Sir. 
--Muestre primero el m�s reciente y luego por orden de nombre.
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir %'
  ORDER BY yr DESC, winner
14
--La expresi�n sujeto IN ('qu�mica', 'f�sica') se puede usar como un valor: ser� 0 o 1.
--Muestre los ganadores de 1984 y el tema ordenados por tema y nombre del ganador; 
--Pero la qu�mica y la f�sica son las �ltimas.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics'), subject, winner

 --------------***SELECT within SELECT*****
 1
 --Enumere el nombre de cada pa�s en el que la poblaci�n es mayor que la de "Rusia".
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
2
--Muestra los pa�ses de Europa con un PIB per c�pita superior al 'United Kingdom'.
SELECT name FROM world
  WHERE continent = 'Europe'
    AND gdp/population > (SELECT gdp/population
                            FROM world
                           WHERE name = 'United Kingdom')
3
--Enumere el nombre y el continente de los pa�ses en los continentes que 
--contienen Argentina o Australia. Ordenar por nombre del pa�s.
SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
                        WHERE name IN ('Argentina','Australia'))
  ORDER BY name
4
--�Qu� pa�s tiene una poblaci�n mayor que la del Reino Unido pero menor que la de Alemania?
--Mostrar el nombre y la poblaci�n.
SELECT name, population
 FROM world
  WHERE population > (SELECT population FROM world
                        WHERE name = 'United Kingdom')
    AND population < (SELECT population FROM world
                        WHERE name = 'Germany')
5
--Alemania (con una poblaci�n aproximada de 80 millones de habitantes) tiene la mayor poblaci�n de 
--los pa�ses de Europa. Austria (8,5 millones de habitantes) tiene el 11% de la poblaci�n de Alemania.
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world
                          WHERE name = 'Germany')),'%')
             FROM world 
			 WHERE continent = 'Europe'
6
--�Qu� pa�ses tienen un PIB superior al de todos los pa�ses de Europa? [D� solo el nombre.] 
--(Algunos pa�ses pueden tener valores de PIB NULL)
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                   WHERE gdp > 0 AND continent = 'Europe')
7
--Encuentre el pa�s m�s grande (por �rea) en cada continente, muestre el continente, el nombre y el �rea:
--El ejemplo anterior se conoce como subconsulta correlacionada o sincronizada.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
8
--Enumere cada continente y el nombre del pa�s que aparece primero en orden alfab�tico.
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)
9
--Encuentra los continentes donde todos los pa�ses tienen una poblaci�n <= 25000000.
--A continuaci�n, busca los nombres de los pa�ses asociados a estos continentes. 
--Mostrar nombre, continente y poblaci�n.
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL(SELECT population
	                FROM world y
		        WHERE x.continent = y.continent
                        AND y.population>0);
10
--Algunos pa�ses tienen poblaciones m�s de tres veces superiores a la de 
--todos sus vecinos (en el mismo continente). Da los pa�ses y continentes.
SELECT name, continent FROM world x
  WHERE population >= ALL(SELECT population*3
                         FROM world y
                         WHERE x.continent = y.continent
                         and y.name != x.name)
