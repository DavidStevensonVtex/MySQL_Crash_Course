-- Create the procedure p_repeat_until_loop()
drop procedure if exists p_repeat_until_loop;

delimiter //
create procedure p_repeat_until_loop()
begin
set @cnt = 0;
repeat
  select 'Looping Again';
  set @cnt = @cnt + 1;
until @cnt = 10 
end repeat;
end;
//
delimiter ;