use subway ;

-- Inner Join with Table Aliasing
select s.subway_system,
       s.city,
       c.country
from   subway_system s
inner join country c
on     s.country_code = c.country_code;