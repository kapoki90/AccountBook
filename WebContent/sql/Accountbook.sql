drop sequence Accountbook_idx_seq;
create sequence Accountbook_idx_seq;
drop table Accountbook;
create table Accountbook(
    idx NUMBER(5,0) primary key,
    wdate TIMESTAMP (6) DEFAULT sysdate, 
    income_expense varchar(30),
    amount NUMBER(20,0) ,
    currency varchar(30) ,
    kind varchar(30) ,
    memo varchar(30) ,
    card_or_cash varchar(30) ,
    id varchar(30) ,
    password varchar(30)
);
drop table AccountbookMemberInfo;
create table AccountbookMemberInfo(
    idx NUMBER(5,0) primary key,
    wdate TIMESTAMP (6) DEFAULT sysdate, 
    id varchar(30) ,
    password varchar(30)
);

  insert into Accountbook(idx,income_expense,amount,currency,kind,memo,card_or_cash,id,password) 
  values (Accountbook_idx_seq.nextval,'수입','1000','원(KRW)','식비','테스트코드','현금','lee','1234');

commit;
select * from Accountbook;
select * from Accountbook where amount is not null;