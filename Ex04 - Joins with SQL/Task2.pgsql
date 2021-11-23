-- Task 1:
-- Create a query which shows all hobbies of each student (first name).
-- As one student can have more than just one hobby, it is possible that students are listed multiple times.
select firstname, hobby
from studenthobby as sh, students as s, hobbies as h
where s.id = sh.studentid and h.id = sh.hobbyid 

-- Task 2:
-- Create a query which displays the students first name, their country of birth and the capital city of this country
select firstname, countryofbirth, capitalcity
from students as s, countries as c
where countryofbirth = c.country

-- Task 3:
-- Who is the youngest and who the oldest student?
select firstname, lastname, AGE(birthdate) as age
from students
order by age asc
-- order by age desc
limit 1

-- Task 4:
-- How many students were born in the year 1996?
select count(EXTRACT(YEAR FROM birthdate)) 
from students
where EXTRACT(YEAR FROM birthdate) = 1996

-- Task 5:
-- List all students that were born between August and December
select *
from students
where EXTRACT(month FROM birthdate) >= 8 and EXTRACT(month FROM birthdate)<= 12


-- Task 6:
-- Select all students (firstname and lastname), who were born
-- in a capital city?
select firstname, lastname, placeofbirth, capitalcity
from students as s, countries as c
where placeofbirth = c.capitalcity

-- Task 7:
-- Select the first name and the hobby of all students, who like ‘surfing’ or ‘hiking’.
select firstname, hobby
from studenthobby as sh, students as s, hobbies as h
where s.id = sh.studentid and h.id = sh.hobbyid and (h.hobby = 'Surfing' or h.hobby = 'Hiking')