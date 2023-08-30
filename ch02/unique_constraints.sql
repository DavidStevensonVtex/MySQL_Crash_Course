create table contact
(
    contact_id      int,
    name            varchar(50) not null,
    city            varchar(50),
    phone           varchar(20),
    email_address   varchar(50)     unique,
    primary key (contact_id)
);