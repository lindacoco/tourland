<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* 전체 */
	* { margin:0; 
		padding:0; 
		font-family: 'Noto Sans KR', sans-serif;
		color: #434343;}
	li { list-style: none; }
	li a { text-decoration: none; color: #000; }
	
	/* 로그인 메뉴 부분 */
	nav#nav1 { width: 100%;
			   height: 50px; 
			   background: tan; 
			   overflow: hidden;}
	nav#nav1 ul { width: 1200px;
				  height: 50px;
				  margin: 0 auto; }
	nav#nav1 li { width: 8%; 
				  line-height: 50px;
				  float: right;
				  font-size: 15px; }
	nav#nav1 #manager a { border-radius: 3px; 
						  background: maroon; color: #fff; 
						  padding: 0 3px;
						  font-size: 13px;}	
	/* 헤더 */
	#main { width: 1200px; height: 150px;
			margin: 0 auto;}
	#main div { width: 30%; 
				text-align: center; 
				float: left;
				line-height: 80px;
				margin-top: 50px; }
	#main div#logo, #main div#search { margin-left: 50px;}						  
	#main div#logo h1 { color: #ff7f00; font-size: 60px; font-family: 'Black Han Sans', sans-serif;}
	#main div#search input { border: none; border-bottom: 1px solid gray; }
	
	div#nav2 { clear: both; }
	div#nav2 { height: 50px; 
			   background: #545454; 
			   overflow: hidden; }
	div#nav2 ul { width: 1200px; height: 50px; margin: 0 auto;}
	div#nav2 ul li { width: 10%; 
					 height: 50px;  
				     float: left; 
				     margin-right:20px; }
	div#nav2 ul li a { display: block;
					   text-align: center;
					   line-height: 50px;
					   color: #fff;}
	div#nav2 ul li#orange { width: 50px; background: #ff7f00;}
	div#nav2 ul li.short { width: 50px;} 

	/* 본문 */
	section { width: 1200px; height: 800px; margin: 0 auto;}
	section nav { width: 200px; 
				  background: #f4f4f4;
				  height: 100%; }			  
	section nav ul li { height: 30px; 
						padding: 10px; }							
	section nav ul li a { display: block;
						  text-indent: 10px; 
						  line-height: 30px; }
	section nav ul li:hover { background: #ff7f00; }						  				  	
	

	/* FOOTER */								      
	footer div#footerList { background: gray; height: 50px; }
	#footerList ul { width: 600px; margin: 0 auto; }
	#footerList ul li { width: 25%; list-style: none; float: left; text-align: center; }	
	#footerList ul li a{ line-height: 50px;}
	
	footer #comInfo { background: #f4f4f4; height: 200px; text-align: center; line-height: 100px; }  
	footer #comInfo span { font-size: 15px; }    
	footer #comInfo p { font-size: 18px; font-weight: bold;}	
</style>
<body>
	<header>
			<nav id="nav1">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">로그인</a></li>
					<li id="manager"><a href="#">관리자</a></li>
				</ul>
			</nav>
			
					<div id="main">
						<div id="reward">
							<a href="#"><img src="images/reward.png"></a>
						</div>
						<div id="logo">
							<h1>투어 랜드</h1>
						</div>
						<div id="search">
							<input type="text">
							<button>찾기</button>
						</div>
					</div>
					
					<div id="nav2">
						<ul>
							<li id="orange"><a href="#">=</a></li>
							<li><a href="#">해외 패키지</a></li>
							<li><a href="#">국내 패키지</a></li>
							<li class="short"><a href="#">항공</a></li>
							<li class="short"><a href="#">호텔</a></li>
							<li><a href="#">현지 투어</a></li>
							<li class="short"><a href="#">렌트카</a></li>
							<li class="short"><a href="#">이벤트</a></li>
						</ul>
					</div>
			</header>
				
			<section>
				<nav>
					<ul>
						<li><a href="#">내 정보 수정</a></li>
						<li><a href="#">내 예약 현황</a></li>
						<li><a href="#">장바구니</a></li>
						<li><a href="#">내 쿠폰</a></li>
					</ul>
				</nav>
				
			</section>
			
			<footer>
			<div id="footerList">
				<ul>
					<li><a href="#">회사소개</a></li>
					<li><a href="#">제휴 및 광고 문의</a></li>
					<li><a href="#">여행 약관</a></li>
					<li><a href="#">찾아오시는 길</a></li>
				</ul>
			</div>
			<div id="comInfo">
				<span>(주)투어랜드 | 대표 : 박인선 | 서울 본사 : 서울시 용산구 한강대로 222 | 부산지점 : 부산광역시 중구 343 </span>
				<span>사업자 등록번호 : 111-11-11111 | 관광사업등록증번호 : 제0000-0000000호</span>
				<p>TOUR LAND @2020</p>
			</div>
		</footer>
</body>
</html>