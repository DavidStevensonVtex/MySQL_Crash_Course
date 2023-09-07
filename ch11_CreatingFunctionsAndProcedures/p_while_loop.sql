-- Create procedure p_while_loop()
drop procedure if exists p_while_loop;

delimiter //
create procedure p_while_loop()
begin
set @cnt = 0;
while @cnt < 10 do
  select 'Looping Again';
  set @cnt = @cnt + 1;
end while;
end;
//
delimiter ;