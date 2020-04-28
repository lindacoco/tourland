<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>          
<meta charset="UTF-8">
</head>
<style>
	h2 { font-weight: bold;
		 padding-bottom: 10px;       
		 border-bottom: 1px solid gray; }       
	.form-group { width: 200px; margin: 20px; float: left; }
	.group { width: 100%;  height: 100px; }
	#guide { text-indent: 10px; }
</style>
<body>      
	<div class="container">         
		<div class="row">   
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
		 			 <h2>항공 스케줄 추가</h2>
		 		 </div>
		  <p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
		  <form class="form-inline" action="/action_page.php">
		  <div class="group">
		    <div class="form-group">   
		      <label>국가</label>
		       <div class="container">   
				     <div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">국가 선택
					    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">대한민국</a></li>   
						      <li><a href="#">오스트레일리아</a></li>
						      <li><a href="#">벨기에</a></li>        
						      <li><a href="#">브라질</a></li>
						      <li><a href="#">캐나다</a></li>
						      <li><a href="#">중국</a></li>   
						      <li><a href="#">일본</a></li>
						      <li><a href="#">프랑스</a></li>
						      <li><a href="#">독일</a></li>       
						      <li><a href="#">홍콩</a></li>
						    </ul>
					  </div>
				</div>        
		    </div>  
		    </div>
		    <div class="group">
		    <div class="form-group">
		      <label>구분</label>
				    <div class="container">                                   
						  <div class="dropdown">
						    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">여행 선택
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">왕복</a></li>
						      <li><a href="#">편도</a></li>
						      <li><a href="#">다구간</a></li>
						    </ul>
						  </div>
					</div>
		   </div> 
		    <div class="form-group">  
		      <label>구분</label>
				    <div class="container">                                   
						  <div class="dropdown">
						    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">비행 선택
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">직항</a></li>
						      <li><a href="#">경유</a></li>
						    </ul>
						  </div>
					</div>   
		    </div>
		    </div>
		    <div class="group">
			     <div class="container">    
				    <div class="form-group">
						  <label>항공사 코드</label>
						  <input type="text" class="form-control" id="FCode">
					</div>
				    <div class="form-group">
						  <label>편명</label>
						  <input type="text" class="form-control" id="FName">
					</div>
				</div>
			</div>
			<div class="group">
			<div class="form-group">   
		      <label>출발지</label>
				    <div class="container">                                   
						  <div class="dropdown">
						    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">출발지 선택
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">인천 공항</a></li>
						      <li><a href="#">김해 국제 공항</a></li>
						      <li><a href="#">대구 공항</a></li>
						    </ul>
						  </div>
					</div>
		    </div>
			    <div class="form-group">   
			      <label>도착지</label>
					    <div class="container">                                   
							  <div class="dropdown">
							    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">도착지 선택
							    <span class="caret"></span></button>
							    <ul class="dropdown-menu">
							      <li><a href="#">히드로 공항</a></li>
							      <li><a href="#">애버딘 국제 공항</a></li>
							      <li><a href="#">캠브리지 공항</a></li>
							      <li><a href="#">리버풀 공항</a></li>
							    </ul>
							  </div>
						</div>
			    </div>
		    </div>
		    <div class="group">
		    <div class="form-group">   
		      <label>출발시간</label>
				    <div class="container">                                   
						  <div class="dropdown">
						    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">출발시간 선택
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">7:00AM</a></li>
						      <li><a href="#">8:00AM</a></li>
						      <li><a href="#">9:00AM</a></li>
						      <li><a href="#">10:00AM</a></li>
						      <li><a href="#">11:00AM</a></li>
						      <li><a href="#">12:00PM</a></li>
						      <li><a href="#">13:00PM</a></li>
						      <li><a href="#">14:00PM</a></li>
						      <li><a href="#">15:00PM</a></li>
						      <li><a href="#">16:00PM</a></li>
						      <li><a href="#">17:00PM</a></li>
						      <li><a href="#">18:00PM</a></li>
						      <li><a href="#">19:00PM</a></li>
						      <li><a href="#">20:00PM</a></li>
						      <li><a href="#">21:00PM</a></li>
						      <li><a href="#">22:00PM</a></li>
						      <li><a href="#">23:00PM</a></li>
						    </ul>
						  </div>
					</div>
		    </div>
		    <div class="form-group">   
		      <label>도착시간</label>
				    <div class="container">                                   
						  <div class="dropdown">
						    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">도착시간 선택
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu">
						      <li><a href="#">7:00AM</a></li>
						      <li><a href="#">8:00AM</a></li>
						      <li><a href="#">9:00AM</a></li>
						      <li><a href="#">10:00AM</a></li>
						      <li><a href="#">11:00AM</a></li>
						      <li><a href="#">12:00PM</a></li>
						      <li><a href="#">13:00PM</a></li>
						      <li><a href="#">14:00PM</a></li>
						      <li><a href="#">15:00PM</a></li>  
						      <li><a href="#">16:00PM</a></li>
						      <li><a href="#">17:00PM</a></li>
						      <li><a href="#">18:00PM</a></li>
						      <li><a href="#">19:00PM</a></li> 
						      <li><a href="#">20:00PM</a></li>
						      <li><a href="#">21:00PM</a></li>
						      <li><a href="#">22:00PM</a></li>
						      <li><a href="#">23:00PM</a></li>
						    </ul>
						  </div>
					</div>
		    </div>
		    </div>   
		    <div class="group">
			    <div class="form-group">
					  <label>최대 인원 수</label>
					  <input type="text" class="form-control">
				</div>
				<div class="form-group">
					  <label>좌석 수</label>
					  <input type="text" class="form-control">
				</div>
			</div>
			<div class="group">
				<div class="form-group">
			    	<button type="submit" class="btn btn-default">Submit</button>
			    </div>
		    </div>
		  </form>
		</div>                  
		</div>     
	</div>  
	</div>             
</body>
</html>
<%@ include file="../../include/footer.jsp"%>