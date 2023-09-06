-- Create the f_get_state_population() function
use population;

drop function if exists f_get_state_population;

delimiter //
create function f_get_state_population (
  state_param    varchar(100)
)
returns int
deterministic reads sql data
begin
  declare population_var int;

  select  population
  into    population_var
  from    state_population
  where   state = state_param;

  return(population_var);

end//

delimiter ;