use matching;

drop table subject;
create table subject(
subjectNum int(30) auto_increment primary key, /*과목번호(자동생성)*/
subjectName varchar(20),/*과목 명*/
startTime varchar(30),/*개강 날짜 */
endTime varchar(30),/*종강 날짜 */
content varchar(100),/*과목 개요*/
subjectImage varchar(100),/*과목 소개 이미지 저장(경로)*/
cost int(20),/*수강비*/
subjecttag varchar(20),/*분류*/
t_email varchar(20) references teacher(t_email),/*선생님 이메일*/
s_email varchar(20) references student(s_email),/*학생 이메일*/
studentCount int(20),/*학생 수*/
subjectScore int(5),/* 평점(자동계산) */
confirmed int(4) default 0
);

desc subject;

insert into subject values(1,"자바",'2020-04-01','2020-04-15 21:00:00','자바는 객체 지향 언어이다 누구나 쉽게 배울 수 있다.','java_language.jpg',50000,'컴퓨터','','',0,80,0);
insert into subject values(2,"C언어",'2020-04-02','2020-04-16 21:00:00','C언어는 코딩의 기초이다 누구나 쉽게 배울 수 있다.','c_language.jpg',30000,'컴퓨터','','',0,55,0);
insert into subject values(3,"Spring",'2020-04-02','2020-04-16 21:00:00','Spring언어는 개발의 기초이다 누구나 쉽게 배울 수 있다.','spring_language.jpg',80000,'컴퓨터','','',0,75,0);
insert into subject values(4,"Android",'2020-05-02','2020-05-22 19:00:00','Android 개발자 양성 누구나 쉽게 배울 수 있다.','android_language.jpg',20000,'컴퓨터','','',0,70,0);
insert into subject values(5,"IoT",'2020-06-02','2020-05-23 18:00:00','사물인터넷 배워보세요 누구나 쉽게 배울 수 있다.','iot_language.jpg',25000,'컴퓨터','','',0,65,0);
insert into subject values(6,"Unity",'2020-07-02','2020-05-24 16:00:00','게임 좋아하는 누구나 오세요.','unity_language.jpg',10000,'컴퓨터','','',0,95,0);

select * from subject where confirmed = 1;

insert into subject(subjectName,subjecttag) values('JAVA','컴퓨터');
insert into subject(subjectName,subjecttag) values('파이썬','컴퓨터');
insert into subject(subjectName,subjecttag) values('힙합','노래');
insert into subject(subjectName,subjecttag) values('방송댄스','노래');
insert into subject(subjectName,subjecttag) values('C#','컴퓨터');
insert into subject(subjectName,subjecttag) values('C++','컴퓨터');
insert into subject(subjectName,subjecttag) values('강좌1','강좌');
insert into subject(subjectName,subjecttag) values('강좌2','강좌');
insert into subject(subjectName,subjecttag) values('강좌3','강좌');
insert into subject(subjectName,subjecttag) values('강좌4','강좌');
insert into subject(subjectName,subjecttag) values('강좌5','강좌');