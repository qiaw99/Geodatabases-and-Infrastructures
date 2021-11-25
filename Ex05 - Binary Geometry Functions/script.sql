create table objects(
	id serial,
	name character varying(20),
	geom geometry
)

insert into objects (name, geom) values ('Object 1', 'POLYGON((1 1, 4.5 1, 4.5 4, 1 1))')

insert into objects (name, geom) values ('Object 2', 'POLYGON((5.5 1.5, 8.5 1.5, 8.5 3, 7 3, 7 6, 5.5 6, 5.5 6, 5.5 1.5))')

insert into objects (name, geom) values ('Object 3', 'POLYGON((3.5 3, 6.5 4, 3.5 5, 3.5 3))')
