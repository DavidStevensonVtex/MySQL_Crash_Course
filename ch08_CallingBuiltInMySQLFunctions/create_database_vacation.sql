create database vacation;

use vacation;

create table theme_park
	(
	country varchar(50),
	state	varchar(50),
	city	varchar(100),
	park  	varchar(100)
	);
	
insert into theme_park
values
	('USA',		'Florida',			'Orlando',				'Disney World'),
	('USA',		'Florida',			'Orlando',				'Universal Studios'),
	('USA',		'Florida',			'Orlando',				'SeaWorld'),
	('USA',		'Florida',			'Tampa',				'Busch Gardens'),
	('Brazil',	'Santa Catarina',	'Balneario Camboriu',	'Unipraias Park'),
	('Brazil',	'Santa Catarina',	'Florianopolis',		'Show Water Park');