select user(),database();



-- 현서 --------------------------------------------------------------------------------------------
-- 사원
desc employee;
select * from employee;
select * from employee where empretired=0 order by empno desc  limit 3, 3;
select * from employee where empno like concat('%','1','%') and empretired =0;
delete from employee where empid = 'apple';
insert into employee values (6,'장우주','1987-01-01','010-4444-4321','대구 광역시 달서구',0,'employee4',password('employee'),1);
desc user;
select * from `user` u ;
delete from `user` where userno = 7;
insert into user values (6,'도라지','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer5',password('customer'),1);
select * from rentcar r order by no desc ;
select * from rentcar r where ldiv =0  order by no desc ;
-- 렌트카
select count(no) from rentcar r ;
select * from rentcar where rentddate=  '2020-04-01' between  returndate  = '2020-04-05';
select * from rentcar where rentddate =  '2020-04-01' and returndate  = '2020-04-05';
-- 배너
select * from banner b2 ;
select * from banner order by no desc limit 1, 3;
delete from banner where no in(1,3,4,5,6,7,8,9,10,11);

select  count(no) from banner ;

-- 팝업
select  * from popup;
delete from popup where position in ('R','L');
-- 이벤트
select * from event order by no desc;
-- 다가올 이벤트
select * from event where startdate > now() ;
-- 진행중인 이벤트
select * from event where startdate <= now() and enddate >= now();
-- 종료된 이벤트
select * from event where enddate < now() ;
delete from event ;

insert into event (no,title,content,pic,startdate,enddate ) values
(6,	'이벤트1','이벤트1','/2020/05/13/89d3198a-d27f-4a83-8a80-48b4e4c8e714_ddddd.jpg','2020-05-10','2020-06-19'),
(7,	'이벤트2','이벤트2','/2020/05/13/a6a92948-ea66-46a6-8236-6b6120191d2f_주석_2020-05-04_144946.jpg','2020-05-10','2020-06-19'),
(8,	'이벤트3','이벤트3','/2020/05/13/055bc95a-75b2-4489-96bc-5afc2285cd1e_dafadfasdf.jpg','2020-05-10','2020-06-19');

-- 고객의 소리
insert into custboard values
(1,'홈페이지 이용이 너무 어려워요','좀더 편했으면 좋겠음','장초코',now(),password(111)),
(2,'상품이 다양하면 좋겠어요','좀더 많았으면..','장도롱',now(),password(111)),
(3,'차은우 가이드님 칭찬합니다','존잘!!','박열무',now(),password(111));
select * from custboard ;
desc custboard ;
delete from custboard where no = 3;
select * from custboard order by no desc limit 1, 3;



-- 인선 --------------------------------------------------------------------------------------------
select count(no) from faq where title like concat('%','쿠폰','%');
select * from faq where lcate = 'D' and mcate = 'J' and title like concat ('%','제주','%') order by no desc limit 1,10;
desc tour;
select * from tour where no = 3001 order by no desc;
delete from tour;
desc airplane;
select p.pno,p.pname,p.pcontent,p.pexpire,p.pprice,p.ppic,p.pdiv,
	   a2.no,a2.ano,a2.dlocation,a2.rlocation,a2.ddate,a2.rdate,a2.ldiv,a2.capacity,a2.seat,a2.price,a2.pdiv, 
	   h2.no,h2.hname,h2.haddr,h2.checkin,h2.checkout,h2.capacity,h2.price,h2.roomcapacity,h2.roomtype,h2.ldiv,h2.bookedup,h2.pdiv,
	   t2.no,t2.tname,t2.tlocation,t2.startdate,t2.enddate,t2.taddr,t2.etime,t2.capacity,t2.tprice,t2.ldiv,t2.pdiv,
	   r2.no,r2.cdiv,r2.cno,r2.rentddate,r2.returndate,r2.rentaddr,r2.returnaddr,r2.price,r2.capacity,r2.insurance,r2.ldiv,r2.pdiv 
	from (select * from product order by pno desc limit 0,10) p join pairstatus a on p.pno = a.pno join airplane a2 on a.ano = a2.no
							 	join photelstatus h on p.pno = h.pno join hotel h2 on h.hno = h2.no
							 	join ptourstatus t on p.pno = t.pno join tour t2 on t.tno = t2.no
							 	join prentstatus r on p.pno = r.pno join rentcar r2 on r.rno = r2.no;
							 
select p.pno,p.pname,p.pcontent,p.pexpire,p.pprice,p.ppic,p.pdiv,
	    a2.no as a2no,a2.ano,a2.dlocation,a2.rlocation,a2.ddate,a2.rdate,a2.ldiv,a2.capacity,a2.seat,a2.price,a2.pdiv, 
	    h2.no as h2no,h2.hname,h2.haddr,h2.checkin,h2.checkout,h2.capacity,h2.price,h2.roomtype,h2.roomcapacity,h2.ldiv,h2.bookedup,h2.pdiv,
	    t2.no as t2no,t2.tname,t2.tlocation,t2.startdate,t2.enddate,t2.taddr,t2.etime,t2.capacity,t2.tprice,t2.ldiv,t2.pdiv,
	    r2.no as r2no,r2.cdiv,r2.cno,r2.rentddate,r2.returndate,r2.rentaddr,r2.returnaddr,r2.price,r2.capacity,r2.insurance,r2.ldiv,r2.pdiv 
		from product p join pairstatus a on p.pno = a.pno join airplane a2 on a.ano = a2.no
					   join photelstatus h on p.pno = h.pno join hotel h2 on h.hno = h2.no
					   join ptourstatus t on p.pno = t.pno join tour t2 on t.tno = t2.no
					   join prentstatus r on p.pno = r.pno join rentcar r2 on r.rno = r2.no
		where p.pno = 2;

INSERT INTO tour.product
(pno, pname, pcontent, pexpire, pprice, ppic, pdiv)
VALUES(1, '[제주 3일]시크릿 특가!제주시내/한라산 대한항공 바로출발!', '<h1><strong>상품 세부 설명</strong></h1>

<h2>숙소(Hidden Cliff)</h2>

<p><img alt="" src="http://localhost:8080/tourland/resources/images/jeju/hotel/suite.jpg" style="height:570px; width:1000px" /></p>

<h3>180만년 동안 제주가 한 번도 드러내지 않았던 그 자리에 제주의 하늘, 구름, 초원, 절벽, 바다, 땅을 담은 히든 클리프 호텔이 들어섰습니다&nbsp;</h3>

<p>&nbsp;</p>

<h2>한라산</h2>

<h3>백록담 정상을 제외하고는 대부분 숲으로 형성되어 있어 삼림욕을 즐기며 탐방하기에 최적의 장소이다. 탐방로에서 보이는 오름군락은 화산섬의 신비감을 그대로 전달해준다. 한라산 자생지인 구상나무 숲이 가장 넓게 형성된 곳이며 한라장구채 큰오색딱따구리 오소리 노루 등의 한라산 동&middot;식물을 관찰할 수 있다.</h3>

<p><img alt="" src="http://localhost:8080/tourland/resources/images/jeju/tour1.jpg" style="height:800px; width:1000px" /></p>

<h2>우도</h2>

<h3><strong>우도</strong>(牛島)는&nbsp;<a href="https://ko.wikipedia.org/wiki/%EC%A0%9C%EC%A3%BC%EB%8F%84" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="제주도">제주도</a>의 동쪽 끝에 접하는&nbsp;<a href="https://ko.wikipedia.org/wiki/%EC%84%AC" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="섬">섬</a>으로,&nbsp;<a href="https://ko.wikipedia.org/wiki/%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="제주특별자치도">제주특별자치도</a>에서&nbsp;<a href="https://ko.wikipedia.org/wiki/%EC%A0%9C%EC%A3%BC%EB%8F%84" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="제주도">제주도</a>&nbsp;다음으로 큰 섬이다. 우도란 이름은 섬의 모습이&nbsp;<a href="https://ko.wikipedia.org/wiki/%EC%86%8C" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="소">소</a>가 누워 있는 것 같다고 해서 붙여졌다.</h3>

<p><img alt="" src="http://localhost:8080/tourland/resources/images/jeju/tour2.jpg" style="height:966px; width:1000px" /></p>

<h2>용두암</h2>

<h3>용담2동, 공항 북동쪽 해안에 있는 영두암은 제주관광의 상징과도 같은 곳이다. 공항과 가장 가까운 관광지로 해외여행자나 단체여행객들이 자주 찾는 관광지다. &nbsp;용이 포요하며 바다에서 솟구쳐 오르는 형상을 따 용두암이라 이름지어졌다. 전설에 의하면 인근 계곡 용연에서 살던 용이 승천하려다가 돌로 굳어졌다고 한다. 겉으로 드러난 부분의 높이가 10m, 바다 속에 잠긴 몸의 길이가 30m 쯤 된다고 하니, 괴암을 응시하고 있자면, 정말로 용이 꿈틀거리는 것 같은 상상을 할법도 하다. 이 용두암을 제대로 감상하려면 서쪽으로 100m 쯤 떨어진 곳이 적당하며, 바다가 잔잔한 날보다 파도가 심하게 몰아치는 날이 적격이다. 마치 천지개벽이 이루어지는 것 같기도 하고 신의 노여움 속에 용이 &#39;으르르&#39; 울부짖으며 바다 속에서 솟구쳐 오르는 듯 하기도 하다.</h3>

<p><img alt="" src=" http://localhost:8080/tourland/resources/images/jeju/tour3.jpg" style="height:643px; width:1000px" /></p>

<h2>용연계곡</h2>

<h3>용두암에서 200m정도 떨어져있는 곳으로, 바다와 민물이 만나는 곳이다.&nbsp;비를 몰고 오는 용이 살던 연못이라 하여 용연(龍淵)이라 이름 지어졌는데, 이곳에서 기우제를 지내면 신기하게도 비가 내렸다고 한다. 물빛이 아름답고 구름다리를 통해 가로지를 수 있다. 밤에는 아름다운 조명들로 야경이 아름답고, 한적한 산책로가 있어 시간을 보내기 좋다.</h3>

<p><img alt="" src="http://localhost:8080/tourland/resources/images/jeju/tour4.jpg" style="height:667px; width:1000px" /></p>
', '2020-03-29', 4960000, '/2020/05/13/912d1158-f00e-484b-9a37-d56065d60adf_tour1.jpg', 0);	
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 1);
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 2);
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 3);
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 4);
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 5);
INSERT INTO tour.pairstatus
(pno, ano)
VALUES(1, 6);

INSERT INTO tour.photelstatus
(pno, hno)
VALUES(1, 1);
INSERT INTO tour.photelstatus
(pno, hno)
VALUES(1, 4);
INSERT INTO tour.photelstatus
(pno, hno)
VALUES(1, 7);

INSERT INTO tour.ptourstatus
(pno, tno)
VALUES(1, 1);
INSERT INTO tour.ptourstatus
(pno, tno)
VALUES(1, 2);
INSERT INTO tour.ptourstatus
(pno, tno)
VALUES(1, 103);
INSERT INTO tour.ptourstatus
(pno, tno)
VALUES(1, 104);

INSERT INTO tour.prentstatus
(pno, rno)
VALUES(1, 5);

select * from product p join photelstatus h on p.pno = h.pno join hotel h2 on h.hno = h2.no join prentstatus r on p.pno = r.pno join rentcar r2 on r.rno = r2.no where p.pno = 2;
desc pairstatus;
desc prentstatus;
select * from product;
select * from pairstatus;
select * from photelstatus;
select * from ptourstatus;
select * from prentstatus;
delete from prentstatus;
delete from ptourstatus;
delete from photelstatus;
delete from pairstatus;
delete from product;
-- 태원 --------------------------------------------------------------------------------------------
SELECT *
FROM hotel; 

where no = 811;
select count(no) from hotel;
select * from hotel order by no desc limit 10, 3;

select * from hotel
where hname like CONCAT('%','hidden','%');

select * from user;

select * from employee;

select * from planboard;

select * from hotel;

select * from user;

insert into planboard(title, content, writer, regdate, lcate, mcate, answer,respond)
(select title, content, writer, regdate, lcate, mcate, answer,respond from planboard);

 select from user
 where userpass = password('test');

select count(no)
from planboard;

insert into planboard(title, content, writer, regdate, lcate, mcate, answer) values
('test','test','test',now(),'D','P',0);

update planboard  set 
title ='test11', content='test11', respond='답변'
where no=6;

select p.pno,p.pname,p.content

-- 하나 --------------------------------------------------------------------------------------------

SELECT * FROM notice;
select count(*) from airplane; 
select * from coupon;
select * from airplane;

