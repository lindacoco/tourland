select user(),database();



-- 현서 --------------------------------------------------------------------------------------------
-- 사원
desc employee;
select * from employee;
select * from employee where empretired=0 order by empno desc  limit 1, 3;
desc user;
select * from `user` u ;
select * from rentcar r ;
-- 렌트카
select count(no) from rentcar r ;
-- 배너
select * from banner b2 ;
select * from banner order by no desc limit 1, 3;
select  count(no) from banner ;

-- 인선 --------------------------------------------------------------------------------------------
select count(no) from faq where title like concat('%','쿠폰','%');
select * from faq order by no desc;
-- 태원 --------------------------------------------------------------------------------------------

SELECT *
FROM hotel; 
select count(no) from hotel;
select * from hotel order by no desc limit 10, 3;


-- 하나 --------------------------------------------------------------------------------------------

SELECT * FROM notice;
select count(*) from notice; 
select * from coupon;

