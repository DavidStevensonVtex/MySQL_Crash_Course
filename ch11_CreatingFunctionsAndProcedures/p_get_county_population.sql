-- Create procedure p_get_county_population()
use population;

drop procedure if exists p_get_county_population;

delimiter //

create procedure p_get_county_population(
    in state_param varchar(100)
)
begin
    select county,
           format(population,0)
    from   county_population
    where  state = state_param
    order by population desc;
end//

delimiter ;