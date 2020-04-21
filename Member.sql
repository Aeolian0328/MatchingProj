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

insert into student values(0,"asd","asd","a@a","010-1111-1111","student");
insert into student values(0,"qwe","qwe","q@q","010-1111-1111","student");
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
create table subject(
subjectImage varchar(100),/*과목 소개 이미지 저장(경로)*/
subjectNum int(30) auto_increment, /*과목번호(자동생성)*/
subjectName varchar(20),/*과목 명*/
startTime varchar(20),/*개강 날짜 */
endTime varchar(20),/*종강 날짜 */
content varchar(100),/*과목 개요*/
cost int(20),/*수강비*/
subjecttag varchar(20),/*분류*/
t_email varchar(20) references teacher(t_email),/*선생님 이메일*/
s_email varchar(20) references student(s_email),/*학생 이메일*/
studentCount int(20),/*학생 수*/
subjectScore int(5),/* 평점(자동계산) */
confirmed int default 0
);

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

