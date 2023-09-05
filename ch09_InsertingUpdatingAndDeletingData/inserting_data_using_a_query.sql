-- Let's use the same query to insert into the arena table
insert into arena (
        arena_name, 
        location,
        seating_capacity
)
    select  building_name,
            building_location,
            building_capacity 
    from    large_building
    where   building_type = 'Arena'
    and     active_flag is true;