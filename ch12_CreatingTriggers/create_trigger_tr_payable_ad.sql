-- Create an after delete trigger
use accounting;

drop trigger if exists tr_payable_ad;

delimiter //

create trigger tr_payable_ad
  after delete on payable
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
        'Deleted row for payable_id ',
        old.payable_id,
        '. Company: ',
        old.company,
       '. Amount: ',
       old.amount,
       '. Service: ',
       old.service
    )
  );
end//

delimiter ;	