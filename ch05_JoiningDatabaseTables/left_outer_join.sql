use subway ;

-- Left Outer Join
select  c.country,
        s.city,
        s.subway_system
from   country c 
    left outer join subway_system s
        on     s.country_code = c.country_code;