-- Task 1:
-- Create a query that shows for each year the female and the male Wimbledon winner’s full name 
-- (first name and last name). Order the result in ascending order of the year
select w1.year,w1.lastname || ' ' || w1.firstname, w1.gender, w2.lastname || ' ' || w2.firstname, w2.gender
from (
		select t1.year, lastname, firstname, gender
		from wimbledon t1
		where gender='f'
		order by year
	) as w1, (
		select t2.year, lastname, firstname, gender
		from wimbledon t2
		where gender='m'
		order by year
	)as w2

-- Task 2:
-- Count the number of female and male Wimbledon winners for each country from the year 2000 to 2010 and sort
-- the result in alphabetical order of the countries. Make sure that each country is listed only once.
select countries.country, tb1.fnum, tb1.mnum from (select * from (select con.country, male.mnum from (select distinct country 
from wimbledon
where year >= 2000 and year <= 2010) as con LEFT OUTER JOIN

-- num, id
(select * from (select count(lastname || firstname)as mnum, country
from wimbledon
where gender='m' and year >= 2000 and year <= 2010
group by country) as m) as male on con.country = male.country) as t1 natural join 

(select * from (select con.country, female.fnum from (select distinct country 
from wimbledon
where year >= 2000 and year <= 2010) as con LEFT OUTER JOIN

-- num, id
(select * from (select count(lastname || firstname)as fnum, country
from wimbledon
where gender='f' and year >= 2000 and year <= 2010
group by country) as f) as female on con.country = female.country)as t2) as t22) as tb1, countries
where countries.id=tb1.country
order by country
