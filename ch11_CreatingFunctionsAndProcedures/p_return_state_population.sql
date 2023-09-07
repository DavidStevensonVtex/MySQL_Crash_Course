-- Create procedure p_return_state_population()
use population;

drop procedure if exists p_return_state_population;

delimiter //

create procedure p_return_state_population(
    in  state_param         varchar(100),
    out current_pop_param   int
)
begin 
    select population
    into   current_pop_param
    from   state_population
    where  state = state_param;
end//

delimiter ;
