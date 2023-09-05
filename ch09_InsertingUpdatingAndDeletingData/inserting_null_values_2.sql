-- Let's remove the row we just inserted and insert the same row in a different way
delete from arena where arena_id = 2;

-- This insert statement does the same thing.
-- If we don't list the seating_capacity at all, it will be set to null.
insert into arena
    (
    arena_id,
    arena_name, 
    location
    )
values 
    (
    2,
    'Dean Smith Center',
    'North Carolina'
    );