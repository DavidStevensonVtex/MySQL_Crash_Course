create database bank;

use bank;

create table credit
	(
	customer_id		int,
	customer_name	varchar(100),
	credit_score	int
	);
	
-- Create a before insert trigger	
drop trigger if exists tr_credit_bi;

delimiter //