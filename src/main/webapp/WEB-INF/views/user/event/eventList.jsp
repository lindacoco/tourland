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
	/* 본문 */
	section { width: 1000px; margin: 0 auto; }
	div#pkgTitleBox { height: 230px; border-bottom: 1px solid #ededed; }
	div#pkgTitleBox h1 { height: 80px; line-height: 80px; }
	div#pkgContentBox { padding-top: 50px;}
	div#pkgSearch { width: 300px; background: #ededed; float: left; }
	div#pkgSearch h3 { background: goldenrod; height: 50px; line-height: 50px; text-indent: 10px;}
	div#pkgSearch p { height:50px; line-height: 50px; text-indent: 10px; }
	div#pkgSearch input { width: 90%; margin-left: 10px; }
	div#pkgSearch select { width: 90%; margin-left: 10px; }
	#pkgBtnBox { text-align: center;}
	button#pkgSearchBtn { border: none; width: 150px; height: 30px; background: #929292;}
	
	div#pkgListWrap { width:650px; padding: 0 20px 20px 30px;overflow: hidden;}
	#totalCnt { font-weight: bold;}
	div#pkgOrderBy {  height: 80px; line-height: 80px;}
	div#pkgOrderBy button { border: none; width: 100px; height: 30px; }
	div.pkgListBox { width:90%; height: 210px; padding: 20px;  border: 1px solid #ededed; }
	div.pkgImg { width: 250px; height: 180px; margin-right: 10px;  float: left; }
	div.pkgImg img { width: 100%; }
	div.pkgInfoBox { width: 320px; height: 180px; overflow: hidden; }
	div.pkgInfoBox p  { height: 40px; }
	div.pkgInfoBox .pkgTitle { height: 80px; font-size: 20px; font-weight: bold;}
	.pkgPrice { text-indent: 5px; font-size: 19px; color: maroon;}
	.pkgDate { text-align: right; font-size: 16px; font-weight: bold;}
	.pkgReserv { text-align: right;}
	.pkgReservBtn { border: none; width: 100px; height: 30px; }
</style>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	   <div id="eventPageDiv">
			<img src="${pageContext.request.contextPath }/resources/images/eventPage.jpg" style="width:100%; height:550px;">
	   </div>
			<section>
				
			<div id="pkgContentBox">
				
					<div id="pkgListWrap">
						<p id="totalCnt">일본 : 검색된 상품 <span id="totalCount">2,282개</span></p>
						<div id="pkgOrderBy">
							<button id="byPrice">낮은 가격 순</button>
							<button id="byPrice">호텔 객실 타입 순</button>
						</div>
						<div class="pkgListBox">
								<div class="pkgImg"><img src="images/disney.jpg"></div>
								<div class="pkgInfoBox">
									<p class="pkgTitle">[도쿄]2박 3일 디즈니랜드_5성급 호텔 지금 출발!</p>
									<p class="pkgPrice">500,000 부터~ </p>
									<p class="pkgDate"> ~ 2020/05/20 까지</p>
								</div>
								<p class="pkgReserv">
									<button class="pkgReservBtn">지금 바로 예약</button>
								</p>
						</div>
						<div class="pkgListBox">
								<div class="pkgImg"><img src="${pageContext.request.contextPath}/resources/images/disney.jpg"></div>
								<div class="pkgInfoBox">
									<p class="pkgTi${pageContext.request.contextPath}/resources/images/tle">[도쿄]2박 3일 디즈니랜드_5성급 호텔 지금 출발!</p>
									<p class="pkgPrice">500,000 부터~ </p>
									<p class="pkgDate"> ~ 2020/05/20 까지</p>
								</div>
								<p class="pkgReserv">
									<button class="pkgReservBtn">지금 바로 예약</button>
								</p>
						</div>
						<div class="pkgListBox">
								<div class="pkgImg"><img src="images/disney.jpg"></div>
								<div class="pkgInfoBox">
									<p class="pkgTitle">[도쿄]2박 3일 디즈니랜드_5성급 호텔 지금 출발!</p>
									<p class="pkgPrice">500,000 부터~ </p>
									<p class="pkgDate"> ~ 2020/05/20 까지</p>
								</div>
								<p class="pkgReserv">
									<button class="pkgReservBtn">지금 바로 예약</button>
								</p>
						</div>
			
					</div>
				</div>
			</section>
	<%@ include file="../../include/userFooter.jsp"%>
</body>

<script>
	$(function(){
		$(".pkgReservBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tourlandProductDetail";
		})   
	})
</script>   
</html>