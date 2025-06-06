--************Solucion de beecrowd Talent**********

				-->>NIVEL 1

--Customer Address
SELECT 
	name,
	street
FROM customers
WHERE LOWER(city) = 'porto alegre';
---Providers' City in Alphabetical Order
SELECT DISTINCT(city) FROM providers ORDER BY city ASC;
---Higher and Lower Price
SELECT
	MAX(price),
	MIN(price)
FROM products;
---Expanding the Business
SELECT DISTINCT city
FROM customers;

---Provider Ajax SA
SELECT
    products.name,
    providers.name
FROM products
INNER JOIN providers
    ON products.id_providers = providers.id
WHERE providers.name = 'Ajax SA';

---Legal Person
SELECT customers.name
FROM legal_person
INNER JOIN customers
    ON legal_person.id_customers = customers.id;

---Passwords
SELECT id, password,MD5(password) 
FROM account;

---Viruses
SELECT REPLACE(name, 'H1', 'X')
FROM virus;

				-->>NIVEL 2

---Under 10 or Greater Than 100
SELECT id,name
FROM products
WHERE (price < 10) OR (price > 100);

---Cheap Movies
SELECT
    movies.id,
    movies.name
FROM movies
INNER JOIN prices
    ON movies.id_prices = prices.id
WHERE prices.value < 2;

---Super Luxury
SELECT products.name,categories.name
FROM products
INNER JOIN categories
    ON products.id_categories = categories.id
WHERE products.amount > 100
    AND categories.id IN (1, 2, 3, 6, 9)
ORDER BY categories.id ASC;

---How much earn a Doctor?
WITH c_hour_earns AS (VALUES(150))
SELECT
	doctors.name,
	ROUND(SUM((attendances.hours * (table c_hour_earns)) 
			  + (attendances.hours * (table c_hour_earns) * (work_shifts.bonus/100)))
		 , 1) AS salary
FROM doctors 
INNER JOIN attendances
	ON doctors.id = attendances.id_doctor
INNER JOIN work_shifts
	ON work_shifts.id = attendances.id_work_shift
GROUP BY doctors.name
ORDER BY salary DESC;

---Sillas Adyacentes
SELECT
    c1.queue AS "queue",
    c1.id AS "left",
    c2.id AS "right"
FROM
    chairs c1
    JOIN chairs c2 ON c1.queue = c2.queue AND c1.id + 1 = c2.id
WHERE
    c1.available = TRUE
    AND c2.available = TRUE
ORDER BY
    c1.queue, c1.id;

---Clasificación de un Árbol
  SELECT
    distinct node_id,
    CASE
      WHEN node_id = 50 THEN 'ROOT'
      WHEN pointer IS NULL AND node_id IS NOT NULL THEN 'LEAF'
      WHEN pointer IS NOT NULL AND node_id IS NOT NULL THEN 'INNER'
    END AS type
  FROM nodes
)

SELECT
  node_id,
  type
FROM NodeTypes
ORDER BY
node_id;

---Seguidores
SELECT
  LEAST(u1.user_name, u2.user_name) AS u1_name,
  GREATEST(u1.user_name, u2.user_name) AS u2_name
FROM
  followers f
  JOIN users u1 ON f.user_id_fk = u1.user_id
  JOIN users u2 ON f.following_user_id_fk = u2.user_id
WHERE
  (u1.user_id, u2.user_id) IN (
    SELECT
      user_id_fk AS user_id1,
      following_user_id_fk AS user_id2
    FROM
      followers
    
    UNION ALL
    
    SELECT
      following_user_id_fk AS user_id1,
      user_id_fk AS user_id2
    FROM
      followers
  )
  AND u1.posts < u2.posts
ORDER BY
u1.user_id;

---Segundo Mayor y Menor
(SELECT city_name, population
FROM cities
ORDER BY population desc
LIMIT 1 OFFSET 1)
UNION
(SELECT city_name, population
FROM cities
ORDER BY population asc
LIMIT 1 OFFSET 1)
order by city_name desc

				-->>NIVEL 3

---Categories
SELECT
    p.id,
    p.name
FROM
    products AS p
    INNER JOIN categories AS c
    ON p.id_categories = c.id
WHERE LOWER(c.name) LIKE 'super%';

---Average Value of Products
SELECT ROUND(AVG(price), 2)
FROM products;

---Imported Products
SELECT
    products.name,
    providers.name,
    categories.name
FROM products
INNER JOIN providers
    ON products.id_providers = providers.id
INNER JOIN categories
    ON products.id_categories = categories.id
WHERE providers.name = 'Sansul SA'
    AND categories.name = 'Imported';

---Orders in First Half
SELECT
    customers.name,
    orders.id
FROM orders
INNER JOIN customers
    ON orders.id_customers = customers.id
WHERE EXTRACT(MONTH FROM orders.orders_date) BETWEEN 1 AND 6 
	AND EXTRACT(YEAR FROM orders.orders_date) = 2016;

---Amounts Between 10 and 20
SELECT products.name
FROM products
INNER JOIN providers
    ON products.id_providers = providers.id
WHERE products.amount BETWEEN 10 AND 20
    AND providers.name LIKE 'P%';

---Number of Cities per Customers
SELECT COUNT(DISTINCT city)
FROM customers;

---Number of Characters
SELECT name, char_length(name) AS length
FROM people
ORDER BY length DESC;

---Taxes
SELECT
    name,
    ROUND((salary * 0.1), 2) as tax
FROM people
WHERE salary > 3000;

---Most Frequent
SELECT amount as most_frequent_value
FROM value_table
GROUP BY amount -- or most_frequent_value
ORDER BY COUNT(*) DESC
LIMIT 1;

--***************NIVEL 4**************

---Basic Select
SELECT name FROM customers WHERE LOWER(state) = 'rs' ;

---Executive Representatives
SELECT 
	products.name,
	providers.name
FROM
	products 
	INNER JOIN providers 
	ON products.id_providers = providers.id
	INNER JOIN categories
	ON products.id_categories = categories.id
WHERE categories.id = 6;

---Action Movies
SELECT
    movies.id,
    movies.name
FROM movies
INNER JOIN genres
    ON movies.id_genres = genres.id
WHERE genres.description = 'Action';

---Categories with Various Products
SELECT
    products.name,
    categories.name
FROM products
INNER JOIN categories
    ON products.id_categories = categories.id
WHERE products.amount > 100
    AND categories.id IN (1, 2, 3, 6, 9)
ORDER BY categories.id ASC;

---CPF Validation
SELECT SUBSTR(natural_person.cpf, 1, 3) || '.' ||
	   SUBSTR(natural_person.cpf, 4, 3) || '.' ||
	   SUBSTR(natural_person.cpf, 7, 3) || '-' ||
	   SUBSTR(natural_person.cpf, 10, 2) AS cpf
FROM natural_person
INNER JOIN customers
    ON natural_person.id_customers = customers.id;

---Contest
SELECT
    candidate.name,
    ROUND((((score.math * 2)
      	    + (score.specific * 3)
      		+ (score.project_plan * 5))
     	   / 10)
		  , 2) AS avg
FROM score
INNER JOIN candidate
    ON score.candidate_id = candidate.id
ORDER BY avg DESC;

---Cearense Championship
SELECT
    teams.name,
    COUNT(matches.team_1 + matches.team_2) AS matches,
    SUM(CASE WHEN (matches.team_1_goals > matches.team_2_goals
                   AND teams.id = matches.team_1)
                  OR (matches.team_2_goals > matches.team_1_goals
                   AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS victories,
                   
    SUM(CASE WHEN (matches.team_1_goals < matches.team_2_goals
                   AND teams.id = matches.team_1)
                  OR (matches.team_2_goals < matches.team_1_goals
                   AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS defeats,
                   
    SUM(CASE WHEN (matches.team_1_goals = matches.team_2_goals
                   AND teams.id = matches.team_1)
                  OR (matches.team_2_goals = matches.team_1_goals
                   AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS draws,
    
	(SUM(CASE WHEN (matches.team_1_goals > matches.team_2_goals
                    AND teams.id = matches.team_1)
                   OR (matches.team_2_goals > matches.team_1_goals
                    AND teams.id = matches.team_2) THEN 3 ELSE 0 END)
	 +
	 SUM(CASE WHEN (matches.team_1_goals = matches.team_2_goals
                    AND teams.id = matches.team_1)
                   OR (matches.team_2_goals = matches.team_1_goals
                    AND teams.id = matches.team_2) THEN 1 ELSE 0 END)) AS score
FROM matches
INNER JOIN teams
    ON matches.team_1 = teams.id
    OR matches.team_2 = teams.id
GROUP BY teams.name
ORDER BY score DESC;

---Employees CPF
SELECT
    empregados.cpf,
    empregados.enome,
    departamentos.dnome
FROM empregados
INNER JOIN departamentos
    ON empregados.dnumero = departamentos.dnumero
LEFT JOIN trabalha
    ON empregados.cpf = trabalha.cpf_emp
WHERE trabalha.cpf_emp IS NULL
ORDER BY empregados.cpf;






