
--*************************hackerRank**************************
----**Weather Observation Station **--
1. 
--Query a list of CITY and STATE from the STATION table.
--The STATION table is described as follows:
select city,state
from station

2.
--Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of  decimal places.
--The sum of all values in LONG_W rounded to a scale of  decimal places.
select round(sum(LAT_N),2), round(sum(LONG_W),2)
from station

3.
--Query a list of CITY names from STATION for cities that have an even ID number. 
--Print the results in any order, but exclude duplicates from the answer.
--The STATION table is described as follows:
select distinct city 
from station
where mod(id,2)=0;

4.
--Find the difference between the total number of CITY entries in the table and 
--the number of distinct CITY entries in the table.
select count(city) - count(distinct city)  
from station

5.
--Query the two cities in STATION with the shortest and longest CITY names, 
--as well as their respective lengths (i.e.: number of characters in the name). 
select city,length(city) 
from station
order by length (city),city limit 1;
select city,length(city) 
from station
order by length (city) desc ,city limit 1;

6.
--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
--Your result cannot contain duplicates.
select distinct city
from station
where (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' 
      or city like 'U%');

7.
--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
--Your result cannot contain duplicates.
select distinct city 
from station
where (city like '%A' or city like '%E' or city like '%I' or city like '%O' 
      or city like '%U');

8.
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
--as both their first and last characters. Your result cannot contain duplicates.
select distinct city
from station
where (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' 
      or city like 'U%') and
      (city like '%A' or city like '%E' or city like '%I' or city like '%O' 
      or city like '%U');

9.
--Query the list of CITY names from STATION that do not start with vowels. 
--Your result cannot contain duplicates.
select distinct  city 
from station
where not (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' 
      or city like 'U%')

10.
--Query the list of CITY names from STATION that do not end with vowels.
--Your result cannot contain duplicates.
select distinct city 
from station
where not (city like '%A' or city like '%E' or city like '%I' or city like '%O' 
      or city like '%U');
