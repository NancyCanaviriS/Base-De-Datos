
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

11.
--Query the list of CITY names from STATION that either do not start with vowels or 
--do not end with vowels. Your result cannot contain duplicates.
select distinct city
from station
where not  (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' 
      or city like 'U%') or 
      not  (city like '%A' or city like '%E' or city like '%I' or city like '%O' 
      or city like '%U');

12.
--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
--Your result cannot contain duplicates.
select distinct city
from station
where not  (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' 
      or city like 'U%') AND 
      not  (city like '%A' or city like '%E' or city like '%I' or city like '%O' 
      or city like '%U');

13.
--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than .
--Truncate your answer to  decimal places.
select round(sum(LAT_N),4) 
from station
where LAT_N > 38.7880 and LAT_N<137.2345;

14.
--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . 
--Truncate your answer to  decimal places.
select round(max(LAT_N),4) 
from station
where  LAT_N<137.2345;

15.
--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in 
--STATION that is less than 137,2345 . Round your answer to  decimal places.
select round(long_w,4)
from station
where  lat_n=(select max(lat_n) 
              from station 
              where lat_n<137.2345);

16.
--Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38,7780 .
--Round your answer to  decimal places.
select round(min(lat_n),4)
from station
where lat_n>38.7780;

17.
--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) 
--in STATION is greater than 38,7780 . Round 4 your answer to  decimal places.
select round(long_w,4)
from station
where lat_n=(select min(lat_n) 
            from station 
            where lat_n>38.7780);

18.
--Consider  and  to be two points on a 2D plane.
--happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 --happens to equal the minimum value in Western Longitude (LONG_W in STATION).
select round(abs(max(lat_n)-min(lat_n))+abs(max(long_w)-min(long_w)),4)
from station

19.
--Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of 
--Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
select round (sqrt(power(max(lat_n)-min(lat_n),2)+
                   power(max(long_w)-min(long_w),2)),4)
from station

20.
--A median is defined as a number separating the higher half of a data set from the lower half. 
--Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
select round(S.lat_n,4)
from station S
where (select count(lat_n)
      from station
      where lat_n < S.lat_n)=(select count(lat_n)
                            from station
                            lat_n > S.lat_n);

---Population Census
---Given the CITY and COUNTRY tables, query the sum of the populations of all 
---cities where the CONTINENT is 'Asia'.
select 
sum(CITY.population)
from COUNTRY
JOIN CITY ON CITY.CountryCode=COUNTRY.Code
where COUNTRY.continent='Asia'

---African Cities
---Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
select city.name
from city
join COUNTRY ON CITY.CountryCode=COUNTRY.Code
where COUNTRY.CONTINENT = 'Africa';

---Average Population of Each Continent
---Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
--and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT 
    COUNTRY.CONTINENT,
    FLOOR(AVG(CITY.POPULATION)) 
FROM 
    CITY
JOIN 
    COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY 
    COUNTRY.CONTINENT;




