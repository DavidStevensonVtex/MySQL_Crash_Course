use subway ;

select s.subway_system, s.city, c.country
from subway_system as s, country as c
where s.country_code = c.country_code ;