-- 사원  권한부분 관리자가 1, 일반 사원이 0
insert into employee values
(1,'차은우','1990-01-01','010-1111-4321','대구 광역시 달서구',1,'employee',password('employee'),0),
(2,'신세경','1992-01-01','010-2222-4321','대구 광역시 달서구',0,'employee1',password('employee'),0),
(3,'장현서','1988-01-01','010-4334-4321','대구 광역시 달서구',0,'employee2',password('employee'),0),
(4,'박인선','1989-01-01','010-3333-4321','대구 광역시 달서구',0,'employee3',password('employee'),0),
(5,'황하나','1987-01-01','010-4444-4321','대구 광역시 달서구',0,'employee4',password('employee'),1),
(7,'테스트','1991-12-18','010-4245-3825','대구 광역시 달서구',1,'manager',password('test'),0);

-- 고객
desc user;
insert into user values
(1,'황태원','1991-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer1',password('customer'), 0),
(2,'정아름','1988-12-18','010-7777-3825','대구시 북구 태전동 254-30',null,null,'customer2',password('customer'), 0),
(3,'정윤호','1952-12-18','010-1111-3825','대구시 북구 태전동 254-30',null,null,'customer3',password('customer'), 0),
(4,'박상아','1970-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer4',password('customer'), 0),
(5,'지민서','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer5',password('customer'), 1),
(6,'테스트','1991-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'user',password('test'), 0);


-- 고객의 소리
desc custboard ;
insert into custboard values
(1,'홈페이지 이용이 너무 어려워요','좀더 편했으면 좋겠음','장초코',now(),password(111)),
(2,'상품이 다양하면 좋겠어요','좀더 많았으면..','장도롱',now(),password(111)),
(3,'차은우 가이드님 칭찬합니다','존잘!!','박열무',now(),password(111));

-- 팝업
desc popup ;

desc event ;
insert into event (no,title,content,pic,startdate,enddate ) values
(1,	'신규고객 첫구매 이벤트','무조건무조건이야','/2020/05/13/cefa5fd5-3a31-47d5-b621-44de0984363a_icecream.jpg','2020-04-08','2020-05-11'),
(2, 'SNS공유 이벤트','SNS로 투어랜드와 함께한 추억을 공유해주세요','/2020/05/13/2c3cb0bb-3d98-4d5c-b37f-e81339565756_dfwerwqrqw.jpg','2020-05-07','2020-06-27'),
(3,	'커플여행 이벤트	','커플이벤트','/2020/05/13/ddad31a7-2241-4c3d-98ca-7004337ab1e7_주석_2020-05-13_131020.jpg','2020-05-21','2020-05-29'),
(4,	'스타벅스 마시자','신규고객들을 위한 스타벅스 기프티콘 증정이벤트','/2020/05/13/2d9657f8-f45e-4880-ab9e-928846c04029_event1.jpg','2020-05-13',	'2020-06-27'),
(5,	'구급키트 증정','선착순 구급키트 증정','/2020/05/13/4b0f5bfd-42d0-4e4a-b9da-bde1afb0a1e6_event2.jpg','2020-05-10','2020-06-19'),
(6,	'이벤트1','이벤트1','/2020/05/13/89d3198a-d27f-4a83-8a80-48b4e4c8e714_ddddd.jpg','2020-05-10','2020-06-19'),
(7,	'이벤트2','이벤트2','/2020/05/13/a6a92948-ea66-46a6-8236-6b6120191d2f_주석_2020-05-04_144946.jpg','2020-05-10','2020-06-19'),
(8,	'이벤트3','이벤트3','/2020/05/13/055bc95a-75b2-4489-96bc-5afc2285cd1e_dafadfasdf.jpg','2020-05-10','2020-06-19');
-- 현서 렌트카 ----------------------------------------------------------------------------------------------
DESC rentcar;
load DATA LOCAL infile 'D:/workspace/workspace_spring/tourland/file/CSV/rentcar.csv'
INTO TABLE tour.rentcar
character set 'utf8'
fields terminated by ',';

-- 인선 ---------------------------------------------------------------------------------------------------
LOAD DATA LOCAL INFILE 'D:/workspace/workspace_spring/tourland/file/CSV/FAQ.csv'  
INTO TABLE faq
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines;

load DATA LOCAL infile 'D:/workspace/workspace_spring/tourland/file/CSV/tour.csv'
INTO table tour
character set 'utf8'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines;
-- 태원 ---------------------------------------------------------------------------------------------------

-- 호텔
desc hotel;
load data local infile 'D:/workspace/workspace_spring/tourland/file/CSV/hotel.csv'
into table tour.hotel
character set 'utf8'
fields terminated by ',';

-- 상품문의사항
desc planboard;
insert into planboard values
(null, "문의합니다", "단체상품에 대해 문의하고싶습니다.", "박인선", "2020-04-27","D", "P", "0",null),
(null, "상품 문의사항입니다.", "이미 예약을 했는데 호텔만 변경가능할까요?", "장현서", "2020-04-27","I","B","0",null),
(null, "상품 4가지 중 한가지만 가능한가요?", "패키지 상품 중 1가지만 예약하고싶습니다.", "황하나", "2020-04-27","R","B","0",null),
(null, "상품 환불 문의입니다.", "일이 생겨 못가게 되었습니다. 환불 규정이 어떻게 되나요?", "황태원", "2020-04-27","R","R","0",null),
(null, "렌트카 보험 문의입니다.", "보험을 안들어도 괜찮은가요?", "정아름", "2020-04-27","U","E","0",null);

-- 하나 ---------------------------------------------------------------------------------------------------

-- 항공
load data local infile 'D:/workspace/workspace_spring/tourland/file/CSV/flight.csv'
into table tour.airplane
character set 'utf8'
fields terminated by ',';


-- 공지사항
insert into notice values
(1, "코로나 19로 인한 패키지 취소", "투어랜드", "투어랜드 고객 여러분, 코로나 19로 인한 결항으로 몇몇 패키지가 취소되었습니다. 마이 페이지에서 예약 상황을 꼼꼼히 확인 하시기 바랍니다.", "2020-04-27"),
(2, "발로투어 달랏 폭포 체험 특가 판매 연장", "투어랜드", "발로투어의 달랏 폭포 체험이 특가 판매를 2020/5/20일까지 연장합니다. 등록하시려면 지금 달랏 폭포 체험을 검색창에서 검색하세요! ", "2020-04-25"),
(3, "투어랜드 서비스 점검", "투어랜드", "투어랜드는 2020/05/04 AM 00:00 부터 AM 05:00 까지 사이트 점검을 실시합니다. 점검 시간 동안에는 서비스를 이용하실 수 없습니다. 서비스 이용에 불편을 끼쳐 대단히 죄송합니다.", "2020-04-23");

-- 쿠폰

insert into coupon values
(1, "모든 해외여행 총집합 할인", "2020-04-27", "2020-05-04", "모든 해외여행 30% 할인", 30.0),
(2, "여름 휴가 시작 할인", "2020-07-01", "2020-08-01", "여름 휴가 떠나자 할인 쿠폰", 20.0),
(3, "얼리버드 할인 쿠폰", "2020-06-01", "2020-06-30", "얼리버드를 잡아라 할인 쿠폰", 10.0),
(4, "동남아시아 패키지 할인", "2020-05-01", "2020-05-30", "동남아시아로 떠나는 패키지 할인 쿠폰", 12.0);


