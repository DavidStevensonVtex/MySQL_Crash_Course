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