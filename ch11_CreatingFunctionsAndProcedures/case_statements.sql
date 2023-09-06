-- Create the p_population_group() procedure
use population;

drop procedure if exists p_population_group;

delimiter //

create procedure p_population_group(
    in state_param varchar(100)
)
begin
    declare state_population_var int;
    
    select population
    into   state_population_var
    from   state_population
    where  state = state_param;

    case 
      when state_population_var > 30000000 then select 'Over 30 Million';
      when state_population_var > 10000000 then select 'Between 10M and 30M';
      else select 'Under 10 Million';
    end case;

end//

delimiter ;