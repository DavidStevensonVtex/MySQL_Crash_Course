-- Create a before insert trigger	
drop trigger if exists tr_credit_bi;

delimiter //

create trigger tr_credit_bi
  before insert on credit
  for each row
begin
  if (new.credit_score < 300) then
	set new.credit_score = 300;
  end if;
  
  if (new.credit_score > 850) then
	set new.credit_score = 850;
  end if;
 
 end//

delimiter ;