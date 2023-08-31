use restaurant ;

select m.main_item, s.side_item
from main_dish m
    cross join side_dish s ;