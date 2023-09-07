-- Create the procedure p_more_sensible_loop()
drop procedure if exists p_more_sensible_loop;

delimiter //
create procedure p_more_sensible_loop()
begin
 set @cnt = 0;
 msl: loop
  select 'Looping Again';
    set @cnt = @cnt + 1;
  if @cnt = 10 then 
    leave msl;
  end if;
end loop msl;
end;
//
delimiter ;