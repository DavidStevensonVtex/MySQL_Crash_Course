use subway ;

select s.subway_system as metro, s.city, c.country
from subway_system as s
    inner join country as c
        on s.country_code = c.country_code 
where c.country_code = 'FR' ;