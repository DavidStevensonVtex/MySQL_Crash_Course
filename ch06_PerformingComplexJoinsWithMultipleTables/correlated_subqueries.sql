-- Correlated subquery
select	employee_name,
		salary
from	employee e
where	salary =
    (
		select  b.salary
		from    best_paid b
		where   b.department = e.department
    );