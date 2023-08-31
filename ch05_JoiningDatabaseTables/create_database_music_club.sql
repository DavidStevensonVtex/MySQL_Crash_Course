create database music_club;

use music_club;

create table music_preference
	(
	music_fan		varchar(100),
	favorite_genre	varchar(100)
	);
	
insert into music_preference (music_fan, favorite_genre)
values
('Bob',		'Reggae'),
('Earl',	'Bluegrass'),
('Ella',	'Jazz'),
('Peter',	'Reggae'),
('Benny',	'Jazz'),
('Bunny',	'Reggae'),
('Sierra',	'Bluegrass'),
('Billie',	'Jazz');