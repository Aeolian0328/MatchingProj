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
s_emastudentstudentil varchar(20) references student(s_email),/*학생 이메일*/
studentCount int(20),/*학생 수*/
subjectScore int(5),/* 평점(자동계산) */
confirmed boolean
);
