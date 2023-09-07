-- Create the before delete trigger	
use bank;

delimiter //

create trigger tr_credit_bd
 before delete on credit
  for each row
begin
  if (old.credit_score > 750) then
     signal sqlstate '45000'
       set message_text = 'Cannot delete scores over 750';
  end if;

end//

delimiter ;