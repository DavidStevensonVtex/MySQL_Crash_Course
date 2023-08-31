-- Building the tables for the the cross join example below
create database restaurant;

use restaurant;

create table main_dish
	(
	main_item  varchar(100)
	);
	
create table side_dish
	(
	side_item  varchar(100)
	);

insert into main_dish (main_item)
values
('steak'),
('chicken'),
('ham');

insert into side_dish (side_item)
values
('french fries'),
('rice'),
('potato chips');