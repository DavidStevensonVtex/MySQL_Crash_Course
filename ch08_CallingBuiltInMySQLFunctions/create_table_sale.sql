-- Switching back to the callfunc database
use callfunc;

create table sale
	(
	sale_id				int,
	customer_name		varchar(100),
	salesperson_name	varchar(50),
	amount				numeric(7,2)
	);
	
insert into sale
	(
	sale_id,
	customer_name,
	salesperson_name,
	amount
	)
values
	(1,	'Bill McKenna',	'Sally',	12.34),
	(2,	'Carlos Souza',	'Sally',	28.28),
	(3,	'Bill McKenna',	'Tom',		9.72),
	(4,	'Bill McKenna',	'Sally',	17.54),
	(5,	'Jane Bird',	'Tom',		34.44);