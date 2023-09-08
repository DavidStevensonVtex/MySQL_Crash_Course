use investment ;

select *
from market_index
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/market_index_output.csv'
fields terminated by ',' optionally enclosed by '"' ;