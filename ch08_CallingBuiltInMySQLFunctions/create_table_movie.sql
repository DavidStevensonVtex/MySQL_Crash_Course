create table movie (
	movie_name		varchar(100),
	star_rating 	float,
	release_date	date
);

insert into movie
	(
	movie_name,
	star_rating,
	release_date
	)
values
	('Exciting Thriller', 	4.72,	'2024-09-27'),
	('Bad Comedy', 			1.2,	'2025-01-02'),
	('OK Horror', 			3.1789,	'2024-10-01');