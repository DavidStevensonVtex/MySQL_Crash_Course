create table payroll
	(
	employee	varchar(100),
	salary		decimal(10,2),
	deduction	decimal(10,2),
	bonus		decimal(10,2),
	tax_rate	decimal(5,2)
	);

insert into payroll
	(
	employee,
	salary,
	deduction,
	bonus,
	tax_rate
	)
values
	('Max Bain',	80000,	5000,	10000,	0.24),
	('Lola Joy',	60000,	0,		800,	0.18),
	('Zoe Ball',	110000,	2000,	30000,	0.35);