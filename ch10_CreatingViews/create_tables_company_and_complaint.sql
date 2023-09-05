create table company
	(
    company_id			int,
    company_name 		varchar(200),
    owner				varchar(100),
    owner_phone_number	varchar(20)
    );

create table complaint
	(
       complaint_id		int,
       company_id		int,
       complaint_desc	varchar(200)
    );

insert into company values (1, 'Cattywampus Cellular', 'Sam Shady', '784-785-1245');
insert into company values (2, 'Wooden Nickel Bank', 'Oscar Opossum', '719-997-4545');
insert into company values (3, 'Pitiful Pawn Shop', 'Frank Fishy', '917-185-7911');

insert into complaint  values (1, 1, "Phone doesn't work");
insert into complaint  values (2, 1, 'Wiki is on the blink');
insert into complaint  values (3, 1, 'Customer Service is bad');
insert into complaint  values (4, 2, 'Bank closes too early');
insert into complaint  values (5, 3, 'My iguana died');
insert into complaint  values (6, 3, 'Police confiscated my purchase');