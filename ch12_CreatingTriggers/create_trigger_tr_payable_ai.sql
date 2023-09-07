-- Create an after insert trigger	
drop trigger if exists tr_payable_ai;

delimiter //

create trigger tr_payable_ai
  after insert on payable
  for each row
begin
  insert into payable_audit
	(
      audit_datetime,
      audit_user,
      audit_change
    )
  values
    (
      now(),
	  user(),
	  concat(
		  'New row for payable_id ',
		  new.payable_id,
		  '. Company: ',
		  new.company,
		  '. Amount: ',
		  new.amount,
		  '. Service: ',
		  new.service
	  )
	);
end//

delimiter ;