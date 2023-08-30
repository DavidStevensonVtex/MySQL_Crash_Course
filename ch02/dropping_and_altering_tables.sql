drop table product ;

alter table customer add column zip varchar(50);
alter table customer drop column address ;
alter table customer rename column zip to zip_code ;
alter table customer rename to valued_customer ;