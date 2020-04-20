use matching;

create table graph(
month varchar(20),
subject varchar(20),
count int(20),
nu_count int(20)
);

drop table graph;

insert into graph values("2020.03","JAVA",0,30);
insert into graph values("2020.03","C언어",2,20);
insert into graph values("2020.03","파이썬",6,10);
insert into graph values("2020.03","힙합",8,15);
insert into graph values("2020.03","방송댄스",10,16);
insert into graph values("2020.03","강좌1",0,150);
insert into graph values("2020.03","강좌2",30,170);
insert into graph values("2020.03","강좌3",40,300);
insert into graph values("2020.03","강좌4",65,140);
insert into graph values("2020.03","강좌5",77,300);

insert into graph values("2020.02","JAVA",0,80);
insert into graph values("2020.02","C#",20,160);
insert into graph values("2020.02","C++",60,500);
insert into graph values("2020.02","힙합",80,300);
insert into graph values("2020.02","방송댄스",100,250);
insert into graph values("2020.02","강좌1",0,300);
insert into graph values("2020.02","강좌2",30,150);
insert into graph values("2020.02","강좌3",40,240);
insert into graph values("2020.02","강좌4",65,170);
insert into graph values("2020.02","강좌5",77,90);


insert into graph values("2020.01","강좌1",0,80);
insert into graph values("2020.01","강좌2",30,450);
insert into graph values("2020.01","강좌3",40,490);
insert into graph values("2020.01","강좌4",65,200);
insert into graph values("2020.01","강좌5",77,150);

insert into graph values("2019.12","강좌1",0,200);
insert into graph values("2019.12","강좌2",30,100);
insert into graph values("2019.12","강좌3",40,200);
insert into graph values("2019.12","강좌4",65,100);
insert into graph values("2019.12","강좌5",77,300);