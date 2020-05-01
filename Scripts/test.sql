select user(),database();



-- 현서 --------------------------------------------------------------------------------------------
-- 사원
desc employee;
select * from employee;
select * from employee where empretired=0 order by empno desc  limit 1, 3;
desc user;
select * from `user` u ;
select * from rentcar r ;
select count(no) from rentcar r ;


-- 인선 --------------------------------------------------------------------------------------------
select count(no) from faq where title like concat('%','쿠폰','%');
select * from faq order by no desc;
-- 태원 --------------------------------------------------------------------------------------------

SELECT *
FROM hotel;


-- 하나 --------------------------------------------------------------------------------------------

SELECT * FROM notice;
select count(*) from notice; 
select * from coupon;

