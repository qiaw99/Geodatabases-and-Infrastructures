-- Task 1a
-- Before starting with the tasks, get familiar with your new tables. Check the tables you created and if necessary, make notes about the
-- column names and the data type they assigned to. Create an SQL queries to get the following data output from tables polygon, line, and
-- point. Use the geometry viewer to inspect the geometry of each table.
select * from animals

select * from additional

select * from area

-- Task 1b
-- Create an SQL query to get the name and the type of each geometry from all tables
-- (polygon, line, and point) together in one list. Sort the list first by the type of the
-- geometries, and second by the name of the data records in alphabetical order.
select temp.name, st_collect(temp.geom) from (select name, animals.geom from animals group by name, animals.geom
union 
select name, additional.geom from additional group by name, additional.geom
union select name, area.geom from area group by name, area.geom) as temp
group by temp.name, temp.geom
order by temp.name

-- Task 2
-- Generate a query, that shows how long the bridge is.
select st_length(geom) as length_bridge from additional

-- Task 3
-- How large is the waterbody on the animal farm?
select st_area(geom) from area  where name = 'pond'

-- Task 4
-- Create a query to display the size of the area the animals can use 
-- to walk around (including the building)
select st_area(geom) as area from area where name='enclosure'

-- Task 5
-- Are there animals inside the pond?
select * 
from (select st_within(animals.geom, area.geom) as flag from animals, area 
			   where st_within(animals.geom, area.geom) = false) as temp
group by flag

-- Task 6
-- Generate a query to see, how far the fox is away from the bridge.
select st_distance(fox.geom, bridge.geom) as distance_fox_bridge
from 
(select geom from animals where name = 'fox') as fox,
(select geom from additional) as bridge

-- Task 7
-- Create a query to check, what kind of animals are inside the building.
select (animals.name)
from 
(select * from area where name='building') as building,
(select * from animals) as animals  
where st_within(animals.geom, building.geom) = true

-- Task 8
-- Specify a query to see how many animals are located on the island.
select count(*)
from
(select * from area where name = 'island') as island, 
(select * from animals) as animals
where st_within(animals.geom, island.geom)

-- Task 9
-- Specify a query to see what horses are further away than 7 metre from
-- a person at location (x=12, y=10) and list the horse names and distances
-- (do not store the person’s location in a table, since he may walk around
-- and it is a temporary location).
select horses.name, st_distance(horses.geom, ST_MakePoint(12, 10))
from
(select * from animals where name like 'horse%') as horses
where st_distance(horses.geom, ST_MakePoint(12, 10)) >= 7

-- Task 10
-- Query your tables to check, how far away is dog1 from cow1, horse1, and dog2
select st_distance(dog.geom, cow.geom)
from
(select * from animals where name='dog1') as dog,
(select * from animals where name='cow1') as cow
