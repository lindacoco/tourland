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
	
	section div#writeReview { width:1000px; height: 100%; 
							  margin-left: 200px;
							 }
	section div#writeReview h1 { width: 200px;
								 height: 30px;  
							     padding: 20px;
							     border-bottom: 1px solid #929292; }							  
	section div#writeReview form { width: 500px; 
								   margin: 0 auto;
								  }
	section div#writeReview label { width: 120px;
								    float: left;
								    font-weight: bold;}
	section div#writeReview p { height: 60px; }
	section div#writeReview input { width: 250px; height: 30px; 
									border: none; border-bottom: 1px solid #929292;}
	.red { color: red;}
	section div#writeReview #btns button { width: 200px; height: 30px; 
										   border: none; }

	section div#writeReview #withdraw { background: maroon; color: #fff; }
	
	section div#writeReview #inputs input { width: 200px; height: 30px; 
										    border: none; }
	#inputs input#submit { background: steelblue; color: #fff; }		
	#info { font-size: 13px; color: #929292; 
			margin-left: 10px;  }
   
	/* 추가한 부분  */
	div#writeReview p#long { height:250px; }	
	div#writeReview textarea { overflow: scroll;}		
	#proImgBox { height: 100px;}
	#proImgBox img { width: 200px; }
	div#proImgBox #proTitle { height:30px; font-weight: bold; color: maroon;}   
</style>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userMyPageMenu.jsp"%>   
			
				<div id="writeReview">
				<h1>리뷰 작성</h1>
				<span id="info">고객님의 소중한 리뷰를 작성해주세요.</span>
					<form>
						<p>
							<label>번호</label>     
							<span>RV001</span>
						</p>
						<p>
							<label>고객명</label>
							<input type="text" name="name" value="김땡땡" readonly="readonly">
						</p>
						<p>
							<label>상품</label>
							<div id="proImgBox">
							<p id="proTitle">[도쿄 3일] 도쿄 디즈니랜드_도쿄시내/맛집투어_바로 출발!</p>
								<img src="images/dokyo1.jpg">
							
							</div>
						</p>	
						<p>
							<label><span class="red">*</span> 리뷰 제목</label>
							<input type="text" placeholder="리뷰 제목을 입력하세요.">
						</p>
						<p id="long">
							<label><span class="red">*</span> 리뷰 내용</label>    
							<textarea rows="10" cols="60"></textarea>
						</p>
						
						<p id="inputs">
							<input type="submit" id="submit" value="등록"  style="cursor:pointer">
							<input type="reset" value="취소"  style="cursor:pointer">
						</p>
					</form>
				</div>
		
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>