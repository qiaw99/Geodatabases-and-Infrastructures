CREATE TABLE students(
	id integer,
	gender varchar (2),
	lastname varchar (20),
	firstname varchar (20),
	birthdate date,
	placeofbirth varchar (20),
	countryofbirth varchar (20)
)

COPY students(id, gender, lastname, firstname, birthdate, placeofbirth, countrybirth)
FROM 'E:\Geodatabases-and-Infrastructures\Ex01-Fundamental\tblStudents.csv'
DELIMITER ','
CSV HEADER;

select * from students

CREATE TABLE countries(
	id integer,
	country varchar (20),
	capitalcity varchar (20)
)

CREATE TABLE hobbies(
	id integer,
	hobby varchar (20)
)

CREATE TABLE studenthobby(
	studentid integer,
	hobbyid integer
)

CREATE TABLE cities(
	id integer,
	city varchar (20),
	country integer
)

CREATE TABLE zodiac(
	id integer,
	zodiac varchar (15),
	startdate date,
	enddate date
)

CREATE TABLE wimbledon(
	year integer,
	gender varchar (2),
	firstname varchar (20),
	lastname varchar (20),
	country integer
)