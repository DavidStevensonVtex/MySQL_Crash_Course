use investment ;

select *
from market_index
where market_value = 
(
    select min(market_value)
    from market_index
) ;

select *
from market_index
where market_value =
(
    select max(market_value)
    from market_index
) ;