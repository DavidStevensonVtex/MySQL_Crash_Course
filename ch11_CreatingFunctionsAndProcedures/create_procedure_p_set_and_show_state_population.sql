-- Create the p_set_and_show_state_population() procedure
use population;

drop procedure if exists p_set_and_show_state_population;

delimiter //

create procedure p_set_and_show_state_population(
    in state_param varchar(100)
)
begin
    declare population_var int;

    delete from state_population
    where state = state_param;
   
    select sum(population)
    into   population_var
    from   county_population
    where  state = state_param;

    insert into state_population
    (
           state,
           population
    )
    values
    (
           state_param,
           population_var
    );

    select concat(
               'Setting the population for ',
               state_param,
               ' of ',
               population_var
            );
end//

delimiter ;