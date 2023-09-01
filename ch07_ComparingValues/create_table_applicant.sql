create table applicant
	(
	name					varchar(100),
	associates_degree_flag	bool,
	bachelors_degree_flag	bool,
	years_experience		int
	);
	
insert into applicant
	(
	name,
	associates_degree_flag,
	bachelors_degree_flag,
	years_experience
	)
values 
	('Joe Smith', 0, 1, 7),
	('Linda Jones', 1, 0, 2),
	('Bill Wang', 0, 1, 1),
	('Sally Gooden', 1, 0,0),
	('Katy Daly', 0, 0, 0);