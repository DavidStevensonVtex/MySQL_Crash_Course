-- create a database called compval for several of the examples showing value comparisons
create database compval;

use compval;

create table musical_instrument
	(
	instrument	varchar(100)
	);

insert into musical_instrument (instrument)
values 	
	('guitar'), 
	('banjo'), 
	('piano');

-- Using "not equal" (!=)
select  *
from    musical_instrument
where   instrument != 'banjo';

create table possible_wedding_date
	(
	wedding_date	date
	);
	
insert into possible_wedding_date
values
('2024-02-11'),
('2024-03-17'),
('2024-02-14');