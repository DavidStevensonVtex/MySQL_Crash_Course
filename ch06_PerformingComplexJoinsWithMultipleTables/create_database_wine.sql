-- Setting up a wine database for the examples below
create database wine;

use wine;

create table country
	(
	country_id		int,
	country_name	varchar(100)
	);

insert into country (country_id, country_name) values (1,'France');
insert into country (country_id, country_name) values (2,'Spain');
insert into country (country_id, country_name) values (3,'USA');

create table region
	(
	region_id	int,
	region_name	varchar(100),
	country_id	int
	);
	
insert into region (region_id, region_name, country_id) values (1, 'Napa Valley', 3);
insert into region (region_id, region_name, country_id) values (2, 'Walla Walla Valley', 3);
insert into region (region_id, region_name, country_id) values (3, 'Texas Hill', 3);

create table viticultural_area
	(
	viticultural_area_id	int,
	viticultural_area_name	varchar(100),
	region_id				int
	);

insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (1, 'Atlas Peak', 1);
insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (2, 'Calistoga', 1);
insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (3, 'Wild Horse Valley', 1);

create table winery 
	(
	winery_id				int,
	winery_name 			varchar(100),
	viticultural_area_id	int,
	offering_tours_flag		bool
	);
	
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (1, 'Silva Vinyards', 1, false);
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (2, 'Chateau Traileur Parc', 2, true);
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (3, 'Winosaur Estate', 3, true);

	
create table wine_type
	(
	wine_type_id	int,
	wine_type_name	varchar(100)
	);
	
insert into wine_type values (1, 'Chardonnay');
insert into wine_type values (2, 'Cabernet Sauvignon');
insert into wine_type values (3, 'Merlot');

create table portfolio
	(
	winery_id		int,
	wine_type_id	int,
	in_season_flag	bool
	);
	
	
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 3, false);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 3, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 3, true);