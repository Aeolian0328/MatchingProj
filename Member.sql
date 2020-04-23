create database matching;
use matching;

drop table student;
create table student(
s_num int(30) auto_increment primary key,
name varchar(10),
password varchar(20),
s_email varchar(20) unique,
s_phone varchar(20),
s_tag varchar(20)
);

insert into student(name, password, s_email, s_phone, s_tag) values(0,"asd","asd","a@a","010-1111-1111","JAVA , C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values(0,"qwe","qwe","q@q","010-1111-1111","C");
insert into student(name, password, s_email, s_phone, s_tag) values("따라란","1234","adsw@asdw.com","010-1234-1112","JAVA , C");
insert into student(name, password, s_email, s_phone, s_tag) values("홍길동","1234","nbkw@aqwe.com","010-4745-7983","C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("김미역","1234","aaxc@asdw.com","010-4258-7257","JAVA , C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("다시다","1234","vfde@asdw.com","010-7952-1398","JAVA ,PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("김계란","1234","qewf@asdw.com","010-1164-4478","JAVA , C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("화라랄","1234","alskdr@asdw.com","010-7985-1548","PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("아이고","1234","xnmfm123@asdw.com","010-1478-7692","JAVA , C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("엑스트라1","1234","kkkoe@asdw.com","010-9786-1645","JAVA , C , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("으아아","1234","zmzmd@asdw.com","010-2466-1945","JAVA , PYTHON");
insert into student(name, password, s_email, s_phone, s_tag) values("크아악","1234","final@asdw.com","010-7963-3757","JAVA , C");

insert into student(name,password,s_email,s_tag) values("관리자","admin","admin@admin","adminisatrator");
select * from student;
delete from student where name = '관리자';

drop table teacher;
create table teacher(
t_num int(30) auto_increment primary key,
name varchar(10),
password varchar(20),
t_email varchar(20) unique,
t_phone varchar(20)
);

insert into teacher(name,password,t_email) values("관리자","admin","admin@admin");

select * from teacher;


create table photo_name(
photo varchar(30) primary key,
photo_name varchar(20)
);

use matching;
select * from student;
select * from teacher;
select * from photo_name;

insert into photo_name values('0','0');

desc student;

alter table student add photo varchar(30) default '0'; 
alter table teacher add photo varchar(30) default '0';

alter table student add foreign key (photo) references photo_name(photo);
alter table teacher add foreign key (photo) references photo_name(photo);
insert into student()

