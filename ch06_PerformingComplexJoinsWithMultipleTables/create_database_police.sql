create database police;

use police;

create table location
	(
	location_id		int,
	location_name	varchar(100),
	primary key (location_id)
	);
	
insert into location (location_id, location_name) values (1, 'Corner of Main and Elm');
insert into location (location_id, location_name) values (2, 'Family Donut Shop');
insert into location (location_id, location_name) values (3, 'House of Vegan Restaurant');

create table suspect
	(
	suspect_id		int,
	suspect_name	varchar(100),
	primary key(suspect_id)
);

insert into suspect (suspect_id, suspect_name) values (1, 'Eileen Sideways');
insert into suspect (suspect_id, suspect_name) values (2, 'Hugo Hefty');

create table crime
	(
	crime_id	int,
	location_id	int,
	suspect_id	int,
	crime_name	varchar(200),
	primary key(crime_id),
	foreign key (location_id) references location(location_id),
	foreign key (suspect_id) references suspect(suspect_id)
	);
	
insert into crime (crime_id, location_id, suspect_id, crime_name) values (1, 1, 1, 'Jaywalking');
insert into crime (crime_id, location_id, suspect_id, crime_name) values (2, 2, 2, 'Larceny: Donut');
insert into crime (crime_id, location_id, suspect_id, crime_name) values (3, 3, null, 'Receiving Salad Under False Pretenses');