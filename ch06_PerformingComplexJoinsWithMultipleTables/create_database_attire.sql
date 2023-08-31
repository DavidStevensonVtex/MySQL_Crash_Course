-- Creating databases for Exercise 6-5 below
create database attire;

use attire;

create table employee
	(
	employee_id		int,
	employee_name	varchar(100),
	position_name	varchar(100)
	);
	
insert into employee(employee_id, employee_name, position_name) values (1, 'Benedict', 'Pope');
insert into employee(employee_id, employee_name, position_name) values (2, 'Garth', 'Singer');
insert into employee(employee_id, employee_name, position_name) values (3, 'Francis', 'Pope');

create table wardrobe
	(
	employee_id	int,
	hat_size	numeric(4,2)
	);

insert into wardrobe (employee_id, hat_size) values (1, 8.25);
insert into wardrobe (employee_id, hat_size) values (2, 7.50);
insert into wardrobe (employee_id, hat_size) values (3, 6.75);