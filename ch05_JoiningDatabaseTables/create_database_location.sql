-- Create a copy of the country table in the location database to test joining tables in different databases
create database location;

create table location.country as select * from subway.country;