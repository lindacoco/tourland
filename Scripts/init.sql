-- 여행사
DROP SCHEMA IF EXISTS tour;

-- 여행사
CREATE SCHEMA tour;

-- 직원
CREATE TABLE tour.employee (
	empno      INT          NOT NULL COMMENT '사번', -- 사번
	empname    varchar(5)   NULL     COMMENT '사원명', -- 사원명
	empbirth   DATE         NULL     COMMENT '생년월일', -- 생년월일
	emptel     char(13)     NULL     COMMENT '전화번호', -- 전화번호
	empaddr    VARCHAR(255) NULL     COMMENT '주소', -- 주소
	empauth    tinyint(1)   NULL     COMMENT '권한', -- 권한
	empid      varchar(12)  NULL     COMMENT '아이디', -- 아이디
	emppass    varchar(12)  NULL     COMMENT '비밀번호', -- 비밀번호
	empretired tinyint(1)   NULL     COMMENT '퇴사여부' -- 퇴사여부
)
COMMENT '직원';

-- 직원
ALTER TABLE tour.employee
	ADD CONSTRAINT PK_employee -- 직원 기본키
		PRIMARY KEY (
			empno -- 사번
		);

-- 회원
CREATE TABLE tour.user (
	userno       INT          NOT NULL COMMENT '유저번호', -- 유저번호
	username     varchar(5)   NULL     COMMENT '유저명', -- 유저명
	userbirth    DATE         NULL     COMMENT '생년월일', -- 생년월일
	usertel      char(13)     NULL     COMMENT '전화번호', -- 전화번호
	useraddr     VARCHAR(255) NULL     COMMENT '주소', -- 주소
	userpassport char(9)      NULL     COMMENT '여권번호', -- 여권번호
	no           INT          NULL     COMMENT '쿠폰번호', -- 쿠폰번호
	userid       varchar(12)  NULL     COMMENT '유저아이디', -- 유저아이디
	userpass     varchar(12)  NULL     COMMENT '유저비밀번호', -- 유저비밀번호
	usersecess   TINYINT(1)   NULL     COMMENT '탈퇴여부' -- 탈퇴여부
)
COMMENT '회원';

-- 회원
ALTER TABLE tour.user
	ADD CONSTRAINT PK_user -- 회원 기본키
		PRIMARY KEY (
			userno -- 유저번호
		);

-- 공지사항
CREATE TABLE tour.notice (
	no      INT          NOT NULL COMMENT '번호', -- 번호
	title   varchar(255) NULL     COMMENT '제목', -- 제목
	writer  varchar(5)   NULL     COMMENT '작성자', -- 작성자
	content LONGTEXT     NULL     COMMENT '내용', -- 내용
	regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '작성일자' -- 작성일자
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE tour.notice
	ADD CONSTRAINT PK_notice -- 공지사항 기본키
		PRIMARY KEY (
			no -- 번호
		);

ALTER TABLE tour.notice
	MODIFY COLUMN no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 이벤트
CREATE TABLE tour.event (
	no        INT          NOT NULL COMMENT '번호', -- 번호
	title     varchar(255) NULL     COMMENT '제목', -- 제목
	content   LONGTEXT     NULL     COMMENT '내용', -- 내용
	pic       varchar(255) NULL     COMMENT '사진', -- 사진
	startdate DATE         NULL     COMMENT '시작날짜', -- 시작날짜
	enddate   DATE         NULL     COMMENT '종료일자' -- 종료일자
)
COMMENT '이벤트';

-- 이벤트
ALTER TABLE tour.event
	ADD CONSTRAINT PK_event -- 이벤트 기본키
		PRIMARY KEY (
			no -- 번호
		);

ALTER TABLE tour.event
	MODIFY COLUMN no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 배너
CREATE TABLE tour.banner (
	no      INT          NOT NULL COMMENT '번호', -- 번호
	title   varchar(255) NULL     COMMENT '제목', -- 제목
	content LONGTEXT     NULL     COMMENT '내용', -- 내용
	pic     varchar(255) NULL     COMMENT '사진', -- 사진
	path    varchar(255) NULL     COMMENT '세부경로' -- 세부경로
)
COMMENT '배너';

-- 배너
ALTER TABLE tour.banner
	ADD CONSTRAINT PK_banner -- 배너 기본키
		PRIMARY KEY (
			no -- 번호
		);

ALTER TABLE tour.banner
	MODIFY COLUMN no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- FAQ
CREATE TABLE tour.FAQ (
	no      INT          NOT NULL COMMENT '번호', -- 번호
	title   varchar(255) NULL     COMMENT '제목', -- 제목
	content LONGTEXT     NULL     COMMENT '내용', -- 내용
	lcate   CHAR(1)      NULL     COMMENT '대분류', -- 대분류
	mcate   CHAR(1)      NULL     COMMENT '중분류' -- 중분류
)
COMMENT 'FAQ';

-- FAQ
ALTER TABLE tour.FAQ
	ADD CONSTRAINT PK_FAQ -- FAQ 기본키
		PRIMARY KEY (
			no -- 번호
		);

ALTER TABLE tour.FAQ
	MODIFY COLUMN no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 고객의소리
CREATE TABLE tour.custnotice (
	no      INT          NOT NULL COMMENT '번호', -- 번호
	title   varchar(255) NULL     COMMENT '제목', -- 제목
	content LONGTEXT     NULL     COMMENT '내용', -- 내용
	writer  varchar(5)   NULL     COMMENT '작성자', -- 작성자
	regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '작성일자', -- 작성일자
	passwd  varchar(50)  NULL     COMMENT '비밀번호' -- 비밀번호
)
COMMENT '고객의소리';

-- 고객의소리
ALTER TABLE tour.custnotice
	ADD CONSTRAINT PK_custnotice -- 고객의소리 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 상품문의사항
CREATE TABLE tour.plannotice (
	no      INT          NOT NULL COMMENT '번호', -- 번호
	title   varchar(255) NULL     COMMENT '제목', -- 제목
	content LONGTEXT     NULL     COMMENT '내용', -- 내용
	writer  varchar(5)   NULL     COMMENT '작성자', -- 작성자
	regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '작성일자', -- 작성일자
	lcate   CHAR(1)      NULL     COMMENT '대분류', -- 대분류
	mcate   CHAR(1)      NULL     COMMENT '중분류', -- 중분류
	answer  tinyint(1)   NULL     COMMENT '답변상태' -- 답변상태
)
COMMENT '상품문의사항';

-- 상품문의사항
ALTER TABLE tour.plannotice
	ADD CONSTRAINT PK_plannotice -- 상품문의사항 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 상품
CREATE TABLE tour.package (
	pno      INT          NOT NULL COMMENT '상품번호', -- 상품번호
	pname    varchar(100) NULL     COMMENT '상품이름', -- 상품이름
	pcontent LONGTEXT     NULL     COMMENT '상품설명', -- 상품설명
	pexpire  DATE         NULL     COMMENT '상품유효기간', -- 상품유효기간
	pprice   INT          NULL     COMMENT '상품가격', -- 상품가격
	ano      INT          NULL     COMMENT '항공번호', -- 항공번호
	hno      INT          NULL     COMMENT '호텔번호', -- 호텔번호
	tno      INT          NULL     COMMENT '투어번호', -- 투어번호
	rno      INT          NULL     COMMENT '렌트카번호', -- 렌트카번호
	pic      varchar(255) NULL     COMMENT '상품사진' -- 상품사진
)
COMMENT '상품';

-- 상품
ALTER TABLE tour.package
	ADD CONSTRAINT PK_package -- 상품 기본키
		PRIMARY KEY (
			pno -- 상품번호
		);

-- 고객상품현황
CREATE TABLE tour.userpackage (
	userno INT NOT NULL COMMENT '유저번호', -- 유저번호
	pno    INT NOT NULL COMMENT '상품번호' -- 상품번호
)
COMMENT '고객상품현황';

-- 고객상품현황
ALTER TABLE tour.userpackage
	ADD CONSTRAINT PK_userpackage -- 고객상품현황 기본키
		PRIMARY KEY (
			userno, -- 유저번호
			pno     -- 상품번호
		);

-- 팝업
CREATE TABLE tour.popup (
	no        INT          NOT NULL COMMENT '번호', -- 번호
	title     varchar(255) NULL     COMMENT '제목', -- 제목
	content   LONGTEXT     NULL     COMMENT '내용', -- 내용
	pic       varchar(255) NULL     COMMENT '사진', -- 사진
	startdate DATE         NULL     COMMENT '시작날짜', -- 시작날짜
	enddate   DATE         NULL     COMMENT '종료날짜' -- 종료날짜
)
COMMENT '팝업';

-- 팝업
ALTER TABLE tour.popup
	ADD CONSTRAINT PK_popup -- 팝업 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 항공
CREATE TABLE tour.airplane (
	no        INT         NOT NULL COMMENT '번호', -- 번호
	ano       CHAR(5)     NULL     COMMENT '항공기번호', -- 항공기번호
	dlocation varchar(30) NULL     COMMENT '출발지역', -- 출발지역
	rlocation VARCHAR(30) NULL     COMMENT '도착지역', -- 도착지역
	ldiv      char(1)     NULL     COMMENT '장소구분', -- 장소구분
	adiv      char(1)     NULL     COMMENT '항공구분', -- 항공구분
	capacity  INT         NULL     COMMENT '인원', -- 인원
	seat      char(1)     NULL     COMMENT '좌석', -- 좌석
	price     INT         NULL     COMMENT '가격' -- 가격
)
COMMENT '항공';

-- 항공
ALTER TABLE tour.airplane
	ADD CONSTRAINT PK_airplane -- 항공 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 호텔
CREATE TABLE tour.hotel (
	no           INT          NOT NULL COMMENT '번호', -- 번호
	hname        VARCHAR(50)  NULL     COMMENT '호텔이름', -- 호텔이름
	haddr        VARCHAR(255) NULL     COMMENT '주소', -- 주소
	checkin      DATE         NULL     COMMENT '체크인', -- 체크인
	checkout     DATE         NULL     COMMENT '체크아웃', -- 체크아웃
	capacity     INT          NULL     COMMENT '인원', -- 인원
	price        INT          NULL     COMMENT '가격', -- 가격
	roomcapacity INT          NULL     COMMENT '객실수', -- 객실수
	roomtype     CHAR(1)      NULL     COMMENT '객실타입', -- 객실타입
	ldiv         char(1)      NULL     COMMENT '장소구분' -- 장소구분
)
COMMENT '호텔';

-- 호텔
ALTER TABLE tour.hotel
	ADD CONSTRAINT PK_hotel -- 호텔 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 투어
CREATE TABLE tour.tour (
	no        INT          NOT NULL COMMENT '번호', -- 번호
	tname     VARCHAR(50)  NULL     COMMENT '투어명', -- 투어명
	tlocation varchar(30)  NULL     COMMENT '투어지역', -- 투어지역
	startdate DATE         NULL     COMMENT '시작날짜', -- 시작날짜
	enddate   DATE         NULL     COMMENT '종료날짜', -- 종료날짜
	taddr     VARCHAR(255) NULL     COMMENT '주소', -- 주소
	ldiv      char(1)      NULL     COMMENT '장소구분' -- 장소구분
)
COMMENT '투어';

-- 투어
ALTER TABLE tour.tour
	ADD CONSTRAINT PK_tour -- 투어 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 렌트카
CREATE TABLE tour.rentcar (
	no         INT          NOT NULL COMMENT '번호', -- 번호
	cdiv       char(1)      NULL     COMMENT '차종류', -- 차종류
	cno        char(8)      NULL     COMMENT '차번호', -- 차번호
	rentddate  DATE         NULL     COMMENT '대여날짜', -- 대여날짜
	returndate DATE         NULL     COMMENT '반납날짜', -- 반납날짜
	rentaddr   VARCHAR(255) NULL     COMMENT '대여장소', -- 대여장소
	returnaddr VARCHAR(255) NULL     COMMENT '반납장소', -- 반납장소
	price      INT          NULL     COMMENT '가격', -- 가격
	capacity   INT          NULL     COMMENT '인원', -- 인원
	insurance  TINYINT(1)   NULL     COMMENT '보험여부', -- 보험여부
	ldiv       char(1)      NULL     COMMENT '장소구분' -- 장소구분
)
COMMENT '렌트카';

-- 렌트카
ALTER TABLE tour.rentcar
	ADD CONSTRAINT PK_rentcar -- 렌트카 기본키
		PRIMARY KEY (
			no -- 번호
		);

-- 예약
CREATE TABLE tour.reservation (
	no      INT        NOT NULL COMMENT '예약번호', -- 예약번호
	userno  INT        NULL     COMMENT '유저번호', -- 유저번호
	pno     INT        NULL     COMMENT '상품번호', -- 상품번호
	comfirm TINYINT(1) NULL     COMMENT '확정여부' -- 확정여부
)
COMMENT '예약';

-- 예약
ALTER TABLE tour.reservation
	ADD CONSTRAINT PK_reservation -- 예약 기본키
		PRIMARY KEY (
			no -- 예약번호
		);

-- 쿠폰
CREATE TABLE tour.coupon (
	no       INT          NOT NULL COMMENT '쿠폰번호', -- 쿠폰번호
	cname    varchar(100) NULL     COMMENT '쿠폰이름', -- 쿠폰이름
	pdate    DATE         NULL     COMMENT '발행일자', -- 발행일자
	edate    DATE         NULL     COMMENT '만료일자', -- 만료일자
	ccontent LONGTEXT     NULL     COMMENT '쿠폰내용', -- 쿠폰내용
	mrate    FLOAT        NULL     COMMENT '할인율' -- 할인율
)
COMMENT '쿠폰';

-- 쿠폰
ALTER TABLE tour.coupon
	ADD CONSTRAINT PK_coupon -- 쿠폰 기본키
		PRIMARY KEY (
			no -- 쿠폰번호
		);

-- 장바구니
CREATE TABLE tour.cart (
	cno    INT     NULL COMMENT '번호', -- 번호
	userno INT     NULL COMMENT '유저번호', -- 유저번호
	pno    INT     NULL COMMENT '상품번호', -- 상품번호
	count  INTEGER NULL COMMENT '개수', -- 개수
	price  INTEGER NULL COMMENT '가격' -- 가격
)
COMMENT '장바구니';

-- 회원
ALTER TABLE tour.user
	ADD CONSTRAINT FK_coupon_TO_user -- 쿠폰 -> 회원
		FOREIGN KEY (
			no -- 쿠폰번호
		)
		REFERENCES tour.coupon ( -- 쿠폰
			no -- 쿠폰번호
		);

-- 상품
ALTER TABLE tour.package
	ADD CONSTRAINT FK_airplane_TO_package -- 항공 -> 상품
		FOREIGN KEY (
			ano -- 항공번호
		)
		REFERENCES tour.airplane ( -- 항공
			no -- 번호
		);

-- 상품
ALTER TABLE tour.package
	ADD CONSTRAINT FK_hotel_TO_package -- 호텔 -> 상품
		FOREIGN KEY (
			hno -- 호텔번호
		)
		REFERENCES tour.hotel ( -- 호텔
			no -- 번호
		);

-- 상품
ALTER TABLE tour.package
	ADD CONSTRAINT FK_tour_TO_package -- 투어 -> 상품
		FOREIGN KEY (
			tno -- 투어번호
		)
		REFERENCES tour.tour ( -- 투어
			no -- 번호
		);

-- 상품
ALTER TABLE tour.package
	ADD CONSTRAINT FK_rentcar_TO_package -- 렌트카 -> 상품
		FOREIGN KEY (
			rno -- 렌트카번호
		)
		REFERENCES tour.rentcar ( -- 렌트카
			no -- 번호
		);

-- 고객상품현황
ALTER TABLE tour.userpackage
	ADD CONSTRAINT FK_user_TO_userpackage -- 회원 -> 고객상품현황
		FOREIGN KEY (
			userno -- 유저번호
		)
		REFERENCES tour.user ( -- 회원
			userno -- 유저번호
		);

-- 고객상품현황
ALTER TABLE tour.userpackage
	ADD CONSTRAINT FK_package_TO_userpackage -- 상품 -> 고객상품현황
		FOREIGN KEY (
			pno -- 상품번호
		)
		REFERENCES tour.package ( -- 상품
			pno -- 상품번호
		);

-- 예약
ALTER TABLE tour.reservation
	ADD CONSTRAINT FK_user_TO_reservation -- 회원 -> 예약
		FOREIGN KEY (
			userno -- 유저번호
		)
		REFERENCES tour.user ( -- 회원
			userno -- 유저번호
		);

-- 예약
ALTER TABLE tour.reservation
	ADD CONSTRAINT FK_package_TO_reservation -- 상품 -> 예약
		FOREIGN KEY (
			pno -- 상품번호
		)
		REFERENCES tour.package ( -- 상품
			pno -- 상품번호
		);

-- 장바구니
ALTER TABLE tour.cart
	ADD CONSTRAINT FK_user_TO_cart -- 회원 -> 장바구니
		FOREIGN KEY (
			userno -- 유저번호
		)
		REFERENCES tour.user ( -- 회원
			userno -- 유저번호
		);

-- 장바구니
ALTER TABLE tour.cart
	ADD CONSTRAINT FK_package_TO_cart -- 상품 -> 장바구니
		FOREIGN KEY (
			pno -- 상품번호
		)
		REFERENCES tour.package ( -- 상품
			pno -- 상품번호
		);
		
create user if not exists 'tour'@'localhost';
grant all privileges on tour.* to 'tour'@'localhost' identified by 'tour';