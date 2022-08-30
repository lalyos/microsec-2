create table vip (name varchar(20), money int);
insert into vip values ('vladimir', 300);
insert into vip values ('lorinc', 400);
insert into vip values ('feri', 200);
insert into vip values ('angela', 250);

--  docker exec mydb psql -U postgres postgres -c 'select * from vip;'