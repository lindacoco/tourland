<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/userHeader.jsp"%>
</head>
<style>    
	/* 본문 */
	section#introSection { width: 1200px; height: 1000px; margin: 0 auto;}
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
	
	section div#myreserv { width:1000px; height: 1000px; 
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
	
	
	section nav ul li:nth-child(1) {
	 background: mistyrose;
   }	    
    #introBox{
      margin-left:40px;
      width:100%;
      height: 100%; text-align: center;
    }
    #introBox ul{
      margin-bottom: 20px;
    } 
   #introBox ul li{
      margin-left:35px;
      display: list-item;
   }
   span.needBlank{
      margin-left:15px;
   }
</style>
<body>   
	
		<section id="introSection">
		<%@ include file="../../include/userFooterMenu.jsp"%>   
				<div id="myreserv">
					<div id="mapHeaderWrap">
						<h1>회사소개</h1>
						<span id="info">투어랜드를 소개합니다.</span>
					</div>
					<div id="introBox">
					   <img src="${pageContext.request.contextPath }/resources/images/introductionpage.jpg">
					   <p style="margin-top:30px;">투어랜드는 고객님과의 관계를 가장 최우선으로 생각합니다.</p>
					   <p>고객님들의 여행이 최고의 기억으로 남을 수 있도록 최선을 다하겠습니다.</p>
					   <p>궁금한 점이 있으시면 365일 24시간 운영하는 투어랜드 고객센터로 문의주세요.</p>
					</div>
				</div>
		     
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>