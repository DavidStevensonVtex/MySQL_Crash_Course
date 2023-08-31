use wine ;

drop temporary table if exists  winery_portfolio ;

create temporary table winery_portfolio 
    select w.winery_name, w.viticultural_area_id 
    from winery w 
        join portfolio p 
            on w.winery_id = p.winery_id 
                and w.offering_tours_flag is true
                and p.in_season_flag is true 
        join wine_type t 
            on p.wine_type_id = t.wine_type_id 
                and t.wine_type_name = 'Merlot' ; 

select * from winery_portfolio ;
        