<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* 본문 */
	section { width: 1000px; margin: 0 auto; }
	div#proBox { border-bottom : 1px solid #929292; }
	div#proBox h1 { height: 100px; line-height: 100px;}
	div#imgBox { width: 500px; height: 400px;float: left;  }
	div#bigImgBox { width: 500px; height: 300px;}
	div#bigImgBox img { width: 100%; }
	div#smallImgBox { width: 500px; height:90px;}
	div#smallImgBox img { width:23%; height: 70px; float: left; margin:5px;}
	
	div#infoBox { width: 460px; height: 400px; overflow: hidden; padding-left:20px;}
	div#infoBox ul li { height: 40px; }
	div#infoBox #infoName { height: 100px; }
	div#infoBox #infoName span { font-size: 20px; font-weight: bold;}
	div#infoBox #infoPrice span { font-size: 30px; font-weight: bold;}
	
	div#btnsBox { height: 100px; text-align: center; line-height: 150px;}
	div#btnsBox button { width: 200px; height: 30px; border: none;  }
	button#doReserv { background: maroon; color: #fff; }
	button#doWish { background: steelblue; color: #fff; }
	
	#proDetail h2 { height: 80px; line-height: 60px;}
	#proDetail .detailTitle { height: 30px; font-size: 20px; font-weight: bold; }
	#proDetail .detailInfo { height: 100px; }
	#proDetail img { width: 100%; margin-bottom: 30px; }
</style>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
				<div id="proBox">
					<h1>[도쿄 3일]시크릿 특가!도쿄시내/디즈니랜드_아시아나항공 바로출발!</h1>
					<div id="imgBox">
						<div id="bigImgBox">
							<img src="${pageContext.request.contextPath}/resources/images/dokyo1.jpg">
						</div>
						<div id="smallImgBox">
							<ul>
								<li><img src="${pageContext.request.contextPath}/resources/images/dokyo1.jpg"></li>
								<li><img src="${pageContext.request.contextPath}/resources/images/dokyo1.jpg"></li>
								<li><img src="${pageContext.request.contextPath}/resources/images/dokyo1.jpg"></li>
								<li><img src="${pageContext.request.contextPath}/resources/images/dokyo1.jpg"></li>
							</ul>
						</div>
					</div>
					
					<div id="infoBox">
						<ul>
							<li id="infoNo">상품 번호 : <span id="pno">P20200511001</span></li>
							<li id="infoName"><span id="pname">[도쿄 3일]시크릿 특가!도쿄시내/디즈니랜드_아시아나항공 바로출발!</span></li>
							<li id="infoDate">출발일 : <span id="ddate">2020-05-11</span></li>
							<li id="infoDays">여행 기간 : <span id="tourDays">2박 3일</span></li>
							<li id="infoPrice">가격 : <span id="price">500,000 원</span></li>
						</ul>
						<div id="btnsBox">
						<button id="doReserv">예약하기</button>
						<button id="doWish">장바구니</button>
					</div>
					</div>
					
				</div>
				<div id="proDetail">
					<h2>상품 세부 설명</h2>
					<p class="detailTitle">아키하바라</p>
					<p class="detailInfo">‘전자제품의 메카‘, ‘오타쿠들의 성지‘로 불리는 아키하바라. 여성,남성 할 것 없이 눈 돌아가는 쇼핑스팟! 애니메이션, 게임, 건담, J-pop에 관심있다면
						아키하바라가 바로 천국~!</p>
					<p class="detailImg"><img src="${pageContext.request.contextPath}/resources/images/akihabara.jpg"></p>
					
					
					<p class="detailTitle">하라주쿠</p>
					<p class="detailInfo">‘전자제품의 메카‘, ‘오타쿠들의 성지‘로 불리는 아키하바라. 여성,남성 할 것 없이 눈 돌아가는 쇼핑스팟! 애니메이션, 게임, 건담, J-pop에 관심있다면
						아키하바라가 바로 천국~!</p>
					<p class="detailImg"><img src="${pageContext.request.contextPath}/resources/images/harajuku.jpg"></p>
					
					
					<p class="detailTitle">시모키타자와</p>
					<p class="detailInfo">‘전자제품의 메카‘, ‘오타쿠들의 성지‘로 불리는 아키하바라. 여성,남성 할 것 없이 눈 돌아가는 쇼핑스팟! 애니메이션, 게임, 건담, J-pop에 관심있다면
						아키하바라가 바로 천국~!</p>
					<p class="detailImg"><img src="${pageContext.request.contextPath}/resources/images/shimoki.jpg"></p>
					
						
					<p class="detailTitle">롯폰기</p>
					<p class="detailInfo">‘전자제품의 메카‘, ‘오타쿠들의 성지‘로 불리는 아키하바라. 여성,남성 할 것 없이 눈 돌아가는 쇼핑스팟! 애니메이션, 게임, 건담, J-pop에 관심있다면
						아키하바라가 바로 천국~!</p>	
					<p class="detailImg"><img src="${pageContext.request.contextPath}/resources/images/Roppongi.jpg"></p>
					
					

		</div>
			</section>
	<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>