create database pay;

use pay;

create table employee
	(
	employee_name	varchar(100),
	department		varchar(100),
	salary			numeric(10,2)
);

insert into employee (employee_name, department, salary) values ('Wanda Wealthy', 'Sales', 200000);
insert into employee (employee_name, department, salary) values ('Paul Poor', 'Sales', 12000);
insert into employee (employee_name, department, salary) values ('Mike Mediocre', 'Sales', 70000);
insert into employee (employee_name, department, salary) values ('Betty Builder', 'Manufacturing', 80000);
insert into employee (employee_name, department, salary) values ('Sean Soldering', 'Manufacturing', 80000);
insert into employee (employee_name, department, salary) values ('Ann Assembly', 'Manufacturing', 65000);

create table best_paid
	(
	department	varchar(100),
	salary		numeric(10,2)
);

insert into best_paid (department, salary) values ('Sales', 200000);
insert into best_paid (department, salary) values ('Manufacturing', 80000);

-- Correlated subquery
select	employee_name,
		salary
from	employee e
where	salary =
		(
		select  b.salary
		from    best_paid b
		where   b.department = e.department
		);