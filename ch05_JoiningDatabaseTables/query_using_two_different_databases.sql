select s.subway_system, s.city, c.country
from subway.subway_system as s 
    inner join location.country as c 
        on s.country_code = c.country_code ;