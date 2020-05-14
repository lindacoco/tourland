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
	  left:470px;
	  font-size: 60px;
	  font-weight:bold;
	  color:white;
	  letter-spacing: 0.35em;
	}
	div.eventBox{
	  width:330px;
	  float:left;
	  margin: 30px 0 70px 0;
	  text-align: center;
	  font-weight: bolder;
	}
	div.eventBox img{
	  width:200px;
	  height: 200px;
	}
	#eventMainDiv{
	 clear:both;
	}
	.event3{
	cursor: pointer;
	float:left;
	margin:30px 0 50px 100px;
	width:200px; text-align: center; height: 40px; line-height: 40px; margin-left:100px; border-radius: 20px;
	}
	
	#evnetContentDiv{
	  margin: 50px auto 100px;
	  text-align: center;
	}
	
	button.toTop{
	  border:none; 
	  background: none; 
	  position: absolute; 
	  bottom: 5px; 
	  right: 10px;
	}
	button.returnBTN{
	  border:none; 
	  background: none; 
	  position: absolute; 
	  top:0;
	  right:10px;
	}
	
</style>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	   <div id="eventPageDiv">
			<img src="${pageContext.request.contextPath }/resources/images/eventPage.jpg" style="width:100%; height:550px;">
			<p id="eventPageP">TOURLAND BIG EVENT</p>
	   </div>
	   
	  <section id="eventSection">
	     
		<!--  이벤트 정보 출력  -->
		   <div id="evnetContentDiv" style="position: relative;">
		        <button class="returnBTN"> 이전으로  </button>
		        <br><br>
			   <c:if test="${eventVO !=null }">
			      <h2 style="letter-spacing: 0.5em;"><i class="fas fa-bell"></i> ${eventVO.title } <i class="fas fa-bell"></i></h2><br><br><br>
			      <h3 style="color:tomato;">이벤트 기간</h3>
			      <h4 style="letter-spacing: 0.1em;"><fmt:formatDate value='${eventVO.startdate }' pattern="yyyy-MM-dd"/> ~  <fmt:formatDate value='${eventVO.enddate }' pattern="yyyy-MM-dd"/></h4>
			      <br><br>
			     ${eventVO.content }
			   </c:if>
			   <button class="toTop"> <i class="fas fa-chevron-up"></i>위로</button>
		   </div>   
		   
	  </section>
	<%@ include file="../../include/userFooter.jsp"%>
</body>

<script>
  
	$(function(){
		
		$('.toTop').click( function() {
			$('html, body').animate({ scrollTop : 700 }, 600); //이벤트 사진 전까지 이동 스르륵
			return false;
		} );
		//이전페이지
		$(".returnBTN").click(function(){
			history.go(-1);  
		})
	})
</script>   
</html>