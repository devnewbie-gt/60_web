create table GUESTBOOK (
    IDX number primary key,
    NAME varchar2(30),
    SUBJECT varchar2(100),
    CONTENT varchar2(1000),
    EMAIL varchar2(100),
    PWD varchar2(30),
    REGDATE date default sysdate
);

create sequence GUESTBOOK_SEQ nocache;

insert into guestbook (idx, name, subject, content, email, pwd, regdate)
values (GUESTBOOK_SEQ.nextval, '홍길동', '제목1', '내용1', 'hong@test.com', '1111', sysdate-3);

insert into guestbook (idx, name, subject, content, email, pwd, regdate)
values (GUESTBOOK_SEQ.nextval, '홍이동', '제목2', '내용2', 'hong2@test.com', '2222', sysdate-2);

insert into guestbook (idx, name, subject, content, email, pwd, regdate)
values (GUESTBOOK_SEQ.nextval, '홍삼동', '제목3', '내용3', 'hong3@test.com', '3333', sysdate-1);

commit;