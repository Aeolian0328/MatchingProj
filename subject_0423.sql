drop table subject;
select * from subject;

use matching;


create table subject(
subjectNum int(30) auto_increment primary key, /*과목번호(자동생성)*/
subjectName varchar(20),/*과목 명*/
startTime varchar(30),/*개강 날짜 */
endTime varchar(30),/*종강 날짜 */
content varchar(1000),/*과목 개요*/
subjectImage varchar(1000),/*과목 소개 이미지 저장(경로)*/
cost int(20),/*수강비*/
subjecttag varchar(20),/*분류*/
t_email varchar(20) references teacher(t_email),/*선생님 이메일*/
s_email varchar(20) references student(s_email),/*학생 이메일*/
studentCount int(20),/*학생 수*/
subjectScore int(5),/* 평점(자동계산) */
confirmed int(5) default 0, /*default 주의*/
age int(5) /*default 주의*/
);







/*컴퓨터 과목 예시*/
insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed) 
values("자바",'2020-04-24 00:00:00','2020-04-27 23:00:00','객체지향 프로그래밍의 기본적인 프로그래밍 능력을 키워, GUI 프로그래밍, 제네릭과 컬렉션, 쓰레드, 입출
력과 네트워크, 데이터베이스 등 자바의 고급 프로그래밍 기법을 익히고, 다양한 응용 프로그래밍을 실습하여, 초급 자바프로그래머로서의 능력을 배양시킨다.','java_language.jpg',20000,'컴퓨터','','',0,80,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed) 
values("C언어",'2020-04-24 00:00:00','2020-04-28 23:00:00','본 교과목에서는 현대 컴퓨터 분야의 가장 기본 프로그래밍이라 할 수 있는 C언어
에 대해 이론을 학습한다. 실습시간에는 선수 학습된 내용을 실제로 실습해 봄으로써, 이해력을 높인다. 또한 강의 내용을 심도 있게 응용할 수 있는 프로그래밍 과제가 주어진다. ','c_language.jpg',25000,'컴퓨터','','',0,55,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed) 
values("Spring",'2020-04-24 00:00:00','2020-04-28 23:00:00','스프링 프레임워크(이하 스프링) 5.1 버전이 출시 되었습니다. 버전이 올라갈 수록 스프링은 다양한 프로그래밍 기법과 기능을 제공하지만 스프링의 핵심 기술은 크게 변하지 않았습니다.
즉, IoC 컨테이너, AOP 그리고 몇몇 핵심 API는 스프링을 탄탄하게 지탱하는 디딤돌과 같습니다. 따라서 스프링 핵심 기술을 이해한다면, 스프링이 제공하는 JDBC, 테스트, MVC 관련 기능 뿐 아니라, 스프링 부트와 스프링 데이터 JPA와 같은 여러 다른 스프링 프로젝트도 빠르고 정확히 이해할 수 있습니다.
구체적으로 이번 강좌에서는 스프링 IoC(Inversion of Control) 컨테이너와 빈 그리고 스프링 AOP (Aspect Oriented Programming)에 대해 자세히 학습합니다. 또한, 스프링이 제공하는 여러 기능의 기반이 되는 Resource, Validation, 데이터 바인딩과 같은 스프링의 여러 추상 API와 Null 관련 유틸리티도 학습합니다.
이번 강좌는 IoC, AOP, PSA에 대해 들어는 봤지만, 실제 스프링으로 코딩을 해본적이 없는 분들 또는 핵심 기술에 대한 이해 없이 MVC로 웹 애플리케이션 개발만 해온 개발자 또는 학생을 대상으로 합니다. 따라서 소개와 이해를 중심으로 설명할 뿐 매우 깊이있게 다루진 않습니다. 심화 학습을 하고 싶으신 분들께는 이번 강좌를 추천하지 않습니다.
이번 강좌는 스프링 부트를 사용하며 스프링 핵심 기술을 학습합니다 따라서 스프링 부트 기반의 프로젝트를 사용하고 있는 개발자 또는 학생에게 유용한 스프링 강좌입니다. 스프링 부트가 제공하는 여러 기능이 스프링의 핵심 기술과 어떻게 관련이 있는지 이해할 수 있을 것입니다. 감사합니다.
','spring_language.jpg',80000,'컴퓨터','','',0,75,1);


insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed) 
values("Android",'2020-04-24 00:00:00','2020-04-29 23:00:00','모바일환경이 극대화됨에 따라 기존의 폐쇄적인 통신환경에서 벗어나, 열린 개발 환경을 제공하게
되었다. 이에 혁신적인 모바일용 애플리케이션인 안드로이드 기반의 모바일 어플리케이션 개발 환
경을 이해하고 다양한 실습을 통해 개발하는 방법을 익히도록 한다. 구글 안드로이드 플랫폼 환경
하에서 사용되는 자바 언어의 기본 문법을 숙지하여 앱 개발을 위한 프로그래밍 스킬을 키우도록
하며 응용 개발을 위한 핵심 구성 요소들을 학습하기도 한다.
 안드로이드 사용자 인터페이스 화면 구성요소인 뷰, 위젯, 레이아웃, 2D, 3D 그래픽을 활용하
여 애플리케이션을 개발 수 있도록 한다. 또한 학습한 내용을 기반으로 창의적인 앱 개발 능력을
배양하는 것을 목표로 한다. 수업 진행 중 본인의 모바일 앱 프로젝트 완성을 병행하면서 최신의
트랜드, 응용력과 창의력, 협동력을 발취하며 성취동기와 포트폴리오를 완성한다. ','android_language.jpg',20000,'컴퓨터','','',0,70,1);


insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed) 
values("IoT",'2020-04-24 00:00:00','2020-04-30 23:00:00','IoT 의 개념에 대해 발전과정 / 현재 적용 사례 / 미래의 IoT를 사업의 측면이 아니라 사용자 관점에서 분석하고 사용자 관점에서 바라보는 교육입니다.  IoT를 구현하는 3대 기반 기술은 센싱기술, 유무선 통신 및 네트워크 통신기술, IoT 서비스 인터페이스 기술입니다. 미래 산업을 지배하는 분야는 사물인터넷, 스마트 카, 인공지능 분야일 것이다. 4차 산업혁명을 이끌어 나가는 힘은 소프트웨어에서 나온다. 
본 사물인터넷 임베디드 실습과정은 사물인터넷 제품을 개발하는 전체적인 과정을 배우게 된다. 사물인터넷 제품의 기획, 설계, 개발, 소프트웨어 구현, 웹 서비스, 모바일 앱 서비스에 이르는 과정을 대표적인 오픈소스 하드웨어인 라즈베리파이를 사용해서 구현하는 방법을 실습한다. 
','iot_language.jpg',25000,'컴퓨터','','',0,65,1);


insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("Unity",'2020-04-27 00:00:00','2020-05-01 23:00:00','모듈식으로 구성되어 있으므로 ULS 요소를 기존 커리큘럼에 통합하는 일이 정말로 간단합니다. 또는 ULS 리소스만을 사용하여 전체 프로그램을 빌드할 수도 있습니다.
당사에서는 동남아시아, 인도 및 오세아니아 지역에 현장 지원을 제공하여 여러분이 선택한 목적에 부합하는 커리큘럼을 설정하고 이를 이용해 교육 프로그램을 제공할 수 있도록 도와드립니다.','unity_language.jpg',10000,'컴퓨터','','',0,95,1);

/*음악 과목 예시*/
insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("한국음악",'2020-04-24 00:00:00','2020-04-27 23:00:00','  
한국음악의 이해’ 교과목은 한국음악의 역사적 배경 및 분류, 국악기의 종류, 연주 양식, 음계, 선율법, 리듬 등 기초적인
 국악이론을 배우고 실제 감상을 통하여 서양음악과 상이한 우리나라 전통음악의 미를 이해하는 과목이다.
고대 반구대 암각화부터 고구려고분벽화, 김홍도, 신윤복의 풍속화, 궁중의 반차도, 진찬도에 이르기까지 그림 속에는
삶의 모습과 더불어 음악의 흔적이 남겨져 있다.
‘한국음악의 이해’는 오프라인강좌인 ‘그림으로 듣는 한국음악’속에 담긴 통해 당시의 생생한 모습을 살펴보며, 그 상황
에서 울려 퍼졌을 음악을 유추하고 함께 다루는 수업이다.
이 강의는 고대 음악부터 조선 시대까지 형성된 한국전통음악을 중심으로 진행된다. 하지만 그 시대에 머무는 음악만을
이야기하는 것이 아니라, 그때 형성된 소중한 우리 음악이 지금 어떻게 이어지고 있는지에 대한 이야기도 함께 하고자
한다. 따라서 이 강의는 우리 음악의 역사와 가치, 특징을 살펴보고 더불어 우리 음악의 현재 모습과 향후 방향성을 고민
해보는','한국음악.jpg',23000,'음악','','',0,95,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("서양음악",'2020-04-24 00:00:00','2020-04-28 23:00:00','  
본 교과목에서는 현재까지 전 세계적으로 사랑받아 클래식이라 불리는 서양음악을 중심으로 소개한다. 고대부터 낭만주의까지 음악의 큰 흐름을 이해하기 위해 매 강의별로 각 시대에 가장 꽃을 피웠던 장르를 중심으로 하여 그 장르의 대표작들을 골라 감상해 본다. 또한 감상의 이해를 돕기위해 작품의 배경이 된 시대의 사회상과 작곡가의 작곡 의도를 재미있는 에피소드와 영화 감상을 통해 조명해본다. 
본 교과목을 통해 음악을 이해하고 즐길수 있는 자신감을 가져보면어떨까?','서양음악.jpg',23000,'음악','','',0,74,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("k-pop댄스",'2020-04-24 00:00:00','2020-04-29 23:00:00','  
스트레칭과 근력운동으로 균형 잡힌 신체발달과 조별로 작품을 완성해보는 단계에서 창의력과 자신감을 향상시킬 수 있다.','k-pop댄스.jpg',15000,'음악','','',0,80,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("뮤지컬산업",'2020-04-24 00:00:00','2020-04-30 23:00:00','  
연극, 뮤지컬의 창작과정을 이해하고, 학생 개개인의 목표에 따라 공연예술예서, 또는 공연예술을 통해서 자신이 할 수 있는 일이 무엇일까 모색해보고, 탐구하는데 디딤돌을 놓는다.','뮤지컬산업.jpg',18000,'음악','','',0,100,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("성악의이해",'2020-04-24 00:00:00','2020-04-30 23:00:00','  
성악 발성의 기초적인 발성을 이해하고 직접 실습해본다.','성악.jpg',10000,'음악','','',0,65,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("작곡의 이해",'2020-04-26 00:00:00','2020-04-30 23:00:00','자신이 직접 프로듀싱을 하여 음악적 컨셉을 표현하고자 다른사람이 만들어진 곡들이나 또는 직접 작곡 편곡된 음악들을 가지고 효과적
인 표현에 필요한 프로듀싱에 관한 전반적인 내용들에 관하여 연구하여 본다. 연주자들에 관한 성향 파악과 연주 스타일에 관한 지식, 만들어진 음악의 분석과 이해, 구성의 변화를 통한 결과물에 관한 피드백 등을 가
지고 효율적인 연주기법을 이루도록 한다.','작곡.jpg',30000,'음악','','',0,80,1);

/*취미 과목 예시*/

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("축구",'2020-04-24 00:00:00','2020-04-30 23:00:00','2002년 한일월드컵 공동개최에 따른 축구에 대한 관심증대와 여가활동으로 축구활동이 활발해지고 있다. 따
라서 본 수업의 목표로서 크게는 축구를 통한 신체 활동을 통하여 학생 개개인의 움직임 욕구를 실현하고, 운
동을 수행하는 데에 필요한 기능과 체력을 증진하며, 축구를 통한 운동과 건강에 관한 지식을 이해하고, 사회
적으로 바람직한 태도를 함양하는데 본 교과목의 목적이 있다.','축구.jpg',5000,'취미','','',0,100,1);

insert into subject(subjectName,startTime,endTime,content,subjectImage,cost,subjecttag,t_email,s_email,studentCount,subjectScore,confirmed)
 values("테니스",'2020-04-24 00:00:00','2020-04-30 23:00:00','본 강의의 목적은 테니스의 기본 기술, 경기규칙 및 경기운영, 심판법 등을 학습하여 테니스에 대한 전체적인 안목을 형성하고 테니스를 통한 건전한 여가활동이 가능하도록 하는데 그 목적이 있다. 
 평생스포츠로써 테니스를 즐기기 위해 기본기술인 스트로크를 학습하는 것이 목표이다.
 테니스에 필요한 기초 체력을 향상하고 테니스를 통해 서로를 존중하고 배려하는 페어플레이를 함양할 수 있도록 한다.','테니스.jpg',15000,'취미','','',0,90,1);

/*그래프 1월 예시*/
insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("자바",'2020-01-13 00:00:00','2020-01-20 21:00:00',30000,'컴퓨터',40,90,22);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("C언어",'2020-01-15 00:00:00','2020-01-20 21:00:00',20000,'컴퓨터',32,100,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("파이썬",'2020-01-15 00:00:00','2020-01-20 21:00:00',10000,'컴퓨터',31,60,22);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("서양음악",'2020-01-20 00:00:00','2020-01-26 21:00:00',30000,'음악',20,88,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("대중음악의 이해",'2020-01-20 00:00:00','2020-01-26 21:00:00',20000,'음악',10,70,22);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("쉽게 배우는 작사 작곡",'2020-01-20 00:00:00','2020-01-26 21:00:00',10000,'음악',17,50,44);
  insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("미식축구",'2020-01-30 00:00:00','2020-02-05 21:00:00',15000,'취미',30,88,44);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("수상스키",'2020-01-30 00:00:00','2020-02-05 21:00:00',60000,'취미',37,70,44);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("삶의 리듬과 균형",'2020-01-30 00:00:00','2020-02-05 21:00:00',45000,'취미',27,50,22);


 
 
 
 /*그래프 2월 예시*/
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("C++",'2020-02-15 00:00:00','2020-02-20 21:00:00',10000,'컴퓨터',14,40,23);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("C#",'2020-02-20 00:00:00','2020-02-25 21:00:00',32000,'컴퓨터',16,90,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("C+",'2020-02-20 00:00:00','2020-02-25 21:00:00',20000,'컴퓨터',8,50,33);
  insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("서양음악",'2020-021-20 00:00:00','2020-02-26 21:00:00',14000,'음악',30,88,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("대중음악의 이해",'2020-02-20 00:00:00','2020-02-26 21:00:00',22000,'음악',20,70,23);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("쉽게 배우는 작사 작곡",'2020-02-20 00:00:00','2020-02-26 21:00:00',33000,'음악',10,50,44);
  insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("미식축구",'2020-02-30 00:00:00','2020-03-05 21:00:00',15000,'취미',33,88,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("수상스키",'2020-02-30 00:00:00','2020-03-05 21:00:00',24000,'취미',34,70,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("삶의 리듬과 균형",'2020-02-30 00:00:00','2020-03-05 21:00:00',22000,'취미',20,50,23);
 
 /*그래프 3월 예시*/
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("Ajax",'2020-03-20 00:00:00','2020-03-25 21:00:00',11000,'컴퓨터',27,70,34);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("Mysql",'2020-03-25 00:00:00','2020-03-30 21:00:00',15000,'컴퓨터',14,90,44);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("Mssql",'2020-03-25 00:00:00','2020-03-30 21:00:00',40000,'컴퓨터',28,60,34);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("Firebase",'2020-03-25 00:00:00','2020-03-30 21:00:00',13000,'컴퓨터',10,40,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("서양음악",'2020-03-20 00:00:00','2020-03-26 21:00:00',24000,'음악',11,88,22);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("콘서트의 기본",'2020-03-20 00:00:00','2020-03-26 21:00:00',35000,'음악',20,70,26);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("음악이란 무엇인가",'2020-03-20 00:00:00','2020-03-26 21:00:00',14000,'음악',30,50,26);
  insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("지상낙원",'2020-03-30 00:00:00','2020-04-05 21:00:00',35000,'취미',8,88,33);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("야구",'2020-03-30 00:00:00','2020-04-05 21:00:00',60000,'취미',16,70,22);
 insert into subject(subjectName,startTime,endTime,cost,subjecttag,studentCount,subjectScore,age)
 values("탁구",'2020-03-30 00:00:00','2020-04-05 21:00:00',45000,'취미',14,50,22);