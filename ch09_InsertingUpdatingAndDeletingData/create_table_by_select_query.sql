-- Creating a table based on a query
create table new_arena as
    select  building_name,
            building_location,
            building_capacity 
    from    large_building
    where   building_type = 'Arena'
    and     active_flag is true;

select * from new_arena;

desc new_arena;