# MySQL_Crash_Course

My self-traininng in MySQL Crash Course, by Rick Silva

## Chapter 2: Creating Databases and Tables

```show databases;```

__Database Terminology__

In MySQL, the term schema is synonymous with _database_. 
You can use show databases or show schemas to return a list of all of your databases.

### 2.1 Set Up MySQL Shell for VS Code
This section describes how to install the MySQL Shell for VS Code for use inside Visual Studio Code and to activate an embedded instance of MySQL Shell if it is not installed on your system. MySQL Shell is a component that you can install separately.

* Download the MySQL Shell for VS Code extension file
* Install the MySQL Shell for VS Code extension
* How to get MySQL

### Creating a New Database

```
show databases;

create database circus ;

create database finance ;

create database music ;
```

### Creating a New Table

```
create database land ;

use land ;

create table continent  
(
    continent_id        int,
    continent_name      varchar(20),
    population          bigint
);
```

#### Constraints

##### Primary Keys

```
create table customer
(
    customer_id     int,
    first_name      varchar(50),
    last_name       varchar(50),
    address         varchar(100),
    primary key (customer_id)
) ;
```

Listing 2-1. Creating a primary key

```
create table high_temperature
(
    city                varchar(50),
    year                int,
    high_temperature    int,
    primary key ( city, year )
) ;
```
Listing 2-2. Creating multiple primary key columns

##### Foreign Keys

```
create table complaint
(
    complaint_id        int,
    customer_id         int,
    complaint           varchar(200),
    primary key (complaint_id),
    foreign key (customer_id) references customer(customer_id)
);
```


##### not null constraints

```
create table contact
(
    contact_id      int,
    name            varchar(50) not null,
    city            varchar(50),
    phone           varchar(20),
    email_address   varchar(50),
    primary key (contact_id)
);
```

##### unique constraints

```
create table contact
(
    contact_id      int,
    name            varchar(50) not null,
    city            varchar(50),
    phone           varchar(20),
    email_address   varchar(50)     unique,
    primary key (contact_id)
);
```

##### check constraints

```
create table high_temperature
(
    city                varchar(50),
    year                int,
    high_temperature    int,
    constraint check ( year between 1880 and 2200),
    constraint check ( high_temperature < 200 ),
    primary key ( city, year )
) ;
```

##### default constraints

```
create table job
(
    job_id      int,
    job_desc    varchar(100),
    shift       varchar(50) default '9-5',
    primary key(job_id)
);
```

#### Indexes

```
create table product
(
    product_id      int,
    product_name    varchar(100),
    supplier_id     int
);
```

```
create index product_supplier_index on product(supplier_id) ;
```

You don't need to create indexes for columns that have been defined as primary keys, as foreign keys,
or with unique constraints, because MySQL automatically indexes those columns.

##### Automatically created indexes

```
use pet ;

create table dog 
(
    dog_id              int,
    dog-name            varchar950),
    owner_id            int,
    breed_id            int,
    veterinarian_id     int,
    primary key (dog_id),
    foreign key (owner_id) references owner(owner_id),
    foreign key (breed_id) references breed(breed_id),
    foreign key (veterinarian_id) references veterinarian(veterinarian_id)
);
```

#### Dropping and Altering Tables

```
drop table product ;

alter table customer add column zip varchar(50);
alter table customer drop column address ;
alter table customer rename column zip to zip_code ;
alter table customer rename to valued_customer ;
```

## Chapter 3: Introduction to SQL

### Querying Data from a Table

```
select continent_id, continent_name, population
from continent ;
```

```
select continent_id, continent_name, population
from continent 
where continent_name = 'Asia' ;
```

```
select population
from continent 
where continent_name = 'Asia' ;
```

### Using the Wildcard Character

```
select *
from continent ;
```

### Ordering Rows

```
select continent_id, continent_name, population
from continent
order by continent_name ;
```

__Ordering columns with integer types__

```
select continent_id, continent_name, population
from continent
order by population desc ;
```

### Formatting SQL Code

How MySQL Workbench beautifies SQL

```
SELECT 
    continent_id, continent_name, population
FROM
    continent;
```

#### Uppercase Keywords

Some developers use uppercase for MySQL keywords.

```
SELECT 
    continent_id, continent_name, population
FROM
    continent;
```

How MySQL Workbench beutifies this SQL

```
CREATE TABLE dog (
    dog_id INT,
    dog_name VARCHAR(50),
    owner_id INT,
    breed_id INT,
    veterinarian_id INT,
    PRIMARY KEY (dog_id),
    FOREIGN KEY (owner_id)
        REFERENCES owner (owner_id),
    FOREIGN KEY (breed_id)
        REFERENCES breed (breed_id),
    FOREIGN KEY (veterinarian_id)
        REFERENCES veterinarian (veterinarian_id)
);
```

#### Backticks

```
SELECT 
    `continent_id`, `continent_name`, `population`
FROM
    continent;
```

Backticks allow you to get around some of MySQL's rules for naming tables and columns.

#### Code Comments

To add single-line comments, use two hypens followed by a space (-- ). This syntax
tells MySQL that the rest of the line is a comment.

To add multiline comments, use /* at the beginning of the comment and */ at the end.

### Null Values

```
select *
from unemployed ;
```

```
select *
from unemployed 
where unemployed is null ;
```

```
select *
from unemployed 
where unemployed is not null ;
```

## Chapter 4: MySQL Data Types

### Decimal and Date Data Types

```
create table solar_eclipse
(
	eclipse_date				date,
	time_of_greatest_eclipse	time,
	eclipse_type				varchar(10),
	magnitude					numeric(4,3)
);
```

### String Data Types

#### char data type

The char data type is used for fixed-length strings.

The char data type defaults to one character if you leave out the parentheses.

You can define a char data type with up to 255 characters.

```
create table country_code
(
    country_code    char(3)
);
```

#### varchar data type

The varchar data tpe is for _variable-length_ strings, or strings that can hold _up to_ a
specified number of characters.

The number of characters that varchar can accept depends on your MySQL configuration.

```
create table interesting_people
(
    interesting_name    varchar(100)
);
```

```
create table test_varchar_size
(
    huge_column varchar(999999999)
);

Error Code: 1074. Column length too big for column 'huge_column' (max = 16383); use BLOB or TEXT instead
```

#### enum data type

```
create table student
	(
	student_id     int,
	student_class  enum('Freshman','Sophomore','Junior','Senior')
	);

```

#### set data type

The set data type is similar to the enum data type, but set allows you to select multiple values.

```
create table interpreter
    (
    interpreter_id     int,
    language_spoken    set('English','German','French','Spanish')
    );
```

#### tinytext, text, mediumtext, and longtext data types

<pre>
tinytext    Stores up to 255 characters
text        Stores up to 65,535 characters, approximately 64KB
mediumtext  Stores up to 16,777,215 characters, approximately 16MB
longtext    Stores up to 4,294,967,295 characters, approximately 4GB
</pre>

```
create table book
    (
    book_id            int,
    author_bio         tinytext,
    book_proposal      text,
    entire_book        mediumtext
    );
```

#### String Formatting

String values must be surrounded by single quotes or double quotes.

```
select *
from store
where store_name = "Bill's Supply" ;
```

```
select *
from store
where store_name = 'Bill\'s Supply' ;
```

__Other escape sequences__

<pre>

\"  Double quote
\n  Newline (linefeed)
\r  Carriage return
\t  Tab
\\  Backslash
</pre>

### Binary Data Types

#### tinyblob, blob, mediumblob, and longblob

<pre>
tinyblob    Stores up to 255 bytes
text        Stores up to 65,535 bytes, approximately 64KB
mediumblob Stores up to 16,777,215 bytes, approximately 16MB
longblob    Stores up to 4,294,967,295 bytes, approximately 4GB
</pre>

#### binary data type

The binary data type is for fixed-length binary data. It's very similar to the
char data type, except that it's used for strings of binary data rather than 
character strings.

```
create table encryption
    (
    key_id          int,
    encryption_key  binary(50)
    );
```

#### varbinary data type

The varbinary data type is for variable-length binary data. You specify the maximum size.

```
create table signature
    (
    signature_id    int,
    signature       varbinary(400)
    );
```

#### bit data type

You can specify how many bits you want to store, up to a maximum of 64. 

### Numeric Data Types

#### tinyint, smallint, mediumint, int, and bigint

<pre>
tinyint     Stores integer values that range from -128 to 127, or 1 byte of storage
smallint    Stores integer values ranging from -32,768 to 32,767, or 2 bytes of storage
mediumint   Stores integer values ranging from -8,388,608 to 8,388,607, or 3 bytes of storage
int         Stores integer values ranging from -2,147,483,648 to 2,147,483,647, or 4 byte of storage
bigint      Stores integer values that range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807, or 8 bytes of storage
</pre>

```
create table planet_stat 
(
	planet            varchar(20),
	miles_from_earth  bigint,
	diameter_km       mediumint
);
```

One technique you can use for space efficiency is defining integer data types as unsigned.

```
create table planet_stat 
(
	planet            varchar(20),
	miles_from_earth  bigint,
	diameter_km       mediumint
);
```

### Boolean Data Type

Boolean values have only two states: true or false, on or off; 1 or 0.

```
create table food
(
    food              varchar(30),
    organic_flag      bool,
    gluten_free_flag  bool
);
```

It's common practice to add the suffix _flag to columns that contain boolean values, such as organic_flag.

### Decimal Data Types

MySQL provides the decimal, float and double data types.

#### decimal data type

_Precision_ is the total number of digits that you can store, and _scale_ is the number of digits
after the decimal point. Example: decimal(5,2)

The synonyms for decimal are numeric, dec, and fixed. All of these are equivalent.

#### float data type

The float data type stores numeric data witha floating-point decimal.

#### double data type

The _double_ data type, is short for double precision.


### Date and Time Data Types

<pre>
date        YYYY-MM-DD (year, month, day)
time        hh:mm:ss format, hours, minutes, seconds
datetime    Stores both date and time, years 1000 to 9999
timestamp   Stores the current date and time, Years between 1970 and 2038.
year        Stores the year in the YYYY format.
</pre>

### The json Data Type

_JavaScript Object Notation (JSON)_

### Spatial Data Types

Spatial data types represent geographical location data, also known as _geodata_.

Spatial data types include:

* geometry
* point
* linestring
* polygon
* multipoint
* multilinestring
* emultipolygon
* geometrycollection

# Chapter 5: Joining Database Tables

## Selecting Data from Multiple Tables

### Inner Join

```
use subway ;

-- Inner Join
select subway_system.subway_system,
       subway_system.city,
       country.country
from   subway_system
inner join country
on     subway_system.country_code = country.country_code;
```

### Table Aliasing

```
-- Inner Join with Table Aliasing
select s.subway_system,
       s.city,
       c.country
from   subway_system s
inner join country c
on     s.country_code = c.country_code;
```

### Types of Joins

#### Inner Joins

The word inner is optional because this is the default join.

#### Outer Joins

```
use subway ;

-- Right Outer Join
select s.subway_system,
       s.city,
       c.country
from   subway_system s
    right outer join country c
        on     s.country_code = c.country_code;
```

The word _outer_ is optional; using left join and right join will produce the same
results.

```

```

#### Natural Joins

A natural join in MySQL automatically joins tables when they have a column with the same name.

```
use subway ;

select *
from subway_system s
    natural join country c ;

```

#### Cross Joins

MySQ''s cross join syntax can be used to get the Cartesian product of two tables. 
A _Cartesian product_ is a listing of every row in one table matched with every row 
in a second table.

```
use restaurant ;

select m.main_item, s.side_item
from main_dish m
    cross join side_dish s ;
```

## Self Joins

To pair music fans who like the same genre, join the music_preference table to itself.

```
use music_club ;

select a.music_fan, b.music_fan
from music_preference a 
    inner join music_preference b 
        on a.favorite_genre = b.favorite_genre
where a.music_fan != b.music_fan
order by a.music_fan ;
```

## Variations on Join Syntax

### Parentheses

You can choose to use parentheses when joining on columns or leave them off.

### Old-School Inner Joins

```
use subway ;

select s.subway_system, s.city, c.country
from subway_system as s, country as c
where s.country_code = c.country_code ;
```

## Column Aliasing

```
use subway ;

select s.subway_system as metro, s.city, c.country
from subway_system as s
    inner join country as c
        on s.country_code = c.country_code 
where c.country_code = 'FR' ;
```

## Joining Tables in Different Databases

```
use subway ;

select * from subway_system ;
```

Alternatively:

```select * from subway.subway_system ;```

Query using two different databases:

```
select s.subway_system, s.city, c.country
from subway.subway_system as s 
    inner join location.country as c 
        on s.country_code = c.country_code ;
```

# Chapter 6: Performing Complex Joins with Multiple Tables

## Writing One Query with Two Join Types

```
use police ;

select c.crime_name, l.location_name, s.suspect_name
from crime c 
    join location l 
        on c.location_id = l.location_id 
    left join suspect s
        on c.suspect_id = s.suspect_id ;
```

__Crimes Where Suspect is not Known__

```
use police ;

select c.crime_name, l.location_name, s.suspect_name
from crime c 
    join location l 
        on c.location_id = l.location_id 
    left join suspect s
        on c.suspect_id = s.suspect_id
where s.suspect_name is null ;
```

### Joining Many Tables

MySQL allows up to 61 tables in a join.

```
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
```

## Associative Tables

The _portfolio_ table represents _many-to-many relationships_ because one winery can produce many wine types, and one wine type can be produced in many wineries.

## Managing the Data in Your Result Set

### The limit Keyword

The _limit_ keyword lets you limit the number of rows displayed in your result set.

```
select *
from best_wine_contest 
order by place ;
```

If you want to see only the top three wines, use limit 3:

```
select *
from best_wine_contest 
order by place
limit 3 ;
```

### The union Keyword

```
select wine_type_name from wine_type
union
select wine_name from best_wine_contest ;
```

You can use _union_ only when every select statement has the same number of columns.

The _union_ keyword will remove duplicate values from the result set.

To see a list that includes duplicate values, use union all:

```
select wine_type_name from wine_type
union all
select wine_name from best_wine_contest ;
```

## Temporary Tables

MySQL allows you to create temporary tables -- that is, a temporary result set that
will exist only for your current session and then be automatically dropped.

```
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
```

```
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
        
```

```
select c.country_name, r.region_name, v.viticultural_area_name, w.winery_name
from country c
    join region r 
        on c.country_id = r.country_id and c.country_name = 'USA' 
    join viticultural_area v
        on r.region_id = v.region_id 
    join winery_portfolio w
        on v.viticultural_area_id = w.viticultural_area_id ;
```

## Common Table Expressions

Common Table Expressions (CTEs), a feature introduced in MySQL version 8.0,
are a temporary result set that you name and can then select from as if it
were a table.

```
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
```

## Recursive Common Table Expressions

```
with recursive borg_scale_cte as
(
    select  6 as current_count
    union
    select  current_count + 1
    from    borg_scale_cte
    where current_count < 20 
)
select * from borg_scale_cte ;
```

## Derived Tables

```
select  wot.winery_name, t.wine_type_name
from    portfolio p
    join wine_type t
        on p.wine_type_id = t.wine_type_id
    join (
        select *
        from winery
        where offering_tours_flag is true
    ) wot
        on p.winery_id = wot.winery_id ;
```

## Subqueries

```
select region_name
from region
where country_id =
    (
        select country_id 
        from country
        where country_name = 'USA' 
    ) ;
```

## Subqueries that return more than One Row

```
select region_name
from region
where country_id in
    (
        select country_id 
        from country
    ) ;
```

## Correlated Subqueries

```
-- Correlated subquery
select	employee_name,
		salary
from	employee e
where	salary =
    (
		select  b.salary
		from    best_paid b
		where   b.department = e.department
    );
```

# Chapter 7: Comparing Values

## Equal

```
use wine;

select  *
from    country
where   country_id = 3;
```

```
select  *
from    wine_type
where   wine_type_name = 'Merlot';
```

```
select  c.country_name
from    country c
    join    region r
        on    c.country_id = r.country_id;
```

```
select *
from   region
where  country_id =
(
    select country_id
    from   country
    where  country_name = 'USA'
);
```
## Not Equal

Not equal is expressed by the <> or != symbols.

```
-- Using "not equal" (!=)
select  *
from    musical_instrument
where   instrument != 'banjo';
```

```
select *
from possible_wedding_date
where wedding_date <> '2024-02-11' ;
```

## Greater Than

```
select  *
from    job
where   salary > 100000
and     start_date > '2024-01-20';
```

## Greater Than or Equal To

```
select  *
from    job
where   salary >= 100000
and     start_date >= '2024-01-20';
```

## Less Than

```
select *
from   team_schedule
where  game_time < '22:00';
```

## Less Than or Equal To

```
select *
from   team_schedule
where  game_time <= '22:00';
```

## is null

```
-- Is null
select  *
from    employee
where   retirement_date is null;
```

## is not null

```
-- Is not null
select *
from   employee
where  retirement_date is not null;
```

## in

```
select  *
from    wine_type
where   wine_type_name in ('Chardonnay', 'Riesling');
```

```
select  *
from    wine_type
where   wine_type_name in 
        (
        select  wine_type_name
        from    cheap_wine
        );
```

## not in

```
-- Not in
select  *
from    wine_type
where   wine_type_name not in ('Chardonnay', 'Riesling');
```

```
select  *
from    wine_type
where   wine_type_name not in 
        (
        select  wine_type_name
        from    cheap_wine
        );
```

## between

```
-- Between
select  *
from    customer
where   birthyear between 1981 and 1996;
```

## not between

```
-- Not between
select  *
from    customer
where   birthyear not between 1981 and 1996;
```

## like

There are two wildcard characters that can be used with like and not like operators: percent (%) or underscore (\_).

### The % Character

```
-- Like
select  * 
from    billionaire
where   last_name like 'M%';
```

```
select  * 
from    billionaire
where   last_name like '%e%';
```

### The \_ Character

```
select  * 
from    three_letter_term
where   term like '_at';
```

## not like

```
-- Not like
select  * 
from    three_letter_term
where   term not like '_at';
```

```
select  * 
from    billionaire
where   last_name not like 'M%';
```

## exists

```
-- Exists
select 'There is at least one millennial in this table'
where exists
(
    select  *
    from    customer
    where   birthyear between 1981 and 1996
);
```

```
-- Same query using "select 1" instead of "select *"
select 'There is at least one millennial in this table'
where exists
(
    select  1
    from    customer
    where   birthyear between 1981 and 1996
);
```

## Checking Booleans

```
-- checking a boolean column
select  *
from    bachelor
where   employed_flag is true;
```

```
select  *
from    bachelor
where   employed_flag is false;
```

```
-- Ways to check for true
select * from bachelor where employed_flag is true;
select * from bachelor where employed_flag;
select * from bachelor where employed_flag = true;
select * from bachelor where employed_flag != false;
select * from bachelor where employed_flag = 1;
select * from bachelor where employed_flag != 0;
```

```
-- Ways to check for false
select * from bachelor where employed_flag is false;
select * from bachelor where not employed_flag;
select * from bachelor where employed_flag = false;
select * from bachelor where employed_flag != true;
select * from bachelor where employed_flag = 0;
select * from bachelor where employed_flag != 1;
```

## or conditions

```
-- Using OR
select  *
from    applicant
where   bachelors_degree_flag is true
or      years_experience >= 2;
```

```
-- This query returns unexpected results
select  *
from    applicant
where   years_experience >= 2
and     associates_degree_flag is true
or      bachelors_degree_flag is true;
```

```
-- Adding parentheses gives us the results we expected
select  *
from    applicant
where   years_experience >= 2
and     (
        associates_degree_flag is true
or      bachelors_degree_flag is true
        );
```

# Chapter 8: Calling Built-In MySQL Functions

## What is a Function?

A function is a set of saved SQL statements that performs some task and returns a value.

```select pi();```

## Passing Arguments to a Function

```select upper('rofl');```

```select datediff('2024-12-25', '2024-11-28');```

## Optional Arguments

The round() function, which rounds decimal numbers, accepts one argument that must be provided
and a second argumetn with is optional. If you call round() with the number you want rounded as 
the only argument, it will round the number to zero places.

```select round(2.71828);```

Result: 3

```select round(2.71828, 2);```

Result: 2.72

```help round```

## Calling Functions Within Functions

```select round(pi());```

Result: 3

```select round(pi(), 2);```

Result: 3.14

## Calling Functions from Different Parts of Your Query

```
select upper(movie_name),
       round(star_rating)
       from movie
where  star_rating > 3
    and    year(release_date) <= 2024;
```

## Aggregate Functions

### count()

```
-- The land database and the continent table were created in chapter_2.sql
use land;

select  count(*) 
from    continent;
```

```
select  count(*)
from    continent
where   population > 1000000000;
```

### max()

```
select max(population) 
from   continent;

```

```
select   * 
from     train
where    mile =
(
  select max(mile)
  from   train
);
```

### min()

```
-- Switch back to the "land" database
use land;

select min(population) 
from   continent;
```

### sum()

```
select sum(population) 
from   continent;
```

### avg()

```
select avg(population) 
from   continent;
```

```
select    *
from      continent
where     population <
(
  select  avg(population)
  from    continent
);
```

### group by

```
select customer_name, sum(amount) 
from   sale
group by customer_name;
```

```
select salesperson_name, sum(amount) 
from   sale
group by salesperson_name;
```

```
select  sum(amount)
from    sale;
```

```
select salesperson_name, count(*)
from   sale
group by salesperson_name;
```

```
select   salesperson_name, avg(amount)
from     sale 
group by salesperson_name;
```

```
select  salesperson_name,
        avg(amount)
from    sale 
group by salesperson_name;
```

```
select country,
       state,
       count(*)      
from   theme_park
group by country, state;
```

## String Functions

### concat()

```
select  concat(first_name, ' ', last_name)
from    phone_book;
```

The following may work in other database systems, but not in MySQL.

```
select  first_name +  ' ' + last_name
from    phone_book;
```

### format()

```
-- Switch back to the "land" database
use land;

select  population
from    continent
where   continent_name = 'Asia';
```

Result: 4641054775

```
select format(population, 0)
from   continent;
```

4,641,054,775
1,340,598,147
747,636,026
592,072,212
430,759,766
43,111,704
0


```
select format(1234567.89, 5);
```

1,234,567.89000

### left()

```
select  last_name,
        left(last_name, 3)
from    taxpayer;
```
### right()

```
select  right(soc_sec_no, 4)
from    taxpayer;
```

### lower()

```
select  lower(last_name)
from    taxpayer;
```

### upper()

```
select  upper(last_name)
from    taxpayer;
```

```
select  last_name 
from    taxpayer
where   upper(last_name) = upper('Mccartney');
```

### substring()

```
select substring('gumbo', 1, 3);
-- gum

select substring('gumbo', -3, 2);
-- mb

select substring('MySQL', 3);
-- SQL

select substring('gumbo' from 1 for 3);
-- gum
```

### trim()

```
select trim(leading  '*' from '**instructions**') as column1,
       trim(trailing '*' from '**instructions**') as column2,
       trim(both     '*' from '**instructions**') as column3,
       trim(         '*' from '**instructions**') as column4;
```

Result: instructions**, **instructions, instructions, instructions

```
select trim('   asteroid   ');
```
Result: 'asteroid' (quotes used to indicate absence of space characters, but are not included in the string)

### ltrim()

select ltrim('   asteroid   ');

Result: 'asteroid   '

### rtrim()

select rtrim('   asteroid   ');

Result: '   asteroid'

## Date and Time Functions

### curdate()

```select curdate() ;```

Result: 2023-09-02

### curtime()

```select curtime() ;```

Result: 13:24:02

### now()

```select now() ;```

Result: 2023-09-02 13:24:30

### date_add()

```select * from callfunc.event ;```

<pre>
event_id   eclipse_datetime
--------   -------------------
374        2024-10-25 11:01:20
</pre>

```
select  eclipse_datetime,
        date_add(eclipse_datetime, interval 5 day)  as add_5_days,
        date_add(eclipse_datetime, interval 4 hour) as add_4_hours,
        date_add(eclipse_datetime, interval 2 week) as add_2_weeks
from    event
where   event_id = 374;
```

The units of time are singular. Commonly used intervals include second, minute, hour, day, week, month, and year.

<pre>
eclipse_datetime      add_5_days             add_4_hours           add_2_weeks
-------------------   -------------------   -------------------    -------------------
2024-10-25 11:01:20   2024-10-30 11:01:20   2024-10-25 15:01:20    2024-11-08 11:01:20
</pre>

### date_sub()

The date_sub() function subtracts a time interval from a date value.

```
select  eclipse_datetime,
        date_sub(eclipse_datetime, interval 5 day)  as sub_5_days,
        date_sub(eclipse_datetime, interval 4 hour) as sub_4_hours,
        date_sub(eclipse_datetime, interval 2 week) as sub_2_weeks
from    event
where   event_id = 374;
```

<pre>
eclipse_datetime      sub_5_days            sub_4_hours           sub_2_weeks
-------------------   -------------------   -------------------   -------------------
2024-10-25 11:01:20   2024-10-20 11:01:20   2024-10-25 07:01:20   2024-10-11 11:01:20
</pre>

### extract ()

```
select  eclipse_datetime,
        extract(year from eclipse_datetime)   as year,
        extract(month from eclipse_datetime)  as month,
        extract(day from eclipse_datetime)    as day,
        extract(week from eclipse_datetime)   as week,
        extract(second from eclipse_datetime) as second
from    event
where   event_id = 374;
```

<pre>
eclipse_datetime      year   month  day   week   second
-------------------   ----   -----  ---   ----   ------
2024-10-25 11:01:20   2024   10     25    42     20
</pre>

### year(), month(), day(), week(), second()

```
select  eclipse_datetime,
        year(eclipse_datetime)   as year,
        month(eclipse_datetime)  as month,
        day(eclipse_datetime)    as day,
        week(eclipse_datetime)   as week,
        second(eclipse_datetime) as second
from    event
where   event_id = 374;
```

<pre>
eclipse_datetime     year   month    day    week   second
-------------------  ----   -----    ---    ----   ------
2024-10-25 11:01:20  2024   10       25     42     20
</pre>

### date() and time()

```
select  eclipse_datetime,
        date(eclipse_datetime)   as date,
        time(eclipse_datetime)   as time
from    event
where   event_id = 374;
```

<pre>
eclipse_datetime      date         time
-------------------   ----------   --------
2024-10-25 11:01:20   2024-10-25   11:01:20
</pre>

### datediff()

Returns the difference in the number of days.

```
select datediff('2024-05-05', '2024-01-01');
```

Result: 125

### date_format()

```
select  date_format('2024-02-02 01:02:03', '%r') as format1,
        date_format('2024-02-02 01:02:03', '%m') as format2,
        date_format('2024-02-02 01:02:03', '%M') as format3,
        date_format('2024-02-02 01:02:03', '%Y') as format4,
        date_format('2024-02-02 01:02:03', '%y') as format5,
        date_format('2024-02-02 01:02:03', '%W, %M %D at %T') as format6;
```

<pre>
format1      format2   format3   format4   format5    format6
-----------  -------   --------  -------   -------    ---------------------------------
01:02:03 AM  02        February  2024      24          Friday, February 2nd at 01:02:03
</pre>

[DATE_FORMAT(date,format)](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format)

### str_to_date()

[STR_TO_DATE(str,format)](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_str-to-date)

### time_format()

#### [TIME_FORMAT(time,format)](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_time-format)

This is used like the DATE_FORMAT() function, but the format string may contain format specifiers only for hours, minutes, seconds, and microseconds. Other specifiers produce a NULL or 0. TIME_FORMAT() returns NULL if time or format is NULL.

```
select  time_format(curtime(), '%H:%i:%s')                            as format1,
        time_format(curtime(), '%h:%i %p')                            as format2,
        time_format(curtime(), '%l:%i %p')                            as format3,
        time_format(curtime(), '%H hours, %i minutes and %s seconds') as format4,
        time_format(curtime(), '%r')                                  as format5,
        time_format(curtime(), '%T')       
```

<pre>
format1   format2   format3   format4                              format5       time_format(curtime(), '%T')
--------  --------  -------   -----------------------------------  -----------   ----------------------------
13:52:07  01:52 PM  1:52 PM   13 hours, 52 minutes and 07 seconds  01:52:07 PM   13:52:07
</pre>

## Mathematical Operators and Functions

### Mathematical Operators

```
select  employee,
        salary - deduction,
        salary + bonus,
        salary * tax_rate,
        salary / 12,
        salary div 12
from    payroll;
```

<pre>
employee   salary - deduction  salary + bonus   salary * tax_rate   salary / 12   salary div 12
Max Bain    75000.00            90000.00        19200.0000          6666.666667   6666
Lola Joy    60000.00            60800.00        10800.0000          5000.000000   5000
Zoe Ball   108000.00           140000.00        38500.0000          9166.666667   9166
</pre>

div discards any fractional amount and / does not.

#### Modulo

```
select  winning_number,
        winning_number % 2
from    roulette_winning_number;
```

<pre>
winning_number   winning_number % 2
21               1
8                0
13               1

```
-- These queries all return the same value: winning_number mod 2
select winning_number % 2     from roulette_winning_number;
select winning_number mod 2   from roulette_winning_number;
select mod(winning_number, 2) from roulette_winning_number;
```
</pre>

### Operator Precedence

Use parentheses to tell MySQL to override the natural operator precedence.

```
select  employee, 
        salary,
        bonus,
        tax_rate,
        (salary + bonus) * tax_rate as tax_amount
from    payroll;
```

## Mathematical Functions

### abs()

```
select  guesser,
        guess,
        300          as actual,
        300 - guess  as difference
from    jelly_bean;
```

### ceiling()

```select ceiling(3.29);```

Result: 4

### floor()

select floor(3.29);

Result: 3

### pi()

select pi() ;

Result: 3.141593

### degrees()

select degrees(pi());

Result: 180

### radians()

select radians(180) ;

Result: 3.141592653589793

### exp()

The exp() function returns the natural logarithm base number e raised to the power of the number you provide as an argument.

select exp(2); 

Result: 7.38905609893065

### log()

The log() function returns the natural logarithm of the number you provide as an argument.

select log(2) ;

Result: 0.6931471805599453

### mod()

The mod() function is the modulo function.

select mod(11,3);

Result: 2

### pow()

The pow() function returns a number raised to a power.

select pow(5,3) ;

Result: 125

### round()

select round(9.87654321, 3);

Result: 9.877

select round(9.87654321);

Result: 10

### truncate()

select truncate(9.87654321, 3);

Result: 9.876

select truncate(9.87654321, 0);

Result: 9


### sin()

The sin() function returns the sine of a number given in radians.

select sin(0.5 * pi()) ;

Result: 1

### cos()

select cos(0.25 * pi()) ;

Result: 0.7071067811865476

### sqrt()

select sqrt(16) ;

Result: 4

### stddev_pop()

The stddev_pop() function returns the population standard deviation of the numbers provided.

select  stddev_pop(score)
from    test_score;

Data: 70, 82, 97
Result: 11.045361017187261

### tan()

The tan() function accepts an argument in radians and turns the tangent.

select tan(0.25 * pi()); 

Result: 0.9999999999999999

## Other Handy Functions

### cast()

```
select  order_datetime, cast(order_datetime as date) as order_date
from    online_order;
```

<pre>
order_datetime        order_date
-------------------   ----------
2024-12-08 11:39:09   2024-12-08
2024-12-10 10:11:14   2024-12-10
</pre>

### coalesce()

```select coalesce(null, null, 42, 12);```

Result: 42

```
select employee_name, coalesce(employer, 'Between Jobs')
from candidate ;
```

<pre>
employee_name   coalesce(employer, 'Between Jobs')
Jim Miller      Acme Corp
Laura Garcia    Globex
Jacob Davis     Between Jobs
</pre>

### distinct()

```
select country
from   customer;
```
<pre>
country
-------
India
USA
USA
USA
India
Peru
</pre>

```
select distinct(country)
from   customer;
```

<pre>
country
-------
India
USA
Peru
</pre>

```
-- This syntax returns the same result
select distinct country
from   customer;
```

<pre>
country
-------
India
USA
Peru

</pre>

```
select count(distinct country)
from   customer;
```

Result: 3

### database()

select database();

Result: callfunc

### if()

The if() function returns a different value depending upon whether a condition is true or false.

```
select  student_name,
        if(grade > 59, 'pass', 'fail')
from    test_result;
```

<pre>
student_name    if(grade > 59, 'pass', 'fail')
------------    ------------------------------
Lisa            pass
Bart            fail
Nelson          fail
</pre>

```
select  student_name,
case
  when grade < 30 then 'Please retake this exam'
  when grade < 60 then 'Better luck next time'
  else 'Good job'
end as advice
from test_result;
```

<pre>
student_name        advice
------------        ----------------------
Lisa                Good job
Bart                Better luck next time
Nelson              Please retake this exam
</pre>

### version()

```select version();```

Result: 8.0.34

# Chapter 9: Inserting, Updating and Deleting Data

## Inserting Data

```
insert into arena
    (
    arena_id,
    arena_name, 
    location, 
    seating_capacity
    )
values 
    (
    1,
    'Madison Square Garden',
    'New York',
    20000
    );

select * from arena;
```

<pre>arena_id  arena_name             location  seating_capacity
--------  ---------------------  --------  ----------------
1         Madison Square Garden  New York  20000</pre>

## Inserting Null Values

```
insert into arena
    (
    arena_id,
    arena_name, 
    location, 
    seating_capacity
    )
values 
    (
    2,
    'Dean Smith Center',
    'North Carolina',
    null
    );
```

```
-- Let's remove the row we just inserted and insert the same row in a different way
delete from arena where arena_id = 2;

-- This insert statement does the same thing.
-- If we don't list the seating_capacity at all, it will be set to null.
insert into arena
    (
    arena_id,
    arena_name, 
    location
    )
values 
    (
    2,
    'Dean Smith Center',
    'North Carolina'
    );
```

```
select  *
from    arena
where   arena_id = 2;
```

## Inserting Multiple Rows at Once

You can either insert one row at a time or insert them as a group.

```
insert into arena (arena_id, arena_name, location, seating_capacity)
values (3, 'Philippine Arena', 'Bocaue', 55000);

insert into arena (arena_id, arena_name, location, seating_capacity) 
values (4, 'Sportpaleis', 'Antwerp', 23359);

insert into arena (arena_id, arena_name, location, seating_capacity) 
values (5, 'Bell Centre', 'Montreal', 22114);
```

```
-- We could achieve the same results by combining them all in one insert statement:

-- First, let's remove the rows we just inserted and inserted them in a different way
delete from arena where arena_id in (3, 4, 5);

insert into arena (arena_id, arena_name, location, seating_capacity)
values (3, 'Philippine Arena', 'Bocaue', 55000),
       (4, 'Sportpaleis', 'Antwerp', 23359),
       (5, 'Bell Centre', 'Montreal', 22114);
```

## Inserting Without Listing Column Names

```
-- Inserting a row without listing column names  :-(
insert into arena 
values (6, 'Staples Center', 'Los Angeles', 19060);

select * from arena;
```

Although omitting column names saves you some typing, it's best practice to list them.

## Inserting Sequences of Numbers

The auto_increment column attribute is useful for a primary key column.

```
-- Let's drop and recreate the arena table and have the arena_id automatically increment
drop table arena;

create table arena (
    arena_id          int            primary key       auto_increment,
    arena_name        varchar(100),
    location          varchar(100),
    seating_capacity  int
);

-- Reloading the data without having to manage the arena_id column
insert into arena (arena_name, location, seating_capacity)
values ('Madison Square Garden', 'New York', 20000);

insert into arena (arena_name, location, seating_capacity)
values ('Dean Smith Center', 'North Carolina', null);

insert into arena (arena_name, location, seating_capacity)
values ('Philippine Arena', 'Bocaue', 55000);

insert into arena (arena_name, location, seating_capacity) 
values ('Sportpaleis', 'Antwerp', 23359);

insert into arena (arena_name, location, seating_capacity) 
values ('Bell Centre', 'Montreal', 22114);

insert into arena (arena_name, location, seating_capacity) 
values ('Staples Center', 'Los Angeles', 19060);

select * from arena;

```

## Inserting Data Using a Query

```
create table large_building
	(
	building_type      varchar(50),
	building_name      varchar(100),
	building_location  varchar(100),
	building_capacity  int,
	active_flag        bool
);

insert into large_building values ('Hotel', 'Wanda Inn', 			'Cape Cod', 125,	true);
insert into large_building values ('Arena', 'Yamada Green Dome', 	'Japan', 	20000,	true);
insert into large_building values ('Arena', 'Oracle Arena', 		'Oakland', 	19596,	true);

select  building_name,
        building_location,
        building_capacity
from    large_building
where   building_type = 'Arena'
and     active_flag is true;
```

```
-- Let's use the same query to insert into the arena table
insert into arena (
        arena_name, 
        location,
        seating_capacity
)
    select  building_name,
            building_location,
            building_capacity 
    from    large_building
    where   building_type = 'Arena'
    and     active_flag is true;
```

## Using a Query to Create and Populate a New Table

Note: The as keyword is optional.

```
-- Creating a table based on a query
create table new_arena as
    select  building_name,
            building_location,
            building_capacity 
    from    large_building
    where   building_type = 'Arena'
    and     active_flag is true;

select * from new_arena;

desc new_arena;
```

You can also use create table to make a copy of a table.

```
-- Making a copy of the arena table using today's date _(YYYYMMDD) as a suffix
create table arena_20241125  as 
    select * from arena;
```

## Updating Data

```
-- Here are three ways we could change Staples Center to Crypto.com Arena:
update  arena
set     arena_name = 'Crypto.com Arena'
where   arena_id = 6;

update  arena
set     arena_name = 'Crypto.com Arena'
where   arena_name = 'Staples Center';

update  arena
set     arena_name = 'Crypto.com Arena'
where   location = 'Los Angeles';
```

## Updating Multiple Rows

```
-- Set the seating_capacity for arenas with an ID of more than 3 to 20,000
update  arena
set     seating_capacity = 20000
where   arena_id > 3;
```

```
SET SQL_SAFE_UPDATES=0;
-- Set the seating_capacity for all arenas to 15,000
update  arena
set     seating_capacity = 15000;
```

## Updating Multiple Columns

```
-- Set the seating_capacity of arena 6 to 19,100
update  arena
set     arena_name = 'Crypto.com Arena',
        seating_capacity = 19100
where   arena_id = 6;
```

## Deleting Data

```
select * from arena;

delete from arena
where arena_id = 2;

select * from arena;
```

```
-- Delete all arenas that have the text "Arena" somewhere in their name

select * from arena;

delete from arena
where arena_name like '%Arena%';

select * from arena;
```

This statement removes all rows from the table.

```
delete from arena ;
```

## Truncating and Ropping a Table

```
truncate table arena ;
```

```
drop table arena ;
```

# Chapter 10: Creating Views

## Creating a New View

```
create view v_course_beginner as 
    select  *
    from    course
    where   course_level = 'beginner';

select * from v_course_beginner;
```

```
create view v_course_advanced as 
    select  *
    from    course
    where   course_level = 'advanced';

select * from v_course_advanced;
```

## Using Views to Hide Column Values

```
create view v_complaint as
select   a.company_name,
         a.owner,
         a.owner_phone_number,
         count(*)
from     company a
join     complaint b
on       a.company_id = b.company_id
group by a.company_name,
		 a.owner,
         a.owner_phone_number;
```

```
create view v_complaint_public as
select   a.company_name,
         count(*)
from     company a
join     complaint b
on       a.company_id = b.company_id
group by a.company_name;

select * from v_complaint_public;
```

## Inserting, Updating, and Deleting from Views

```
-- This update will work
update  v_course_beginner
set     course_name = 'Introduction to Python 3.1'
where   course_name = 'Introduction to Python';
```

```
-- This update will not work. 
update  v_complaint
set     owner_phone_number = '578-982-1277'
where   owner = 'Sam Shady';
-- Error Code: 1288. The target table v_complaint of the UPDATE is not updatable
```

## Dropping a View

```drop view v_course_advanced;```

## Indexes and Views

You can't add indexes to views to speed up your queries, but MySQL can use
any indexes on the underlying tables.

```
select *
from v_complaint
where company_name like 'CattyWampus%' ;
```

The above query can take advantage of an index on the company_name column of the company table,
since the v_complaint view is built on the company table.

# Chapter 11: Creating Functions and Procedures

## Functions vs. Procedures

The main difference between a function and a procedure is that a function gets
called from a SQL statement and always returns one value.

A procedure gets called explicitly using a call statement.

Procedures are often used to execute business logic by updating, inserting, and deleting 
records in tables, and thye can also be used to display a dataset from the database.

```
-- Call the f_get_state_population() function
select f_get_state_population('New York');
```

Result: 19299981

```
-- Call the f_get_state_population() function from a WHERE clause
select  *
from    state_population
where   population > f_get_state_population('New York');
```

<pre>
state       population
----------  ----------
Texas       29730311
California  39613493
Florida     21944577
</pre>