<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#eventSection{
	  width: 1000px;
	  margin: 0 auto;
	  height: auto;
	}
	#eventPageDiv{
	  position: relative;
	}
	#eventPageP{
	  position: absolute;
	  top:430px;
	  left:520px;
	  font-size: 60px;
	  font-weight:bold;
	  color:white;
	  letter-spacing: 0.35em;
	}
	div.eventBox{
	  width:330px;
	  float:left;
	  margin: 30px 0 30px 0;
	  text-align: center;
	  font-weight: bolder;
	}
	div.eventBox img{
	  width:300px;
	}
	
	#evenIng{
	background:mistyrose; width:200px; text-align: center; height: 40px; line-height: 40px; margin-left:15px;
	}
	
</style>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	   <div id="eventPageDiv">
			<img src="${pageContext.request.contextPath }/resources/images/eventPage.jpg" style="width:100%; height:550px;">
			<p id="eventPageP">TOURLAND BIG EVENT</p>
	   </div>
	       
			<section id="eventSection">
			<p id="evenIng">진행중 이벤트</p>	
			
			<c:forEach var="eventList" items="${eventList }">
			<div class="eventBox" data-click="1">
				<img src="${pageContext.request.contextPath }/resources/images/banner2.jpg">
				<p>${eventList.title }</p>
		    </div>
		    </c:forEach>
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