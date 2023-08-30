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