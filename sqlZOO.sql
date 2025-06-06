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
   1
  --Observe el resultado de ejecutar este comando SQL para mostrar el nombre, el continente y la población de todos los países.
   SELECT name, continent,
   population FROM world
   2
  --Muestre el nombre de los países que tienen una población de al menos 200 millones de habitantes. 200 millones es 200000000, hay ocho ceros.
  SELECT name 
  FROM world
  WHERE population >= 200000000
  3
   --Give the and the per capita GDP países con una población de al menos 200 millones. namepopulation
    SELECT name, GDP/population 
    FROM world
    WHERE population >= 200000000
   4
   --Mostrar el y en millones para los países de la 'South America'. 
   --Divida la población por 1000000 para obtener la población en millones. name-population-
       SELECT name, population/1000000
    FROM world
    WHERE continent = 'South America'
   5
   --Mostrar el y para Francia, Alemania, Italia name-population
        SELECT name, population
    FROM world
    WHERE name in( 'France','Italy','Germany')
	6
	--Mostrar los países que tienen un que incluye la palabra 'United' name
	 SELECT name
    FROM world
    WHERE name like '%United%'
	7
	--Dos formas de ser grande: Un país es grande si tiene una superficie de más de 3 millones de kilómetros cuadrados o tiene una población de más de 250 millones.
	--Muestre los países que son grandes por superficie o grandes por población. Mostrar nombre, población y área.
	    SELECT name,population,area
    FROM world
    WHERE area> 3000000 or population> 250000000
	8
	--Exclusivo OR (XOR). Muestre los países que son grandes por superficie (más de 3 millones) o grandes 
	--por población (más de 250 millones), pero no por ambos. Mostrar nombre, población y área.
	    SELECT name,population,area
    FROM world
    WHERE area> 3000000 xor population> 250000000
	9
	--Muestre el y en millones y el GDP en miles de millones para los países de la 'South America'.
	--Utilice la función REDONDEAR para mostrar los valores con dos decimales. name-population-continent
		select name,round(population/1000000,2) ,round(GDP/1000000000,2)
    from world
	where continent = 'South America'
	10
	--Muestra el GDP per cápita de aquellos países con un PIB de al menos un billón (1000000000000; es decir, 12 ceros). 
	--Redondee este valor al 1000 más cercano. name
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
--Mostrar quién ganó el premio de literatura en 1962.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
3
--Muestra el año y el tema que le valió el premio a 'Albert Einstein'.

SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein'
4
--Mencione el nombre de los ganadores de la "paz" desde el año 2000, incluido el 2000.
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
5
--SMostrar todos los detalles (año, tema, ganador) de los
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
--Muestre el año, la materia y el nombre de los ganadores
--de física de 1980 junto con los ganadores de química de 1984.
SELECT * FROM nobel
  WHERE yr = 1980 AND subject = 'Physics'
     OR yr = 1984 AND subject = 'Chemistry'
9
--Muestre el año, el tema y el nombre de los ganadores de 1980, excluyendo química y medicina.
SELECT * FROM nobel
  WHERE yr = 1980
    AND subject NOT IN ('Chemistry','Medicine')
10
--Muestre el año, el tema y el nombre de las personas que ganaron un 
--premio de "Medicina" en un año temprano (antes de 1910, sin incluir 1910) 
--junto con los ganadores de un premio de "Literatura" en un año posterior 
--(después de 2004, incluido 2004)
SELECT * FROM nobel
  WHERE yr < 1910 AND subject = 'Medicine'
     OR yr >= 2004 AND subject = 'Literature'

--Harder Questions
11
--Encuentra todos los detalles del premio ganado por PETER GRÜNBERG
SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'
12
--Encuentra todos los detalles del premio ganado por EUGENE O'NEILL
SELECT * FROM nobel
  WHERE winner = 'Eugene O''Neill'
13
--Enumere los ganadores, el año y el tema donde el ganador comienza con Sir. 
--Muestre primero el más reciente y luego por orden de nombre.
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir %'
  ORDER BY yr DESC, winner
14
--La expresión sujeto IN ('química', 'física') se puede usar como un valor: será 0 o 1.
--Muestre los ganadores de 1984 y el tema ordenados por tema y nombre del ganador; 
--Pero la química y la física son las últimas.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics'), subject, winner

 --------------***SELECT within SELECT*****
 1
 --Enumere el nombre de cada país en el que la población es mayor que la de "Rusia".
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
2
--Muestra los países de Europa con un PIB per cápita superior al 'United Kingdom'.
SELECT name FROM world
  WHERE continent = 'Europe'
    AND gdp/population > (SELECT gdp/population
                            FROM world
                           WHERE name = 'United Kingdom')
3
--Enumere el nombre y el continente de los países en los continentes que 
--contienen Argentina o Australia. Ordenar por nombre del país.
SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
                        WHERE name IN ('Argentina','Australia'))
  ORDER BY name
4
--¿Qué país tiene una población mayor que la del Reino Unido pero menor que la de Alemania?
--Mostrar el nombre y la población.
SELECT name, population
 FROM world
  WHERE population > (SELECT population FROM world
                        WHERE name = 'United Kingdom')
    AND population < (SELECT population FROM world
                        WHERE name = 'Germany')
5
--Alemania (con una población aproximada de 80 millones de habitantes) tiene la mayor población de 
--los países de Europa. Austria (8,5 millones de habitantes) tiene el 11% de la población de Alemania.
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world
                          WHERE name = 'Germany')),'%')
             FROM world 
			 WHERE continent = 'Europe'
6
--¿Qué países tienen un PIB superior al de todos los países de Europa? [Dé solo el nombre.] 
--(Algunos países pueden tener valores de PIB NULL)
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                   WHERE gdp > 0 AND continent = 'Europe')
7
--Encuentre el país más grande (por área) en cada continente, muestre el continente, el nombre y el área:
--El ejemplo anterior se conoce como subconsulta correlacionada o sincronizada.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
8
--Enumere cada continente y el nombre del país que aparece primero en orden alfabético.
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)
9
--Encuentra los continentes donde todos los países tienen una población <= 25000000.
--A continuación, busca los nombres de los países asociados a estos continentes. 
--Mostrar nombre, continente y población.
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL(SELECT population
	                FROM world y
		        WHERE x.continent = y.continent
                        AND y.population>0);
10
--Algunos países tienen poblaciones más de tres veces superiores a la de 
--todos sus vecinos (en el mismo continente). Da los países y continentes.
SELECT name, continent FROM world x
  WHERE population >= ALL(SELECT population*3
                         FROM world y
                         WHERE x.continent = y.continent
                         and y.name != x.name)
