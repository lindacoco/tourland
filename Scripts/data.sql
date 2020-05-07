-- 사원  권한부분 관리자가 1, 일반 사원이 0
insert into employee values
(1,'차은우','1990-01-01','010-1111-4321','대구 광역시 달서구',1,'employee',password('employee'),0),
(2,'신세경','1992-01-01','010-2222-4321','대구 광역시 달서구',0,'employee1',password('employee'),0),
(3,'장현서','1988-01-01','010-4334-4321','대구 광역시 달서구',0,'employee2',password('employee'),0),
(4,'박인선','1989-01-01','010-3333-4321','대구 광역시 달서구',0,'employee3',password('employee'),0),
(5,'황하나','1987-01-01','010-4444-4321','대구 광역시 달서구',0,'employee4',password('employee'),0),
(6,'장우주','1987-01-01','010-4444-4321','대구 광역시 달서구',0,'employee4',password('employee'),1);

-- 고객
desc user;
insert into user values
(1,'황태원','1991-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer1',password('customer'),0),
(2,'정아름','1988-12-18','010-7777-3825','대구시 북구 태전동 254-30',null,null,'customer2',password('customer'),0),
(3,'정윤호','1952-12-18','010-1111-3825','대구시 북구 태전동 254-30',null,null,'customer3',password('customer'),0),
(4,'박상아','1970-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer4',password('customer'),0),
(5,'지민서','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer5',password('customer'),0),
(6,'도라지','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer5',password('customer'),1);

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


desc hotel;
load data local infile 'D:/workspace/workspace_spring/tourland/file/CSV/hotel.csv'
into table tour.hotel
character set 'utf8'
fields terminated by ',';


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


