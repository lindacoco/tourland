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
	section { width: 1200px; height: 800px; margin: 0 auto;}
	section nav { width: 200px; 
				  background: #f4f4f4;
				  height: 100%;
				  float: left; }			  
	section nav ul li { height: 30px; 
						padding: 10px; }							
	section nav ul li a { display: block;
						  text-indent: 10px; 
						  line-height: 30px; }
	section nav ul li:hover { background: #ff7f00; }						  				  	
	
	section div#myreserv { width:1000px; height: 100%; 
							  margin-left: 200px;
							 }
	div#mapHeaderWrap {   margin-bottom: 50px; }							 							 	
	section div#myreserv h1 { width: 200px;
								 height: 30px;  
							     padding: 20px;
							     border-bottom: 1px solid #929292; }							  
	#info { font-size: 13px; color: #929292; 
			margin-left: 10px;  }	  
	div#mapImgBox { width: 400px; height: 600px; float: left; margin-left: 40px;  }
	div#mapImgBox img { width: 100%; height: 400px;  }	
	div#mapInfoBox { width: 500px; height: 500px; overflow: hidden; float: left; }
	div#mapInfoBox p {  height: 60px;}			    
	#mapTitle { font-size: 30px; font-weight: bold;text-indent: 20px;}
	#mapAddr { font-size: 17px; text-indent: 50px;}
	#mapBtnBox {  }	
	#mapBtnBox a { text-decoration:none;
				   display:block;
				   width: 150px; height: 30px;
				    border: none; background: #ededed;
				     text-align: center; 
				     margin-left: 50px; }	
	.red { color: maroon; }
	.blue { color: steelblue; }
	.green { color: forestgreen; }
	.yel { color: goldenrod; }	
		    
</style>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userFooterMenu.jsp"%>   
				<div id="myreserv">
					<div id="mapHeaderWrap">
						<h1>찾아오시는 길</h1>
						<span id="info">투어랜드로 오시는 길</span>
					</div>
					<div id="mapImgBox">
						<img src="${pageContext.request.contextPath}/resources/images/tourlandBuilding.jpg">
					</div>
					<div id="mapInfoBox">
						<p id="mapTitle"><i class="fas fa-map-marker-alt"></i>대구 본점</p>
						<p id="mapAddr">대구시 달서구 서구 222</p>
						
					<div id="mapBtnBox">
						<a href="https://www.google.com/maps/place/(%EC%A3%BC)%EC%98%81%EB%82%A8%EC%9D%B8%EC%9E%AC%EA%B5%90%EC%9C%A1%EC%9B%90/@35.8605453,128.5549223,17z/data=!3m1!4b1!4m5!3m4!1s0x3565e462e0b47b7d:0x2479044e92eb2993!8m2!3d35.860541!4d128.557111"><span class="blue">G</span><span class="red">o</span><span class="yel">o</span><span class="blue">g</span><span class="green">l</span><span class="red">e</span> 지도 보기</a>
					</div>
					</div>
				</div>
		
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>