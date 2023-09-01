-- Switching back to the callfunc database
use callfunc;

create table taxpayer
	(
	last_name	varchar(100),
	soc_sec_no	varchar(20)
	);
	
insert into taxpayer
	(
	last_name,
	soc_sec_no
	)
values
	('Jagger', 		'478-555-7598'),
	('McCartney', 	'478-555-1974'),
	('Hendrix',		'478-555-3555');