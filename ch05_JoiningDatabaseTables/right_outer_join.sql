use subway ;

-- Right Outer Join
select  c.country,
        s.city,
        s.subway_system
from   subway_system s
    right outer join country c
        on     s.country_code = c.country_code;