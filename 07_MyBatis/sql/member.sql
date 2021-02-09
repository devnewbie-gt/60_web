create table member (
    IDX number(5) primary key,
    ID varchar2(10) unique,
    PWD varchar2(10),
    NAME varchar2(30),
    AGE number(3),
    ADDRESS varchar2(150),
    REG date
);

create sequence MEMBER_SEQ;

insert into member (idx, id, pwd, name, age, address, reg)
values(member_seq.nextval, 'admin', 'admin', '관리자', null, null, sysdate);

insert into member (idx, id, pwd, name, age, address, reg)
values(member_seq.nextval, 'test1', 'test1', '홍길동', 27, '서울', sysdate);

commit;