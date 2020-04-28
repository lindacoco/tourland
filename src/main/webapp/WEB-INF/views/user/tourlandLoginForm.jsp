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
	
	section{ width: 800px; height: 500px;  margin: 50px auto; }
	#loginHead { height: 80px; 
				 border-bottom: 2px solid #ff7f00;}				 
	#loginBox { width: 600px; height: 300px; 
			    border: 1px solid gainsboro;
			    border-radius: 10px; 
				margin: 50px auto; /* background: gray; */ }
	#loginBox h2 { height: 50px; padding: 30px 30px 10px 30px; }	
	#loginInnerBox { width: 450px; height: 100px; 
					 margin: 0 auto; 
					 padding-left: 80px; }
	#inputBox { width: 250px; height: 100px;
				float: left;  }
	#inputBox input { border: none; border-bottom: 1px solid gray;
					  width: 200px;  height: 30px; }				
	#submitBox { width: 200px; height: 100px;float: right; }	
	#submitBox input { width: 100px; height: 63px; 
					   border: none; 
					   background: goldenrod;}	   					 		
	#loginBtns { width: 500px; height: 50px; 
				 text-align: center; 
				 padding-left:50px;}
	#loginBtns button { width: 150px; height: 30px;
						border: none; 
						background: gray;
						color: #fff;  }	
	#loginAPI {width: 500px; height: 50px; 
				 text-align: center;  
				 padding-left: 50px;}
	#loginAPI button { width: 200px; height: 30px;
						border: none;  }
	#loginAPI #naver span { color: #228b22; font-weight: bold;} 
	#loginAPI #kakao span { color: goldenrod; font-weight: bold; 
							}		
	
	/* FOOTER */								      
	footer div#footerList { background: gray; height: 50px; }
	#footerList ul { width: 600px; margin: 0 auto; }
	#footerList ul li { width: 25%; list-style: none; float: left; text-align: center; }	
	#footerList ul li a{ line-height: 50px;}
	
	footer #comInfo { background: floralwhite; height: 200px; text-align: center; line-height: 100px; }  
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
				<div id="loginHead">
					<h1>로그인</h1>
					<p>새로운 세상, 투어랜드</p>
				</div>
				<div id="loginBox">
				<form>
					<h2>투어랜드</h2>
					<div id="loginInnerBox">
						<div id="inputBox">
							<input type="text" name="id" placeholder="투어랜드 아이디">
							<input type="text" name="password" placeholder="투어랜드 비밀번호">
						</div>
						<div id="submitBox">
							<input type="submit" value="로그인" style="cursor:pointer">
						</div>
					</div>
				</form>
					
					<div id="loginBtns">
						<button id="join" style="cursor:pointer">회원가입</button>
						<button id="findIDPW" style="cursor:pointer">아이디/비밀번호 찾기</button>
					</div>
					<div id="loginAPI">
						<button id="naver" class="api" style="cursor:pointer"><span>NAVER</span> 로그인</button>
						<button id="kakao" class="api" style="cursor:pointer"><span>kakao</span> 로그인</button>
					</div>
				</div>
			</section>
		<footer>
			<div id="footerList">
				<ul>
					<li><a href="#">회사소개</a></li>
					<li><a href="#">제휴 및 광고 문의</a></li>
					<li><a href="#">여행 약관</a></li>
					<li><a href="#">찾아오시는 길</a></
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