/* Geo Database Lab - LITTLE FARM */

/*First, you need to make sure, that there are no tables with the same name*/
-----------------------------------------------------------------------------
Drop Table if exists area;
Drop Table if exists animals;
Drop Table if exists additional;

/*Now we can start creating the tables*/
----------------------------------------
CREATE TABLE area(
id_poly serial PRIMARY KEY,
name character(20),
geom geometry
);

CREATE TABLE animals(
id_point serial PRIMARY KEY,
name character(20),
geom geometry
);

CREATE TABLE additional(
id_line serial PRIMARY KEY,
name character(20),
geom geometry
);


/*Insert some data into the tables*/
------------------------------------
INSERT INTO area (name, geom) values ('enclosure', 'POLYGON((3 3, 30 1, 32 28, 5 32, 3 3), 
										 (6 24, 7 25, 7 27, 8 28, 9 29, 10 29, 11 29, 12 28, 13 28, 13 27, 14 26, 14 25, 13 24,12 23, 11 22, 10 21, 8 22, 7 23 ,6 24))'),
('pond', 'POLYGON((6 24, 7 23, 8 22,10 21,11 22,12 23,13 24,14 25, 14 26, 13 27,13 28,12 28,11 29,10 29,9 29,8 28,7 27,7 25,6 24),
 (9 23, 9 26, 12 26, 11 24, 9 23))'),
 ('building', 'POLYGON((22 3, 28 3, 28 11, 22 11, 22 3))'), ('island','POLYGON((9 23, 11 24, 12 26, 9 26, 9 23))');


INSERT INTO animals (name, geom) values ('dog1' , 'POINT (10 8)'), ('dog2' ,'POINT (15 4)'), ('horse1' , 'POINT (16 12)'),
('horse2' , 'POINT (18 22)'), ('horse3', 'POINT (23 27)'), ('horse4' , 'POINT (24 9)'), ('cow1','POINT (9 16)'),('cow2', 'POINT (25 5)'),
('cow3', 'POINT (26 7)'), ('donkey1','POINT (10 25)'), ('donkey2', 'POINT (29 24)'), ('donkey3','POINT (23 19)'), ('fox', 'POINT (27 14)'); 

INSERT INTO additional(name, geom) values ('bridge', 'LINESTRING(11 24, 12 23)');

