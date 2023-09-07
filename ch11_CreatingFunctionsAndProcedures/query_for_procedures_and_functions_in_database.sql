-- Show all procedures and functions in the population database
select routine_type,
       routine_name
from   information_schema.routines
where  routine_schema='population';