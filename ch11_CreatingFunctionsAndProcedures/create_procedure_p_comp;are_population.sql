-- Create the p_compare_population() procedure
use population;

drop procedure if exists p_compare_population;

delimiter //

create procedure p_compare_population(
    in state_param varchar(100)
)
begin
    declare state_population_var int;
    declare county_population_var int;

    select  population
    into    state_population_var
    from    state_population
    where   state = state_param;

    select sum(population)
    into   county_population_var
    from   county_population
    where  state = state_param;

    if (state_population_var = county_population_var) then
       select 'The population values match';
    else
       select 'The population values are different';
    end if;
	
	-- If you want to display one of THREE messages, replace the if/else above with this code
	-- Remove the comment characters (the 2 dashes) first.
	
    -- if (state_population_var = county_population_var) then
    --    select 'The population values match';
    -- elseif (state_population_var > county_population_var) then
    --    select 'State population is more than the sum of county population';
    -- else
    --    select 'The sum of county population is more than the state population';
    -- end if;
end//

delimiter ;