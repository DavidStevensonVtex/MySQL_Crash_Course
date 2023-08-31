use wine ;

drop temporary table if exists  wp1;

create temporary table wp1
(
    winery_name             varchar(100),
    viticultural_area_id    int
) ;

insert into wp1 ( winery_name, viticultural_area_id )
    select winery_name, viticultural_area_id
    from winery ;