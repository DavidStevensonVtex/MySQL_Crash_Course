use investment ;

load data local 
infile 'D:/drs/MySQL/MySQL_Crash_Course/ch14_TipsAndTricks/market_indexes.csv' 
into table market_index
fields terminated by ','
ignore 1 lines ;

select * from market_index;