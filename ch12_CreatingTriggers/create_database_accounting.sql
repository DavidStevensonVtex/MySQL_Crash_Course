-- Create the tables for the chapter
create database accounting;

use accounting;

-- Create a table for account payable data for a company
create table payable
	(
	payable_id	int,
	company		varchar(100),
	amount		numeric(8,2),
	service		varchar(100)
	);
	
insert into payable
	(
	payable_id,
	company,
	amount,
	service
	)
values
	(1, 'Acme HVAC', 		 	 123.32,	'Repair of Air Conditioner'),
	(2, 'Initech Printers',		1459.00,	'New Printers'),
	(3, 'Hooli Cleaning',		4398.55,	'Janitorial Services');
	
-- Create the payable_audit table that will track changes to the payable table
create table payable_audit
	(
	audit_datetime	datetime,
	audit_user		varchar(50),
	audit_change	varchar(500)
	);