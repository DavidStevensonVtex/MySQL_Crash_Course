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