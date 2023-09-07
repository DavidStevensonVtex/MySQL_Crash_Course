-- Create the p_endless_loop() procedure. This creates an endless loop.
drop procedure if exists p_endless_loop;

delimiter //
create procedure p_endless_loop()
begin
loop
  select 'Looping Again';
end loop;
end;
//
delimiter ;