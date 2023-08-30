create database mysqldatatype;

use mysqldatatype;

create table solar_eclipse
(
	eclipse_date				date,
	time_of_greatest_eclipse	time,
	eclipse_type				varchar(10),
	magnitude					numeric(4,3)
);