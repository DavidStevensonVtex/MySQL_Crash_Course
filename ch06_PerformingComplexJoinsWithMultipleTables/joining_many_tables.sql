-- Listing 6-1: A query to list US wineries with in-season Merlot

use wine ;

select c.country_name, r.region_name, v.viticultural_area_name, w.winery_name 
from country c 
    join    region r 
        on c.country_id = r.country_id and c.country_name = 'USA' 
    join    viticultural_area v 
        on r.region_id = v.region_id 
    join    winery w 
        on v.viticultural_area_id = w.viticultural_area_id 
            and w.offering_tours_flag is true 
    join    portfolio p 
        on w.winery_id = p.winery_id 
            and p.in_season_flag is true 
    join    wine_type t 
        on p.wine_type_id = t.wine_type_id 
            and t.wine_type_name = 'Merlot' ;