create database population;

use population;

create table state_population
	(
    state       varchar(100),
    population  int
    );

insert into state_population values ('New York',		19299981);
insert into state_population values ('Texas',			29730311);
insert into state_population values ('California',		39613493);
insert into state_population values ('Florida', 		21944577);
insert into state_population values ('New Jersey',		 9267130);
insert into state_population values ('Massachusetts',	 6893000);
insert into state_population values ('Rhode Island', 	 1097379);

drop table if exists county_population;

create table county_population (state char(50), county varchar(100), population int);

insert into county_population values ('New York',	'Kings',		2736074);
insert into county_population values ('New York',	'Queens',		2405464);
insert into county_population values ('New York',	'New York',		1694251);
insert into county_population values ('New York',	'Suffolk',		1525920);
insert into county_population values ('New York',	'Bronx',		1472654);
insert into county_population values ('New York',	'Nassau',		1395774);
insert into county_population values ('New York',	'Westchester',	1004457);
insert into county_population values ('New York',	'Erie',			954236);
insert into county_population values ('New York',	'Monroe',		759443);
insert into county_population values ('New York',	'Richmond',		495747);
insert into county_population values ('New York',	'Onondaga',		476516);
insert into county_population values ('New York',	'Orange',		401310);
insert into county_population values ('New York',	'Rockland',		338329);
insert into county_population values ('New York',	'AlbaNew York', 314848);
insert into county_population values ('New York',	'Dutchess',		295911);
insert into county_population values ('New York',	'Saratoga',		235509);
insert into county_population values ('New York',	'Oneida',		232125);
insert into county_population values ('New York',	'Niagara',		212666);
insert into county_population values ('New York',	'Broome',		198683);
insert into county_population values ('New York',	'Ulster',		181851);
insert into county_population values ('New York',	'Rensselaer',	161130);
insert into county_population values ('New York',	'Schenectady',	158061);
insert into county_population values ('New York',	'Chautauqua',	127657);
insert into county_population values ('New York',	'Oswego',		117525);
insert into county_population values ('New York',	'Jefferson',	116721);
insert into county_population values ('New York',	'Ontario',		112458);
insert into county_population values ('New York',	'St. Lawrence',	108505);
insert into county_population values ('New York',	'Tompkins',		105740);
insert into county_population values ('New York',	'Putnam',		97668);
insert into county_population values ('New York',	'Steuben',		93584);
insert into county_population values ('New York',	'Wayne',		91283);
insert into county_population values ('New York',	'Chemung',		84148);
insert into county_population values ('New York',	'Clinton',		79843);
insert into county_population values ('New York',	'Sullivan',		78624);
insert into county_population values ('New York',	'Cattaraugus',	77042);
insert into county_population values ('New York',	'Cayuga',		76248);
insert into county_population values ('New York',	'Madison',		68016);
insert into county_population values ('New York',	'Warren',		65737);
insert into county_population values ('New York',	'Livingston',	61834);
insert into county_population values ('New York',	'Columbia',		61570);
insert into county_population values ('New York',	'Washington',	61302);
insert into county_population values ('New York',	'Herkimer',		60139);
insert into county_population values ('New York',	'Otsego',		58524);
insert into county_population values ('New York',	'Genesee',		58388);
insert into county_population values ('New York',	'Fulton',		53324);
insert into county_population values ('New York',	'Montgomery',	49532);
insert into county_population values ('New York',	'Tioga',		48455);
insert into county_population values ('New York',	'Greene',		47931);
insert into county_population values ('New York',	'Franklin',		47555);
insert into county_population values ('New York',	'Chenango',		47220);
insert into county_population values ('New York',	'Cortland',		46809);
insert into county_population values ('New York',	'Allega', 		46456);
insert into county_population values ('New York',	'Delaware',		44308);
insert into county_population values ('New York',	'Wyoming',		40531);
insert into county_population values ('New York',	'Orleans',		40343);
insert into county_population values ('New York',	'Essex',		37381);
insert into county_population values ('New York',	'Seneca',		33814);
insert into county_population values ('New York',	'Schoharie',	29714);
insert into county_population values ('New York',	'Lewis',		26582);
insert into county_population values ('New York',	'Yates',		24774);
insert into county_population values ('New York',	'Schuyler',		17898);
insert into county_population values ('New York',	'Hamilton',		5107);