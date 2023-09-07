-- Create procedure p_split_big_ny_counties()
drop procedure if exists p_split_big_ny_counties;

delimiter //

create procedure p_split_big_ny_counties()
begin
  declare  v_state       varchar(100);
  declare  v_county      varchar(100);
  declare  v_population  int;

  declare done bool default false;
  
  declare county_cursor cursor for 
    select  state,
            county,
            population
    from    county_population
    where   state = 'New York'
    and     population > 2000000;

  declare continue handler for not found set done = true;   
    
  open county_cursor;
  
  fetch_loop: loop
    fetch county_cursor into v_state, v_county, v_population;

    if done then
      leave fetch_loop;
    end if;

    set @cnt = 1;

    split_loop: loop

      insert into county_population
      (
        state, 
        county, 
        population
      )
      values
      (
        v_state,
        concat(v_county,'-',@cnt), 
        round(v_population/2)
      );
      
      set @cnt = @cnt + 1;

      if @cnt > 2 then
        leave split_loop;
      end if;

    end loop split_loop;
    
    -- delete the original county
    delete from county_population where county = v_county;
    
  end loop fetch_loop;
  
  close county_cursor;
end;
//

delimiter ;