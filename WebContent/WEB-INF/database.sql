
create table btore(id number(5) primary key,title varchar2(50) not null,author varchar2(50) not null, price number(5));

create sequence bookdt_id_seq start with 1 nocache;

insert into btore values(bookdt_id_seq.nextval,'python','john',1000);

commit;
