-- switch back to the wine database
use wine;

create table cheap_wine
	(
	wine_type_name	varchar(100)
	);
	
insert into cheap_wine
	(wine_type_name)
values
	('Chardonnay');