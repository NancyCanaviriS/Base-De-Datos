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
SELECT
    id,
    password,
    MD5(password) as MD5
FROM account;
---Viruses
SELECT REPLACE(name, 'H1', 'X')
FROM virus;

