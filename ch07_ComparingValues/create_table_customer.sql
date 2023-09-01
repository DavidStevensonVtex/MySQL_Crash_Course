-- Switch back to the compval database
use compval;

create table customer
	(
	customer_name	varchar(50),
	birthyear		year
	);
	
insert into customer
	(
	customer_name,
	birthyear
	)
values
	('Helen', 1947),
	('Zippy', 1985),
	('Junior', 2021);