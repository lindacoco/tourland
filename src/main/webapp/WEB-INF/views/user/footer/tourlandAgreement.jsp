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
	
	
	section nav ul li:nth-child(3) {
	 background: mistyrose;
   }	    
    #agreementBox{
      width:100%;
      height: auto;
    }

</style>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userFooterMenu.jsp"%>   
				<div id="myreserv">
					<div id="mapHeaderWrap">
						<h1>이용약관</h1>
						<span id="info">상세항목을 확인해주세요</span>
					</div>
					<div id="agreementBox">
					<h3>제1조 (목적)</h3>
						<ul>
						  <li></li>
						
						</ul>
					</div>
				</div>
		
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>