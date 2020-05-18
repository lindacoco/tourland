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
section {
	width: 1000px;
	margin: 0 auto;
}

div#pkgTitleBox {
	height: 230px;
	border-bottom: 1px solid #ededed;
}

div#pkgTitleBox h1 {
	height: 80px;
	line-height: 80px;
}

div#pkgContentBox {
	padding-top: 50px;
}

div#pkgSearch {
	width: 300px;
	background: #ededed;
	float: left;
}

div#pkgSearch h3 {
	background: goldenrod;
	height: 50px;
	line-height: 50px;
	text-indent: 10px;
}

div#pkgSearch p {
	height: 50px;
	line-height: 50px;
	text-indent: 10px;
}

div#pkgSearch input {
	width: 90%;
	margin-left: 10px;
}

div#pkgSearch select {
	width: 90%;
	margin-left: 10px;
}

#pkgBtnBox {
	text-align: center;
}

button#pkgSearchBtn {
	border: none;
	width: 150px;
	height: 30px;
	background: #929292;
}

div#pkgListWrap {
	width: 650px;
	padding: 0 20px 20px 30px;
	overflow: hidden;
}

#totalCnt {
	font-weight: bold;
}

div#pkgOrderBy {
	height: 80px;
	line-height: 80px;
}

div#pkgOrderBy button {
	border: none;
	width: 100px;
	height: 30px;
}

div.pkgListBox {
	width: 90%;
	height: 210px;
	padding: 20px;
	border: 1px solid #ededed;
}

div.pkgImg {
	width: 250px;
	height: 180px;
	margin-right: 10px;
	float: left;
}

div.pkgImg img {
	width: 100%;
	height : 200px;
}

div.pkgInfoBox {
	width: 320px;
	height: 180px;
	overflow: hidden;
}

div.pkgInfoBox p {
	height: 40px;
}

div.pkgInfoBox .pkgTitle {
	height: 80px;
	font-size: 20px;
	font-weight: bold;
}

.pkgPrice {
	text-indent: 5px;
	font-size: 19px;
	color: maroon;
}

.pkgDate {
	text-align: right;
	font-size: 16px;
	font-weight: bold;
}

.pkgReserv {
	text-align: right;
}

.pkgReservBtn {
	border: none;
	width: 100px;
	height: 30px;
}
.pagination {
	list-style : none;
	margin-left : 150px; 
	margin-top : 10px;
}
.pagination li {
	padding : 10px;
	float : left;
	border : 1px solid lightgrey;
}
.pagination .active {
	background-color : grey;
}
</style>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	<section>
		<div id="pkgTitleBox">
			<h1>일본</h1> 
			<div id="pkgInfo">
				<p>전 세계적으로도 잘 알려진 관광대국이라 한국, 중국을 제외한 다른 국가에서도 또한 선호하는 관광국가이며, 국토 전반에 걸쳐 여러 인기 관광지가 산재하기 때문에 어지간한 지역은 관광 인프라가 잘 되어 있다. 
				홍콩/대만에서도 일본 여행을 가장 선호하며 중국 유커들은 일본 내에서 통 크게 소비한다. 다만 정부가 직접적으로 관광 산업에 개입한지는 오래 되지 않았다.</p>
			</div> 
			<div id="pkgMap"></div>

		</div>
		<div id="pkgContentBox">
			<div id="pkgSearch">
				<h3>검색</h3>
				<p>체크인 날짜</p>
				<input type="text" value="${cri.keyword2}" id="keyword2">
				<p>체크인 날짜</p>
				<input type="text" value="${cri.keyword3}" id="keyword3">
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
				<p id="totalCnt">
					도쿄 : 검색된 상품 <span id="totalCount">${count}</span>건
				</p>
				<div id="pkgOrderBy">
					<button id="byPrice">낮은 가격 순</button>
					<button id="byRoomType">호텔 객실 타입 순</button>
				</div>
				<c:forEach var="product" items="${list}">
				<div class="pkgListBox">
					<input type="hidden" value="${product.pno}" id="pno">
					<div class="pkgImg">
						<img src="displayFile/product?filename=${product.pic}">
					</div>
					<div class="pkgInfoBox">
						<p class="pkgTitle">${product.pname}</p>
						<c:forEach var="t" items="${product.tour}" begin="0" end="0">
							<c:set var="capacity" value="${t.capacity}"/>
						</c:forEach>
						<c:set var="N" value="${product.pprice/capacity}"/>
						<fmt:formatNumber var="price" value="${N+(1-(N%1))%1}" type="number"/>
						<fmt:formatDate var="expire" value="${product.pexpire}" pattern="yyyy/MM/dd"/>
						<p class="pkgPrice">${price}원 부터~</p>
						<p class="pkgDate">~ ${expire}까지</p>
					</div>
					<p class="pkgReserv">
						<button class="pkgReservBtn">지금 바로 예약</button>
					</p>
				</div>
				</c:forEach>
				<ul class="pagination">
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageContext.request.contextPath}/tourlandProductJPList?page=${pageMaker.startPage-1}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/tourlandProductJPList?page=${idx}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/tourlandProductJPList?page=${pageMaker.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
	<%@ include file="../../include/userFooter.jsp"%>
</body>

<script>
	$(function() {
		$(".pkgReservBtn").click(function() {
			var pno = $(this).parent().parent().find("#pno").val();
			location.href = "${pageContext.request.contextPath}/tourlandProductDetail?pno="+pno;
		})
	})
</script>
</html>