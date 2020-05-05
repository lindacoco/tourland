select user(),database();



-- 현서 --------------------------------------------------------------------------------------------
-- 사원
desc employee;
select * from employee;
select * from employee where empretired=0 order by empno desc  limit 1, 3;
select * from employee where empno like concat('%','1','%') and empretired =0;
delete from employee where empid = 'apple';
insert into employee values (6,'장우주','1987-01-01','010-4444-4321','대구 광역시 달서구',0,'employee4',password('employee'),1);
desc user;
select * from `user` u ;
insert into user values (6,'도라지','1989-12-18','010-4333-3825','대구시 북구 태전동 254-30',null,null,'customer5',password('customer'),1);
select * from rentcar r order by no desc ;
-- 렌트카
select count(no) from rentcar r ;
-- 배너
select * from banner b2 ;
select * from banner order by no desc limit 1, 3;
select  count(no) from banner ;

-- 고객의 소리
insert into custboard values
(1,'홈페이지 이용이 너무 어려워요','좀더 편했으면 좋겠음','장초코',now(),password(111));

-- 인선 --------------------------------------------------------------------------------------------
select count(no) from faq where title like concat('%','쿠폰','%');
select * from faq where lcate = 'D' and mcate = 'J' and title like concat ('%','제주','%') order by no desc limit 1,10;
desc tour;
select * from tour where no = 3001 order by no desc;
delete from tour;
-- 태원 --------------------------------------------------------------------------------------------
SELECT *
FROM hotel; 
select count(no) from hotel;
select * from hotel order by no desc limit 10, 3;


-- 하나 --------------------------------------------------------------------------------------------

SELECT * FROM notice;
select count(*) from notice; 
select * from coupon;
select * from airplane;

