-- Task 1
SELECT *
FROM students;

-- Task 2
-- Create a query to select the first name and place of birth for all male students. 
-- And rename the place of birth into city in the result. 
select firstname, placeofbirth as city
from students
where gender = 'm'

-- Task 3:
-- Create a query, to view the names of all students coming from France.
select firstname, lastname 
from students
where countryofbirth = 'France'

-- Task 4
-- Create a query, to get all female students from Italy
select * 
from students
where gender = 'f' and countryofbirth = 'Italy'

-- Task 5:
-- Create a query, which shows the names of all female Wimbledon 
-- champions in alphabetical order of first the last name and
-- second the first name. Make sure, that you do not have 
-- redundant information in your result.
select distinct * 
from wimbledon
where gender = 'f'
order by lastname, firstname asc

-- Task 6:
-- Create a query, to get all students with their first and last name 
-- which are coming from France or England.
select firstname, lastname
from students
where countryofbirth = 'England' or countryofbirth = 'France'

-- Task 7:
-- Create a result, showing you all students whose first name begins with A.
select * 
from students
where firstname like 'A%'

-- Task 8:
-- Create a query to display the length of the last and first name of each student.
select *, length(firstname) as lengthoffirstname, length(lastname) as lengthoflastname
from students

-- Task 9:
-- Create a query which shows all zodiacs and the number of days they last for
select zodiac, (enddate-startdate) as days
from zodiac

-- Task 10a:
-- List the first name and last name as well as
-- how many matches each player won in Wimbledon?
select firstname, lastname, count(firstname) as num_of_matches
from wimbledon
group by firstname, lastname

-- Task 10b:
-- Create the same output as above but list only whose players that won
-- more than once.
select * from(
	select firstname, lastname, count(firstname) AS num_of_matches
	from wimbledon
	group by firstname, lastname
)as temp_table 
where num_of_matches > 1

-- Task 11:
-- How many cities from your table students are located in Germany?
select count(placeofbirth) as num_of_cities
from students
where countryofbirth='Germany'

-- Task 12:
-- How many students are born in Spain?
select count(firstname)
from students
where countryofbirth='Spain'