-- Create the p_set_state_population() procedure
use population;

drop procedure if exists p_set_state_population;

delimiter //

create procedure p_set_state_population(
    in state_param varchar(100)
)
begin
    delete from state_population
    where state = state_param;
   
    insert into state_population
    (
           state,
           population
    )
    select state,
           sum(population)
    from   county_population
    where  state = state_param
    group by state;
    
end//

delimiter ;