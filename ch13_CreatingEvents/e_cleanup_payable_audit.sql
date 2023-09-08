-- Create event e_cleanup_payable_audit
use bank;

drop event if exists e_cleanup_payable_audit;

delimiter //

create event e_cleanup_payable_audit
 on schedule every 1 month
 starts '2024-01-01 10:00'
do 
begin
  delete from payable_audit
  where audit_datetime < date_sub(now(), interval 1 year);
end //

delimiter ;
