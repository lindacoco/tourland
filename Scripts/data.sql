-- 사원  권한부분 관리자가 1, 일반 사원이 0
insert into employee values
(1,'차은우','1990-01-01','010-1111-4321','대구 광역시 달서구',1,'employee',password('employee'),0),
(2,'신세경','1992-01-01','010-2222-4321','대구 광역시 달서구',0,'employee',password('employee'),0),
(3,'장현서','1988-01-01','010-4334-4321','대구 광역시 달서구',0,'employee',password('employee'),0),
(4,'박인선','1989-01-01','010-3333-4321','대구 광역시 달서구',0,'employee',password('employee'),0),
(5,'황하나','198-01-01','010-4444-4321','대구 광역시 달서구',0,'employee',password('employee'),0);\


-- 고객
desc user;
insert into user values
(1,'황태원','1991-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer',password('customer'),0),
(2,'정아름','1988-12-18','010-7777-3825','대구시 북구 태전동 254-30',null,null,'customer',password('customer'),0),
(3,'정윤호','1952-12-18','010-1111-3825','대구시 북구 태전동 254-30',null,null,'customer',password('customer'),0),
(4,'박상아','1970-12-18','010-4245-3825','대구시 북구 태전동 254-30',null,null,'customer',password('customer'),0),
(5,'지민서','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer',password('customer'),0);