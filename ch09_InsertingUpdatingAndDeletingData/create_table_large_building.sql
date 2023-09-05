create table large_building
	(
	building_type      varchar(50),
	building_name      varchar(100),
	building_location  varchar(100),
	building_capacity  int,
	active_flag        bool
);

insert into large_building values ('Hotel', 'Wanda Inn', 			'Cape Cod', 125,	true);
insert into large_building values ('Arena', 'Yamada Green Dome', 	'Japan', 	20000,	true);
insert into large_building values ('Arena', 'Oracle Arena', 		'Oakland', 	19596,	true);

select  building_name,
        building_location,
        building_capacity
from    large_building
where   building_type = 'Arena'
and     active_flag is true;