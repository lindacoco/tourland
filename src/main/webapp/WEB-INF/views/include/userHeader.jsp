<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/6f2f0f2d95.js"></script>    
<style>

/* /* 전체 */
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
	#main div#logo h1 a { color: #ff7f00; font-size: 60px; 
					      font-family: 'Black Han Sans', sans-serif;
					      text-decoration: none; }
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
</style>

<header>
			<nav id="nav1">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="${pageContext.request.contextPath }/tourlandMyReserv">마이페이지</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">로그인</a></li>
					<li id="manager"><a href="${pageContext.request.contextPath }/empMngList/0">관리자</a></li>
				</ul>
			</nav>
			
					<div id="main">
						<div id="reward">
							<a href="#"><img src="images/reward.png"></a>
						</div>
						<div id="logo">
							<h1><a href="${pageContext.request.contextPath }/tourlandMain">투어 랜드</a></h1>    
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