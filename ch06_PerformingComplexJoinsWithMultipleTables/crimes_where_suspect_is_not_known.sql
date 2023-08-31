use police ;

select c.crime_name, l.location_name, s.suspect_name
from crime c 
    join location l 
        on c.location_id = l.location_id 
    left join suspect s
        on c.suspect_id = s.suspect_id
where s.suspect_name is null ;