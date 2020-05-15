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
							  margin-left: 200px; position: relative;
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
	
	
	section nav ul li:nth-child(2) {
	 background: mistyrose;
   }	    
    #introBox{
      margin-left:40px;
      width:100%;
      height: 100%; text-align: center;
      position: relative;fd
    }
    #introBox ul{
      margin-bottom: 20px;
    } 
   #introBox ul li{
      margin-left:35px;
      display: list-item;
   }
   
   #introBox img{
     opacity: 0.8;
   }
   span.needBlank{
      margin-left:15px;
   }
   
   #adH2{
     position: absolute;
     top:40px;
     left:140px;
     letter-spacing: 0.1em;
   }
   #adP{
     position: absolute;
     top:360px;
     right:140px;
     color: white;
     font-weight: bold;
     letter-spacing: 0.1em;
   }
   #aMail{
     text-decoration: none;
     padding:15px;
     background: mistyrose;
   }
   #pasteMsg{
     line-height:50px;
     text-align:center;
     width: 300px;
     height: 200px;
     background: mistyrose;
     position: absolute; top: 700px; left: 400px;
     z-index: 1;
     border-radius: 20px;
     display: none;
     
   }
   
</style>

<body>   
	
		<section id="introSection">
		<%@ include file="../../include/userFooterMenu.jsp"%>   
				<div id="myreserv">
				    <div id="pasteMsg">
				       <p>이메일 주소가 클립보드에 복사되었습니다. <br>
				       ctl+V로 붙여넣기하세요</p>
				       <button style="padding:10px; margin-top:20px;" id="adBtn">확인</button>
				    </div>
					<div id="mapHeaderWrap">
						<h1>제휴문의</h1>
						<span id="info">to world with TOURLAND</span>
					</div>
					<div id="introBox">
					   <img src="${pageContext.request.contextPath }/resources/images/advertising.jpg" style="width:800px; height: 400px;">
					   <h2 id="adH2">패키지 전문 여행사 TOURLAND</h2>
					   <p id="adP">투어랜드의 마케팅제휴 파트너가 되어주세요.</p>
					   <hr style="margin-top:20px; font-weight: bolder;">
					   
					   <p style="margin-top:90px;">문의 메일을 남겨주시면 담당 직원이 확인 후 연락 드리겠습니다 </p>
					   <br>
					   <br>
					   <p>E-mail : lindacoco0204@gmail.com</p>
					   <br><br>
					<a href="mailto:'lindacoco0204@gmail.com'" id="aMail"> 바로 메일 보내기</a>
					
					</div>
					
					
				</div>
		     
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>