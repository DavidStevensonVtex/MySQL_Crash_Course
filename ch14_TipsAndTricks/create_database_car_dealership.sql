create database car_dealership;

use car_dealership;

create table inventory
	(
	vin		char(17),
	mfg		varchar(100),
	model	varchar(100),
	color	varchar(100)
	);
	
insert into inventory(vin, mfg, model, color) values ('1ADCQ67RFGG234561','Ford', 		'Mustang',	'red');
insert into inventory(vin, mfg, model, color) values ('2XBCE65WFGJ338565','Toyota', 	'RAV4', 	'orange');
insert into inventory(vin, mfg, model, color) values ('3WBXT62EFGS439561','Volkswagen', 'Golf', 	'black');
insert into inventory(vin, mfg, model, color) values ('4XBCX68RFWE532566','Ford', 		'Focus', 	'green');
insert into inventory(vin, mfg, model, color) values ('5AXDY62EFWH639564','Ford', 		'Explorer', 'yellow');
insert into inventory(vin, mfg, model, color) values ('6DBCZ69UFGQ731562','Ford', 		'Escort', 	'white');
insert into inventory(vin, mfg, model, color) values ('7XBCX21RFWE532571','Ford', 		'Focus', 	'black');
insert into inventory(vin, mfg, model, color) values ('8AXCL60RWGP839567','Toyota', 	'Prius', 	'gray');
insert into inventory(vin, mfg, model, color) values ('9XBCX11RFWE532523','Ford', 		'Focus', 	'red');