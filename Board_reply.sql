use matching;
drop table board;
create table board(
code int(20) auto_increment primary key,
title varchar(100),
content varchar(500),
writer varchar(20),
email varchar(30),
password varchar(30) default null,
reg_datetime timestamp default now(),
viewcnt int default 0
);

select * from board;

drop table reply;
create table reply(
rno int(10) auto_increment primary key,
code int(10),
replytext varchar(500),
replyer varchar(500),
reg_datetime Timestamp default now(),
reg_updatetime Timestamp default now()
);

insert into reply(code,replytext,replyer) values (1,"추가적으로 물어보고 싶은것은","첫쓴이");
insert into reply(code,replytext,replyer) values (1,"어떻게 해야될지 모르겠어요","첫쓴이");
insert into reply(code,replytext,replyer) values (2,"계좌이체로 하는거 맞나요?","들쓴이");
insert into reply(code,replytext,replyer) values (2,"카드결제 안되는곳이 세상에 어디있습니까","hello작성자2");
insert into reply(code,replytext,replyer) values (2,"야 댓글 나오냐","셋쓴이");
insert into reply(code,replytext,replyer) values (2,"나온다","넷쓴이");
select * from reply;
