-- Let's drop and recreate the arena table and have the arena_id automatically increment
drop table arena;

create table arena (
    arena_id          int            primary key       auto_increment,
    arena_name        varchar(100),
    location          varchar(100),
    seating_capacity  int
);

-- Reloading the data without having to manage the arena_id column
insert into arena (arena_name, location, seating_capacity)
values ('Madison Square Garden', 'New York', 20000);

insert into arena (arena_name, location, seating_capacity)
values ('Dean Smith Center', 'North Carolina', null);

insert into arena (arena_name, location, seating_capacity)
values ('Philippine Arena', 'Bocaue', 55000);

insert into arena (arena_name, location, seating_capacity) 
values ('Sportpaleis', 'Antwerp', 23359);

insert into arena (arena_name, location, seating_capacity) 
values ('Bell Centre', 'Montreal', 22114);

insert into arena (arena_name, location, seating_capacity) 
values ('Staples Center', 'Los Angeles', 19060);

select * from arena;
