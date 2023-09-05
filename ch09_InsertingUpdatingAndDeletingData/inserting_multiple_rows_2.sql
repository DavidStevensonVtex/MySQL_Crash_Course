-- We could achieve the same results by combining them all in one insert statement:

-- First, let's remove the rows we just inserted and inserted them in a different way
delete from arena where arena_id in (3, 4, 5);

insert into arena (arena_id, arena_name, location, seating_capacity)
values (3, 'Philippine Arena', 'Bocaue', 55000),
       (4, 'Sportpaleis', 'Antwerp', 23359),
       (5, 'Bell Centre', 'Montreal', 22114);