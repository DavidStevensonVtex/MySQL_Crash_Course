create table job
(
    job_id      int,
    job_desc    varchar(100),
    shift       varchar(50) default '9-5',
    primary key(job_id)
);