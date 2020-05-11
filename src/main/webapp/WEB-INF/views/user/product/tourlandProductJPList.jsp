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
					<section>
				<div id="pkgTitleBox">
					<h1>일본</h1>
					<div id="pkgInfo">
				<p>여행해야 할 이유 3가지: 쇼핑, 편리한 대중 교통, 음식 매력 포인트 3가지: 쇼핑편리한 대중 교통음식
					스시, 사무라이, 헬로 키티, 가라오케, 게이샤 등을 한데 넣고 섞어놓으면 도쿄에 관한 클리셰(Cliché)가 완성되지
					않을까요? 실은 이보다 훨씬 더 많은 문화가 감춰진 21세기 최첨단 도시가 도쿄인데 말이죠. 첫 방문객에게 시부야의
					복잡한 거리는 좀 과할 수 있겠지만 자세히 들여다보면 초 단위로 정확한 대중교통과 완벽하게 관리된 깨끗한 거리가 눈에
					들어오실 거예요. 신주쿠와 하라주쿠에서 일본의 젊은이들과 함께 바쁜 오후를 즐기다가 아사쿠사와 메이지 사원에서 일본
					전통문화에 빠져보는 건 어떨까요? 신주쿠교엔에선 도시의 복잡함을 떠나 마음의 평화를 되찾을 수 있답니다!</p>
					</div>
					<div id="pkgMap">
						
					</div>
			
				</div>
				<div id="pkgContentBox">
					<div id="pkgSearch">
						<h3>검색</h3>
						<p>체크인 날짜</p>
						<input type="text">
						<p>체크인 날짜</p>
						<input type="text">
						<p>인원</p>
						<select>
							<option>성인 2명</option>
							<option>성인 3명</option>
							<option>성인 4명</option>
							<option>성인 5명</option>
							<option>성인 6명</option>
							<option>성인 7명</option>
							<option>성인 8명</option>
							<option>성인 9명</option>
							<option>성인 10명</option>
							<option>성인 11명</option>
							<option>성인 12명</option>
							<option>성인 13명</option>
							<option>성인 14명</option>
							<option>성인 15명</option>
							<option>성인 16명</option>
							<option>성인 17명</option>
							<option>성인 18명</option>
							<option>성인 19명</option>
							<option>성인 20명</option>
						</select>
						<p id="pkgBtnBox">
						<button id="pkgSearchBtn">검색</button>
						</p>
					</div>
					
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
						<div class="pkgListBox">
								<div class="pkgImg"><img src="${pageContext.request.contextPath}/resources/images/disney.jpg"></div>
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