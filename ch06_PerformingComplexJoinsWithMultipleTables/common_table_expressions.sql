-- Listing 6-3. Naming and then querying a CTE

with winery_portfolio_cte as 
(
    select w.winery_name, w.viticultural_area_id 
    from winery w 
        join portfolio p 
            on w.winery_id = p.winery_id 
                and w.offering_tours_flag is true
                and p.in_season_flag is true 
        join wine_type t 
            on p.wine_type_id = t.wine_type_id 
                and t.wine_type_name = 'Merlot' 
)
-- select * from winery_portfolio_cte ;
select c.country_name, r.region_name, v.viticultural_area_name, wp.winery_name
from country c
    join region r 
        on c.country_id = r.country_id and c.country_name = 'USA' 
    join viticultural_area v
        on r.region_id = v.region_id 
    join winery_portfolio_cte wp
        on v.viticultural_area_id = wp.viticultural_area_id ;