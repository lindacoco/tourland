<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/6f2f0f2d95.js"></script>

<style>
	/* 본문 */
	div#mainBox { width: 1200px;
				  margin: 0 auto; }
	
	
	/* 메인1 (사진 3개 있는 부분) */
	section#section1 { width: 1200px;}
	section#section1 div#imgBox { width: 1200px;
								  height: 400px;
							      margin-top: 30px;  }
	section#section1 div#imgBox .box1 { width: 810px; height:400px; float: left;}
	section#section1 div#imgBox .box1 img { width: 100%; height: 100%;} 
	section#section1 div#imgBox .box2 { width:380px; height: 195px; float: right;}
	section#section1 div#imgBox .marg { margin-bottom: 10px;}
	section#section1 div#imgBox .box2 img { width: 100%; height: 100%; }
	
	/* 메인2 (검색 박스 있는 부분) */
	section#section2 { background: #bcbcbc; 
					   height: 180px;
					   margin-top: 30px; }
	section#section2 h2 { height: 40px;
						  border-bottom: 1px solid #696969; 
						  margin-bottom: 10px; }					   
	section#section2 .divBox { width:160px;	
							   float: left; 
							   padding: 15px 0;}
	section#section2 #inOutDiv { margin-left: 40px; }						   
	section#section2 #dateDiv { width: 220px; }
	section#section2 #searchDivBtn { text-align: center;
								     line-height: 130px;
								     margin-left: 70px;  }
	section#section2 #searchDivBtn button { width: 150px;
											height: 30px; 
											background: #ff7f00;
											border: none; }								     
								     
	/* 메인3 (특가 상품들 있는 부분) */
	section#section3 { height: 600px;  margin-top: 30px; }
	section#section3 a { text-decoration: none;  }					   
	section#section3 #first { width: 580px; height: 270px;  } 
	section#section3 #first img { width: 100%; height: 100%; }
	section#section3 .popular { width: 280px; 
							    height: 270px; 
							    float: left; 
							    padding:10px; 
							    position: relative; }
	section#section3 .popular img { width: 100%; height: 100%; }
	section#section3 .popular h3 { position: absolute; 
								   top: 20px; left: 30px;
								   color: #ff7f00; 
								   text-shadow: 1px 1px 1px #000;}
	section#section3 .popular p { position: absolute; 
								  top: 50px; left: 30px;
								  color: #fff;}
	section#section3 #popInfo { width: 580px; height: 60px; 
						        background: rgba(0,0,0,0.7); 
						        position: absolute; top: 220px;
						        text-align: center;
							    font-size: 20px;
							    color: #fff;
								line-height: 60px; 							     					     
						       }
	section#section3 .popInfo2 { width: 280px; height: 60px; background: rgba(0,0,0,0.7); 
						        position: absolute; top: 220px;
						        text-align: center;
							    font-size: 15px;
							    color: #fff;
								line-height: 60px; }	
	
	/* 메인4 (배너 있는 부분) */							
	section#section4 { margin-top:30px;  height:200px;  }	
	section#section4 .bannerBox { width: 560px; height: 200px; 
								  float: left; 
								  position: relative;
								  }											       	 
	section#section4 .bannerBox img { width: 100%; height: 100%; }
	
	section#section4 .bannerBox h3 { position: absolute; 
								     top: 20px; left: 20px; 
								     font-size: 25px; 
								     color: #ff7f00; 
								   	 text-shadow: 1px 1px 1px #000; }
	section#section4 .bannerBox p { position: absolute; top: 60px; left: 20px; color: #fff; }	
	section#section4 #banner1 { margin-right: 70px; }  
	
	
	/* 메인5 (상담 시간, 업무시간, Q&A 버튼들 있는 부분) */
	section#section5 { margin-top: 30px; width: 100%;  height: 300px; }
	section#section5 .infoBox {  height: 200px; float: left; border: 1px solid #c8c8c8; }
	section#section5 div#counsel { width: 360px; }
	section#section5 .infoBox h3 { font-size: 20px; margin: 10px; }
	section#section5 .infoBox p { text-align: center; height: 60px; line-height: 60px;}
	section#section5 .big { font-size: 50px; font-weight: bold;}
	section#section5 div#workTime {  width: 200px;}
	section#section5 div#workTime .bold { font-weight: bold; } 
	section#section5 div#shortcutBtns {  width: 560px; margin-left: 70px; border: none;  }
	section#section5 div#shortcutBtns a { display: block; 
									      text-decoration: none; 
									      width: 250px; 
									      height: 60px;
									      background: #20b2aa;
									      line-height: 60px;
									      color: #fff;
									      text-align: center;
									      border: 1px solid #c8c8c8;
									      float: left; 
									      margin: 20px 10px 10px 10px; }
									      
	/*팝업스타일 */
	 #popup1{
      margin-left:100px;
      float:left;
      text-align:center;
      width:560px;
      height: 600px;
      position: relative;
      position: absolute;
      top: 150px;
       display: none;
    }
    
    #popup2{
      margin-left:100px;
      float:left;
      text-align:center;
      width:560px;
      position: relative;
      position: absolute;
      top: 250px;
      left:100px;
      display: none;
    }
    
    #previewPopup1{
    width:400px;
    box-shadow: 0 0 8px black;
    position: absolute;
    left:85px;
    top:50px;
  }
  
   #previewPopup2{
    width:400px;
    box-shadow: 0 0 8px black;
    position: absolute;
    left:85px;
    top:50px;
  }
  
   p.popupClose{
     width:400px;
     position: absolute;
     top:400px;
     left:0;
     padding-bottom: 10px;
     box-shadow: 0 0 8px black;
   }
   input.expireCK{
     margin-right:10px;
     margin-top:13px;
   }
   button.popupBtnClose{
     margin-left:20px;
     width:30px;
   }
   
									      
</style>
<body>
	<div id="container">
	<%@ include file="../include/userHeader.jsp"%>
<!-- 쿠키 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>

	  $(function(){
		  
		  if($.cookie("popup1") != null ){ 
		         $("#popup1").css("display","block"); 
		      }
		  
		  if($.cookie("popup2") != null ){ 
		         $("#popup2").css("display","block"); 
		      }
		 // alert($.cookie("exeptFor3days"));
		  if($.cookie("exeptFor3days") == "none"){ 
		         $("#popup1").css("display","none"); 
		      }
		  if($.cookie("exeptFor3days2") == "none"){ 
		         $("#popup2").css("display","none"); 
		      }
		  //팝업 버튼 누르면 팝업창 사라지기 popup1
		  $(".popupBtnClose").click(function(){
			  if($(".expireCK").prop("checked") ==true ){
	              $.cookie("exeptFor3days","none",{expires:3, path:"/"});
		   }
			 $(this).parent().parent().parent().css("display","none");
	      })
	     $(".popupBtnClose2").click(function(){
			  if($(".expireCK2").prop("checked") ==true ){
	              $.cookie("exeptFor3days2","none",{expires:3, path:"/"});
		   }
			 $(this).parent().parent().parent().css("display","none");
	  })
	  
  })
	  
</script>
	        <!-- 팝업 -->
	         <div id="popup1" style=" margin-left:10%;">  <!-- 1번 팝업 -->
	                        <c:if test="${popup1 == null }">
	                            <div id="previewPopup1">
	                              <img src="${pageContext.request.contextPath}/resources/images/event1.jpg" style="width:400px; height:400px;" id="popup1img">
	                              <p class="popupClose" style="background:black;">
							          <input type="checkbox" class="expireCK">
							          <label for="expireCK" style="color:white">3일동안 이 창 열지 않기</label> <!-- for -->
							          <button class="popupBtnClose"> 닫기 </button>
						          </p>
	                            </div>
	                        </c:if>
	                        <c:if test="${popup1 != null }">
	                        <div id="previewPopup1">
	                             <img src="displayFile/popup?filename=${popup1}" style="width:400px; height:400px;" id="popup1Img">
	                             <p class="popupClose" style="background:black;">
							          <input type="checkbox" class="expireCK">
							          <label for="expireCK" style="color:white">3일동안 이 창 열지 않기</label> <!-- for -->
							          <button class="popupBtnClose"> 닫기 </button>
						         </p>
	                        </div>
	                        </c:if>
	          </div>
	           <div id="popup2" style=" margin-left:10%;"> <!-- 2번팝업  -->
	                        <c:if test="${popup2 == null }">
	                            <div id="previewPopup2">
	                              <img src="${pageContext.request.contextPath}/resources/images/event2.jpg" style="width:400px; height:400px;" id="popup1img">
	                              <p class="popupClose" style="background:black;">
							          <input type="checkbox" class="expireCK2">
							          <label for="expireCK" style="color:white">3일동안 이 창 열지 않기</label> <!-- for -->
							          <button class="popupBtnClose2"> 닫기 </button>
						          </p>
	                            </div>
	                        </c:if>
	                        <c:if test="${popup2 != null }">
	                        <div id="previewPopup2">
	                             <img src="displayFile/popup?filename=${popup2}" style="width:400px; height:400px;" id="popup1Img">
	                             <p class="popupClose" style="background:black;">
							          <input type="checkbox" class="expireCK2">
							          <label for="expireCK" style="color:white">3일동안 이 창 열지 않기</label> <!-- for -->
							          <button class="popupBtnClose2"> 닫기 </button>
						         </p>
	                        </div>
	                        </c:if>
	          </div>
	          
			<div id="mainBox">  
				<section id="section1">
					<div id="imgBox">
						<div class="box1">
							<img src="images/cancun.jpg">
						</div>
						<div class="box2 marg">
							<img src="images/hotel.jpg">
						</div>
						<div class="box2">
							<img src="images/jeju.jpg">
						</div>
					</div>
				</section>
				
				<section id="section2">
					<div id="inOutDiv" class="divBox">
						<h2>구분</h2>
						<p><input type="radio" name="out" >해외</p>
						<p><input type="radio" name="in" >국내</p>
					</div>
					<div id="tourDiv" class="divBox">
						<h2>상세 구분</h2>
						<p><input type="radio" name="out" >항공</p>
						<p><input type="radio" name="in" >호텔</p>
						<p><input type="radio" name="in" >현지 투어</p>
						<p><input type="radio" name="in" >렌트카</p>
					</div>
					<div id="fromDiv" class="divBox">
						<h2>출발지</h2>
						<select>
							<option>선택</option>
							<option>서울</option>
							<option>부산</option>
							<option>대구</option>
						</select>
					</div>
					<div id="toDiv" class="divBox">
						<h2>도착지</h2>
						<select>
							<option>선택</option>
							<option>일본</option>
							<option>동남아</option>
							<option>중국</option>
							<option>홍콩/마카오/대만</option>
							<option>유럽</option>
							<option>미주</option>
							<option>괌/사이판</option>
						</select>
					</div>
					<div id="dateDiv" class="divBox">
						<h2>출발 날짜</h2>
						<p id="datePick">
							<span><i class="far fa-calendar-alt"></i> 날짜별 검색</span> 
							<span id="picker"><input type="text" id="date" name="date" placeholder="날짜를 선택하려면 클릭하세요."></span>
							<span id="pickSearch"><a href="#"><i class="fas fa-search"></i></a></span>
						</p>
					</div>
					<div id="searchDivBtn" class="divBox">
						<button>검색</button>
					</div>
				</section>
				
				<section id="section3">
					<div class="popular" id="first">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/camping.jpg">
							<div id="popInfo">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>여름 휴가 랭킹 1위</h3>
							<p>서울 출발</p>
							<img alt="" src="images/polynesia.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/flowers.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/flowers.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/flowers.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/flowers.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
					<div class="popular">
						<a href="#">
							<h3>특가 상품</h3>
							<p>친구와 같이 떠나는 상품</p>
							<img alt="" src="images/flowers.jpg">
							<div class="popInfo2">
								~ 4/30일 까지 단독 할인
							</div>
						</a>
					</div>
				
				</section>
				<section id="section4">
				<c:if test="${banner1 ==null }">
					<div class="bannerBox" id="banner1">
						<h3>그리스 + 산토리니 5박 6일</h3>
						<p>마지막 찬스, 서울 출발</p>
						<img alt="" src="images/santo.jpg">
					</div>
				</c:if>
				<c:if test="${banner1 !=null }">
					<div class="bannerBox" id="banner1">
						<h3>${banner1.title }</h3>
						<p>${banner1.content }</p>
						<img alt="" src="displayFile/banner?filename=${banner1.pic}">
					</div>
				</c:if>
				<c:if test="${banner2 ==null }">
					<div class="bannerBox">
						<h3>진짜 오사카를 만나다</h3>
						<p>간사이 미니 패스, 대구 출발</p>
						<img alt="" src="images/osaka.jpg">
					</div>
				</c:if>
				<c:if test="${banner2 !=null }">
					<div class="bannerBox">
						<h3>${banner2.title }</h3>
						<p>${banner2.content }</p>
						<img alt="" src="displayFile/banner?filename=${banner2.pic}">
					</div>
				</c:if>
				</section>
				
				<section id="section5">
					<div id="counsel" class="infoBox">
						<h3>여행 상담</h3>
						<p>고객 센터</p>
						<p class="big">1588-0000</p>
					</div>
					
					<div id="workTime" class="infoBox">
						<h3>업무 시간</h3>
						<p><span class="bold">평일 </span>09:00 ~ 18:00</p>
						<p><span class="bold">주말/공휴일 </span>휴무</p>
					</div>
					
					<div id="shortcutBtns" class="infoBox">
						<a href="${pageContext.request.contextPath }/tourlandBoardNotice">공지사항</a>
						<a href="${pageContext.request.contextPath }/tourlandBoardFAQ">FAQ</a>
						<a href="${pageContext.request.contextPath }/tourlandCustBoard">고객의 소리</a>
						<a href="${pageContext.request.contextPath }/tourlandProductBoard">상품 문의사항</a>
					</div>
				</section>
				
			</div>
		<%@ include file="../include/userFooter.jsp"%> 
	</div>
</body>
</html>