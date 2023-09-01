create table team_schedule
	(
	opponent	varchar(100),
	game_date	date,
	game_time	time
	);
	
insert into team_schedule
	(
	opponent,
	game_date,
	game_time
	)
values
	('Destroyers','2024-01-24','22:00'),
	('Stray Cats','2024-02-03','10:00'),
	('Bombers','2024-03-17','23:00');