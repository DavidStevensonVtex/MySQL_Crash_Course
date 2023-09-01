-- Switching back to the callfunc database
use callfunc;

create table phone_book
	(
	first_name	varchar(100),
	last_name	varchar(100)
	);
	
insert into phone_book
	(
	first_name,
	last_name
	)
values
	('Jennifer','Perez'),
	('Richard','Johnson'),
	('John','Moore');