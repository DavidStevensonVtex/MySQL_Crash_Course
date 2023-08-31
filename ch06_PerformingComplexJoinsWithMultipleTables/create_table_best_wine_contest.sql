-- Creating the best_wine_contest table for the union example below
create table best_wine_contest
(
	wine_name  varchar(100),
    place		int
);

insert into best_wine_contest (wine_name, place) values ('Riesling',1);
insert into best_wine_contest (wine_name, place) values ('Pinot Grigio',2);
insert into best_wine_contest (wine_name, place) values ('Zinfandel',3);
insert into best_wine_contest (wine_name, place) values ('Malbec',4);
insert into best_wine_contest (wine_name, place) values ('Verdejo',5);
