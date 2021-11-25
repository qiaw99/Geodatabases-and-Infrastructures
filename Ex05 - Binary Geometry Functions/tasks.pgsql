-- 1. Calculate the area of each polygon
select ST_Area(geom)
from objects

-- 2. Sum the areas of two objects at a time. Take any possible combination into account
select sum(ST_Area(geom))
from objects
where name = 'Object 1' or name = 'Object 2'

select sum(ST_Area(geom))
from objects
where name = 'Object 1' or name = 'Object 3'

select sum(ST_Area(geom))
from objects
where name = 'Object 3' or name = 'Object 2'

-- 3. Check for every object if it is intersecting another object
select st_intersects(tb1.geom, tb2.geom)
from (select * from objects where name='Object 1') as tb1,
(select * from objects where name='Object 2') as tb2

-- 4. Insert another polygon ('Object4') into your table which looks like two lines are crossing and which does not intersect any of the other
-- objects. 
insert into objects (name, geom) values ('Object 4', 'POLYGON((1.5 7.5, 3.5 7.5, 3.5 7, 4.5 7, 4.5 7.5, 6.5 7.5, 6.5 8.5, 4.5 8.5, 4.5 9, 3.5 9, 3.5 8.5, 1.5 8.5, 1.5 7.5))')

-- 5. Calculate the distance of 'Object4’ to all other objects. 
select ex.name, inc.name, st_distance(inc.geom, ex.geom) as distance
from (select * from objects where name <> 'Object 4') as ex, (select * from objects where name = 'Object 4') as inc

-- 6. Calculate the distance of the centroid of 'Object4’ to all other object’s centroids. Hint: search for a unary geometry function to determine
-- the centroid. 
select ex.name, inc.name, ST_Distance(st_centroid(inc.geom), st_centroid(ex.geom)) as centroid_distance
from (select * from objects where name <> 'Object 4') as ex, (select * from objects where name = 'Object 4') as inc

-- 7. Calculate the sum of the area of the objects 1 to 3. 
select sum(st_area(geom))
from objects
where name <> 'Object 4'

-- 8. Merge objects 1 to 3 into one geometric object and calculate the total area. 
select st_collect(geom), st_area(st_collect(geom))
from objects
where name <> 'Object 4'

-- 9. Add a point object called ‘Point1’ at position x=5 , y=2.5 to table objects.
insert into objects (name, geom) values ('Point 1

-- 10. Create a buffer around ‘Point1’ with a radius of 0.9 and determine the
-- remaining geometries after cutting out the buffer from all other objects.
select st_buffer(geom, 0.9)
from objects
where name = 'Point 1'', 'POINT(5 2.5)')