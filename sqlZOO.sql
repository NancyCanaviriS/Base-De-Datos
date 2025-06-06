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

  --------------***SUM and COUNT*****
  1
  --world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world
2
--Enumere todos los continentes, solo una vez cada uno.
SELECT DISTINCT continent FROM world
3
--Da el GDP total de �frica
SELECT SUM(gdp) FROM world
  WHERE continent = 'Africa'

4
--�Cu�ntos pa�ses tienen una superficie de al menos 1000000?
SELECT COUNT(name) FROM world
  WHERE area >= 1000000
5
--�Cu�l es la poblaci�n total de ('Estonia', 'Letonia', 'Lituania')
SELECT SUM(population) FROM world
  WHERE name IN ('Estonia','Latvia','Lithuania')
6
--Para cada continente, muestre el continente y el n�mero de pa�ses.
SELECT continent, COUNT(continent ) 
FROM world
GROUP BY continent
7
--Para cada continente, muestre el continente y el n�mero 
--de pa�ses con poblaciones de al menos 10 millones.
SELECT continent, COUNT(name) FROM world
  WHERE population > 10000000
  GROUP BY continent
8
--Enumere los continentes que tienen una poblaci�n
--total de al menos 100 millones.
SELECT continent FROM world
  GROUP BY continent
  HAVING SUM(population) > 100000000

 --------------***JOIN*****
 1
 --Modif�calo para que muestre el matchid y el nombre del jugador de todos los goles marcados por Alemania. 
 --Para identificar a los jugadores alemanes, comprueba: teamid = 'GER'
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'
2
--Observe que la columna de la tabla corresponde a la columna de la tabla. 
--Podemos buscar informaci�n sobre el juego 1012 encontrando esa fila en la mesa de juego.
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012
3
--Modif�calo para mostrar el jugador, el teamid, el estadio y la fecha de cada porter�a alemana.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'
4
--Utilice el mismo que en la pregunta anterior. JOIN
SELECT team1, team2, player FROM game
  JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'
5
--La tabla da detalles de cada equipo nacional, incluido el entrenador. Puedes usar la 
--frase eteamJOINgoaleteamgoal JOIN eteam on teamid=id
SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam on (teamid=id)
 WHERE gtime<=10
 6
 --Enumere las fechas de los partidos y el nombre del equipo en 
 --el que 'Fernando Santos' fue el entrenador del equipo1.
SELECT mdate,teamname FROM game
  JOIN eteam ON (team1 = eteam.id)
  WHERE coach = 'Fernando Santos'
7
--Enumera el jugador por cada gol marcado en 
--un partido en el que el estadio era 'National Stadium, Warsaw'
SELECT player FROM goal
  JOIN game ON (matchid = id)
  WHERE stadium = 'National Stadium, Warsaw'
8
--En su lugar, muestra el nombre de todos los jugadores 
--que marcaron un gol contra Alemania.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1= 'GER' OR team2='GER')
    AND teamid != 'GER'
9
--Muestra el nombre del equipo y el n�mero total de goles marcados.
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
10
--Muestra el estadio y el n�mero de goles marcados en cada estadio.
SELECT stadium, COUNT(*) FROM goal
  JOIN game ON (matchid = id)
  GROUP BY stadium
12
--Para cada partido en el que haya marcado 'GER', muestra el matchid, 
--la fecha del partido y el n�mero de goles marcados por 'GER'
SELECT matchid, mdate, COUNT(*) FROM goal
  JOIN game ON (matchid=id)
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate
13
--Observe que en la consulta dada se enumeran todos los objetivos.
--Si fue un gol de equipo1, entonces aparece un 1 en score1, de lo contrario, hay un 0. 
--Podr�as sumar esta columna para obtener un recuento de los goles marcados por team1.
--Ordena tu resultado por mdate, matchid, team1 y team2.
SELECT DISTINCT mdate, team1,
	SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY id, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2

 --------------***More JOIN operations**********
 1
 --Enumere las pel�culas en las que el a�o es 1962 [Mostrar identificaci�n, t�tulo]
SELECT id, title
 FROM movie
 WHERE yr=1962

2
--Regala el a�o de 'Ciudadano Kane'.
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane'

3
--Haga una lista de todas las pel�culas de Star Trek, incluya el id, el t�tulo y 
--el a�o (todas estas pel�culas incluyen las palabras Star Trek en el t�tulo). Ordene los resultados por a�o.
SELECT id, title, yr FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr
4
--�Qu� n�mero de identificaci�n tiene el actor 'Glenn Close'?
SELECT id FROM actor
  WHERE name = 'Glenn Close'

5
--�Cu�l es la identidad de la pel�cula 'Casablanca'?
SELECT id FROM movie
  WHERE title = 'Casablanca'

6
--Obt�n la lista de actores de 'Casablanca'.
--�Qu� es una lista de reparto?
--Use movieid=11768, (o cualquier valor que haya obtenido de la pregunta anterior)
SELECT name FROM casting JOIN actor ON (id=actorid)
  WHERE movieid=11768

7
--Obt�n la lista de actores de la pel�cula 'Alien'
SELECT name FROM casting
  JOIN actor ON (actor.id=actorid)
  JOIN movie ON (movie.id=movieid)
  WHERE title = 'Alien'

8
--Listado de las pel�culas en las que ha aparecido 'Harrison Ford'
SELECT title FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE name = 'Harrison Ford'

9
--Enumera las pel�culas en las que ha aparecido 'Harrison Ford', pero no 
--en el papel protagonista. [Nota: el campo ord del casting da la posici�n del actor.
--Si ord=1 entonces este actor est� en el papel protag�nico]
SELECT title FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE name = 'Harrison Ford'  AND ord > 1

10
--Enumere las pel�culas junto con la estrella principal de todas las pel�culas de 1962.
SELECT title, name FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE yr = 1962 and ord = 1
12
--Enumera el t�tulo de la pel�cula y el actor principal de todas 
--las pel�culas en las que actu� 'Julie Andrews'.
SELECT title, name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1
	AND movie.id IN
	(SELECT movie.id FROM movie
	   JOIN casting ON movie.id = movieid
	   JOIN actor ON actor.id = actorid
           WHERE actor.name = 'Julie Andrews')

13
--Obt�n una lista, en orden alfab�tico, de los actores que han tenido 
--al menos 15 papeles protag�nicos.
SELECT DISTINCT name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
  WHERE actorid IN (
	SELECT actorid FROM casting
	  WHERE ord = 1
	  GROUP BY actorid
	  HAVING COUNT(actorid) >= 15)
ORDER BY name

14
--Enumere las pel�culas estrenadas en el a�o 1978 ordenadas por el n�mero de actores en el elenco, luego por t�tulo.
SELECT title, COUNT(actorid) AS num_actors
FROM casting
JOIN movie ON movieid = movie.id
WHERE yr = 1978
GROUP BY movieid, title
ORDER BY COUNT(actorid) DESC, title;

15
--Haz una lista de todas las personas que han trabajado con 'Art Garfunkel'.
SELECT DISTINCT name FROM casting
  JOIN actor ON actorid = actor.id
  WHERE name != 'Art Garfunkel'
	AND movieid IN (
		SELECT movieid
		FROM movie
		JOIN casting ON movieid = movie.id
		JOIN actor ON actorid = actor.id
		WHERE actor.name = 'Art Garfunkel'
)

 --------------***Using_Null**********

 1
 --Enumere los profesores que tienen NULL para su departamento.
SELECT name FROM teacher
  WHERE dept IS NULL

2
--N�tese que el INNER JOIN pasa por alto a los profesores 
--sin departamento y a los departamentos sin profesor.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3
--Utilice un JOIN diferente para que se enumeren todos los profesores.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

4
--Utilice un JOIN diferente para que se enumeren todos los departamentos.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

5
--Utilice COALESCE para imprimir el n�mero de m�vil. Utilice el n�mero '07986 444 2266'
--si no se proporciona ning�n n�mero. Muestre el nombre del profesor y el n�mero de tel�fono m�vil o 
--'07986 444 2266'
SELECT teacher.name, COALESCE(teacher.mobile,'07986 444 2266') 
 FROM teacher
6
--Utilice la funci�n COALESCE y LEFT JOIN para imprimir el nombre del profesor 
--y el nombre del departamento. Utilice la cadena 'Ninguno' donde no haya ning�n departamento.
SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
  LEFT JOIN dept ON teacher.dept = dept.id

7
--Utilice COUNT para mostrar el n�mero de profesores y el n�mero de tel�fonos m�viles.
SELECT COUNT(name), COUNT(mobile) 
FROM teacher
8
--Utilice COUNT y GROUP BY dept.name para mostrar cada departamento y el n�mero de empleados. 
--Utilice RIGHT JOIN para asegurarse de que el departamento de ingenier�a aparece en la lista.
SELECT dept.name, COUNT(teacher.dept) FROM teacher
  RIGHT JOIN dept ON dept.id = teacher.dept
  GROUP BY dept.name
9
--Use CASE para mostrar el nombre de cada profesor seguido de 'Sci' si el
--profesor est� en el departamento 1 o 2 y 'Art' en caso contrario.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
      ELSE 'Art' END
 FROM teacher
10
--Use CASE para mostrar el nombre de cada profesor seguido de 'Sci' si el 
--profesor est� en el departamento 1 o 2, muestre 'Arte' si el departamento del profesor es 3 y 
--'Ninguno' en caso contrario.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
   WHEN dept = 3 THEN 'Art'
  ELSE 'None' END
 FROM teacher






