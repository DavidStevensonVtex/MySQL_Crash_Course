create database mysqlview;

use mysqlview;

create table course
	(
	course_name		varchar(100),
	course_level	varchar(50)
	);
	
insert into course values ('Introduction to Python', 'beginner');
insert into course values ('Introduction to HTML', 'beginner');
insert into course values ('React Full-Stack Web Development', 'advanced');
insert into course values ('Object-Oriented Design Patterns in Java', 'advanced');
insert into course values ('Practical Linux Administration', 'advanced');
insert into course values ('Learn JavaScript', 'beginner');
insert into course values ('Advanced Hardware Security', 'advanced');