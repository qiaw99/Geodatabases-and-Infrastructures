-- Task 1:
-- Create a query that calculates the total area of Berlin based on the districts of 
-- Berlin stored in the table berlin_districts. Give the result in square kilometer 
-- (coordinates of the districts are stored in meter) and compare it with the information 
-- provided in the internet, e.g. at https://en.wikipedia.org/wiki/Berlin.
select sum(ST_Area(geom)) / 1000000 as area
from berlin_districts

-- Task 2:
-- Create a query that list the area of each district given in square kilometer. 
-- Arrange the list from smallest to largest district.
-- Question: Which district is the smallest one?
select name, sum(ST_Area(geom)) / 1000000 as area
from berlin_districts
group by name
order by area asc

-- Task 3a:
-- Create a query that returns only the longest district name and its number of characters.
select name, length(name) as num_of_characters
from berlin_districts
order by length(name) desc
limit 1

-- Task 3b:
-- In order to draw the district name within each district’s polygon calculate the maximum width of each district in east-west
-- direction in a map of scale 1:100000 and compare it with the length of the district names using a font size of 5mm character
-- width. All results should be given in millimeter. Adapt the query so that only whose district names are listed that will fit within
-- each district in the map.
select * 
from(
	select name, length(name) * 5 as length_of_characters, (ST_XMax(ST_Envelope(geom)) - ST_XMin(ST_Envelope(geom))) / 100 as maximum_length, geom
	from berlin_districts
) as temp_table
where maximum_length >= length_of_characters

-- Task 4:
-- Use SQL to create a multiple geometry out of the districts located in the 
-- east and west part of Berlin, respectively (based on the table berlin_districts) 
-- and count the number of districts for each part
select ST_Collect(
	ARRAY(select geom from berlin_districts)), 
	part,
	ST_NumGeometries(ST_Collect(geom)
)
from berlin_districts
group by part

-- Task 5:
-- Create a query that calculates the length of the former Berlin wall between 
-- the east and west part of Berlin based on the information stored in the table
-- berlin_districts. Give the result in kilometers.
select sum(ST_Length(board))/10000
from(
	select ST_Intersection(
		ST_Union(ARRAY(select geom from berlin_districts where part='west')),
		ST_Union(ARRAY(select geom from berlin_districts where part='east'))
	) as board
	from berlin_districts
) as temp_table

-- Task 6:
-- Create a query that lists the name and calculates the length of the train line based on
-- the information stored in the table tub_campus_trains.
SELECT nam, ST_Length(geom)
FROM tub_campus_trains
ORDER BY gid ASC 

-- Task 7:
-- Create a query that lists each name of a street only once and calculates its total 
-- length based on the information stored in the table tub_campus_streetlines. 
-- Sort the output alphabetically.
select distinct bezwdm, sum(ST_Length(geom))
from tub_campus_streetlines
group by bezwdm
order by bezwdm

-- Task 8:
-- Create a query that lists the parcelnumber in the format ‘fln:zae/nen’ (or ‘fln:zae’ if nen is empty), the official area of the
-- cadastre (column afl), and the geometrical area of parcels based on the information stored in the table tub_campus_parcels, but
-- only for those parcels with a difference between both area values greater than 10 square meter. Explain the differences.
select fln || ':' || nen, afl, ST_Area(geom)
from tub_campus_parcels
where nen is not NULL
union
select fln || ':' || zae, afl, ST_Area(geom)
from tub_campus_parcels
where nen is NULL

