--alter session set container=orclpdb
--alter session set container=xepdb1

create user hr identified by hr;
grant create session to hr;
grant create table,create view,create type to hr; 
grant create procedure to hr;
grant create synonym, create trigger to hr;
grant unlimited tablespace to hr;