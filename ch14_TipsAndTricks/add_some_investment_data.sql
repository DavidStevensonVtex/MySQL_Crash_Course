use investment ;

delete from market_index ;
insert into market_index ( market_index, market_value ) 
values	( 'S&P 500', 4351.77 ),
		( 'Dow Jones Industrial Average', 34150.66 ) ;

select * from market_index ;