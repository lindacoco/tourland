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
	div#bigImgBox img { height : 300px; width: 100%; }
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
	<script>
		$(function(){
			$("#smallImgBox li").each(function(i,obj){
				$(this).find("img").attr("src",$("#proDetail img").eq(i).attr("src"));
			})
		})
	</script>
		<section>
				<div id="proBox">
					<h1>${vo.pname}</h1>
					<div id="imgBox">
						<div id="bigImgBox">
							<img src="displayFile/product?filename=${vo.pic}">
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
							<li id="infoNo">상품 번호 : <span id="pno">P${vo.pno}</span></li>
							<li id="infoName"><span id="pname">${vo.pname}</span></li>
							<c:forEach var="air" items="${vo.air}" begin="0" end="0">
								<fmt:formatDate var="ddate" value="${air.ddate}" pattern="yyyy-MM-dd"/>
							</c:forEach>
							<li id="infoDate">출발일 : <span id="ddate">${ddate}</span></li>
							<li id="infoDays">여행 기간 : <span id="tourDays">${fn:substring(vo.pname,4,5)-1}박${fn:substring(vo.pname,4,6)}</span></li>
							<c:forEach var="t" items="${vo.tour}" begin="0" end="0">
								<c:set var="capacity" value="${t.capacity}"/>
							</c:forEach>
							<c:set var="N" value="${vo.pprice/capacity}"/>
							<fmt:formatNumber var="price" value="${N+(1-(N%1))%1}" type="number"/>
							<li id="infoPrice">가격 : <span id="price">${price}</span>원</li>
						</ul>
						<div id="btnsBox">
						<button id="doReserv">예약하기</button>
						<button id="doWish">장바구니</button>
					</div>
					</div>
					
				</div>
				<div id="proDetail">
					${vo.pcontent}
				</div>
			</section>
	<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>