<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>          
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
​<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js">
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/datetimepickerstyle.css" />   
</head>
<style>
	h2 { font-weight: bold;
		 padding-bottom: 10px;       
		 border-bottom: 1px solid gray; }       
	.form-group { width: 200px; margin: 20px; float: left; }
	.group { width: 100%;  height: 100px; }
	#guide { text-indent: 10px; }
	.red { color: red; }
	#goToList { display: block; 
				width: 60px; height: 34px; 
				text-align: center;
				line-height: 34px;  
				border: 1px solid #979797;      
				border-radius: 3px;  
				text-decoration: none; }
	h3 { text-indent: 10px; font-weight: bold; }	
	#confirm  { display: block; margin:20px;
				width: 120px; height: 40px;    
				background: goldenrod; 
				line-height: 40px;
				border-radius: 5px;
				text-decoration: none;
				color: #fff; }   		              
</style>    
<script>
$(document).ready(function(){   
	 $('.dateTimePicker').datetimepicker({format:"YYYY-MM-DD",minDate : moment()});
	        $('#datepicker1').datetimepicker({
	            useCurrent: false
	        });
	        $('#datepicker2').datetimepicker({
	            useCurrent: false
	        });
	    
	}); 
	
</script>
<script>
function getFormatDate(date){
    var year = date.getFullYear()+"-";              //yyyy
    var month = (date.getMonth())+"-";          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '' + month + '' + day;
}

	$(function(){
		//등록 클릭 시
		$("#addFlight").click(function(){
			var dloca = $("#dloca").val(); //출발지
			var rloca = $("#rloca").val(); //도착지
			var seat = $("#seat").val();//좌석
			var ddate = $("#ddate").val(); //출발일
			var rdate = $("#rdate").val();
			var capacity = $("#capacity").val(); //최대 인원 수
			var price = $("#price").val();//가격
			
		})   
		//도착지 선택 시 
		$("#rloca").change(function(){
			var dloca = $(this).val(); //출발지   
				if(dloca=="인천"){
					$("#FCode").val("KA");
				}else if(dloca=="제주"){
					$("#FCode").val("KA");
				}
				else if(dloca=="일본"){
					$("#FCode").val("JA");
				}else{
					$("#FCode").val("AC");
				}   
		})/* 
		//도착지 선택 시 
		$("#rloca").change(function(){
			var dloca = $("#dloca").val();
			var rloca = $(this).val();
			if(dloca==rloca){
				alert("출발지와 도착지가 같습니다.");
				$("#rloca").val("도착지 선택");
				$("#FCode").val("");     
			}
		}) */
	
		//좌석 선택 시 
		$("#seat").change(function(){
			var seat = $(this).val();
			if(seat=="First-Class"){
				$("#capacity").val("5");
			}else if(seat=="Business-Class"){
				$("#capacity").val("10");
			}else{
				$("#capacity").val("30");
			}
		})
		
		//여행일 선택 시 
		$("#tourDays").change(function(){
			var dloca = $("#dloca").val(); //출발지
			var rloca = $("#rloca").val(); //도착지
			var tourDays = $(this).val(); //여행일
			var ddate = $("#ddate").val();//출발일자
			
			//출발일자를 설정 -> 여행일 설정 -> 여행일에 따라 도착 일자가 더해짐 
			var numArray = [3,5,7];
			var num;
			if(tourDays =="3"){
				num = 2;
			}else if(tourDays =="5"){
				num = 4;
			}else {
				num = 5; 
			}
			
			//input에서 가져온 출발 일자 string을 년, 월, 일로 나눠서 새로운 date 생성 
			var ddateY = ddate.substring(0, ddate.indexOf("-"));//2020
			var ddateM = ddate.substring(ddate.indexOf("-")+1,ddate.lastIndexOf("-"));//05
			var ddateD = ddate.substring(ddate.lastIndexOf("-")+1);//01
			
			var date = new Date(ddateY,ddateM,ddateD);   // 2020-05-01
			var newdate = new Date(date); //완성된 출발일자
			console.log(newdate.getDate() + "new");
			newdate.setDate(newdate.getDate()+num);  //여행일에 따라 달라지는 num 숫자를 날짜에 더해줌
			console.log(newdate.getDate() + " = 일자");
			console.log(tourDays);   
			var nd = new Date(newdate); //더해진 날짜 가져옴
			nd = getFormatDate(nd); //자바스크립트 함수로 fomatting 해줌 (yyyy-MM-dd 형식)
			
			//도착지 -> 항공사 코드 결정
			//좌석 -> 최대 인원수 결정
			//출발 일자 -> 도착 일자 결정
			//도착지, 여행일, 출/도착 여부 -> 편명 결정 
			if(dloca=="인천"){
				if(rloca=="제주"){
					if(tourDays==3){
						$("#dtime").val("AM 09:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("AM 10:15:00");
						$("#FName").val("301");
					}else if(tourDays==5){
						$("#dtime").val("AM 10:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("AM 11:15:00");
						$("#FName").val("311");   
					}else{
						$("#dtime").val("AM 11:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("AM 12:15:00");
						$("#FName").val("321");
					}
						
				}else if(rloca=="중국"){
					if(tourDays==3){
						$("#dtime").val("PM 12:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 13:15:00");
						$("#FName").val("201");
					}else if(tourDays==5){
						$("#dtime").val("PM 13:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 14:15:00");
						$("#FName").val("211");   
					}else{
						$("#dtime").val("PM 14:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 15:15:00");
						$("#FName").val("221");
					}
				}
				else if(rloca=="일본"){
					if(tourDays==3){
						$("#dtime").val("PM 15:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 16:15:00");
						$("#FName").val("101");
					}else if(tourDays==5){
						$("#dtime").val("PM 16:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 17:15:00");
						$("#FName").val("111");   
					}else{
						$("#dtime").val("PM 17:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val("PM 18:15:00");
						$("#FName").val("121");
					}
				}
			} 
		})
		
		//출발 스케줄 확정 클릭 시    
		$("#confirm").click(function(){     
			var dloca = $("#dloca").val(); //출발지
			var rloca = $("#rloca").val(); //도착지
			var seat = $("#seat").val();//좌석
			var rdate = $("#rdate").val(); //도착일
			var dtime = $("#dtime").val();//출발 시간  
			var rtime = $("#rtime").val();//도착 시간
			var price = $("#price").val();//가격
			var tourDays = $("#tourDays").val();//여행일
			var capacity = $("#capacity").val();
			
			if(dloca=="출발지 선택" || rloca=="도착지 선택" || seat=="좌석 선택" || rdate==""|| price=="" || dtime==""||rtime==""){
				alert("출발 스케줄의 모든 란을 선택/입력 해주세요.");	
				return false;     
			}else{
				if(dloca=="인천"){
					var seat = $("#seat").val();
					var FCode = $("#FCode").val();
					var rdate=  $("#rdate").val();
					if(rloca=="제주"){
						$("#dloca2").val("제주");
						$("#rloca2").val("인천");
						if(tourDays==3){    
							$("#seat2").val(seat);
							$("#FCode2").val(FCode);
							$("#ddate2").val(rdate);
							$("#dtime2").val("AM 09:30:00");  
							$("#rtime2").val("AM 10:45:00");
							$("#FName2").val("302");
							$("#capacity2").val(capacity);
						}else if(tourDays==5){
							$("#seat2").val(seat);
							$("#FCode2").val(FCode);
							$("#ddate2").val(rdate);
							$("#dtime2").val("AM 10:30:00");  
							$("#rtime2").val("AM 11:45:00");
							$("#FName2").val("312");
							$("#capacity2").val(capacity); 
						}else{
							$("#seat2").val(seat);
							$("#FCode2").val(FCode);
							$("#ddate2").val(rdate);
							$("#dtime2").val("AM 11:30:00");  
							$("#rtime2").val("PM 12:45:00");
							$("#FName2").val("322");
							$("#capacity2").val(capacity);
						}
							
					}else if(rloca=="중국"){
						if(tourDays==3){
							/* $("#dtime").val("PM 12:00:00");  
							$("#rtime").val("PM 13:15:00");
							$("#FName").val("201"); */
						}else if(tourDays==5){
							/* $("#dtime").val("PM 13:00:00");  
							$("#rtime").val("PM 14:15:00");
							$("#FName").val("211");  */  
						}else{
							/* $("#dtime").val("PM 14:00:00");  
							$("#rtime").val("PM 15:15:00");
							$("#FName").val("221"); */
						}
					}
					else if(rloca=="일본"){
						if(tourDays==3){
							/* $("#dtime").val("PM 15:00:00");
							$("#rtime").val("PM 16:15:00");
							$("#FName").val("101"); */
						}else if(tourDays==5){
							/* $("#dtime").val("PM 16:00:00"); 
							$("#rtime").val("PM 17:15:00");
							$("#FName").val("111");  */  
						}else{
							/* $("#dtime").val("PM 17:00:00"); 
							$("#rtime").val("PM 18:15:00");
							$("#FName").val("121"); */
						}
					}
				} 
				
			}
			$("#addFlight").submit(function(){
				alert("추가");
			})
		})
		
	})
</script>
<body>      
	<div class="container">         
		<div class="row">   
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
		 			 <h2>항공 스케줄 추가</h2>
		 		 </div>
		  <p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
		  <form class="form-inline" action="${pageContext.request.contextPath }/addFlightForm" method="post">
		  	<h3>출발 스케줄</h3>
		  <div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">   
			       <select class="form-control" id="dloca">
			       		<option>출발지 선택</option>
					    <option>인천</option>
	  				</select>  
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>
				    <div class="container">                                   
						<select class="form-control" id="rloca">
							<option>도착지 선택</option>
						    <option>제주</option>
						    <option>중국</option>
						    <option>일본</option>
	  					</select>
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<select class="form-control" id="seat">
				    		<option>좌석 선택</option>
						    <option>First-Class</option>
						    <option>Business-Class</option>
						    <option>Economy-Class</option>
	  					</select>   
					</div>   
		    </div>
		    
					<div class="form-group">
						  <label>최대 인원 수</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="capacity" readonly="readonly">
								</div>
					</div>
		    </div>
		    
		    <div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<!-- <input type="text" class="form-control" id="FCode"> -->
						  			 <div class='input-group date dateTimePicker' id='datetimepicker1'>
					                    <input type='text' class="form-control" id="ddate"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
                  					    </span>
                					</div> 
								</div>
					</div>   
					<div class="form-group">
						  <label><span class="red">*</span>여행일</label>
								<div class="container">   
									<select class="form-control" id="tourDays">
						  			 	<option>여행일 선택</option>
									    <option>3</option>
									    <option>5</option>
									    <option>7</option>   
									 </select>
								</div>   
					</div>
					
					
		<script type="text/javascript">

          $(function () {
            $('#datetimepicker1').datetimepicker();
          });

        </script>
			</div>
		    <div class="group">
		    	<!-- 
					<div class="form-group">
						 <label>도착 일자</label>
								<div class="container">  
									<input type="text" class="form-control" id="rdate" readonly="readonly">
								</div>   
					</div> -->
					<div class="form-group">     
						 <label>출발 시간</label>
								<div class="container">       
									<input type="text" class="form-control" id="dtime" readonly="readonly">
								</div>    
					</div>   
		    		<div class="form-group">     
						 <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime" readonly="readonly">
									<input type="hidden" class="form-control" id="rdate">
								</div>  
					</div>
		    </div>
		    <div class="group"> 
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName" readonly="readonly">
								</div>
					</div>
			</div>       
			
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price">
								</div>
					</div>
			</div>
			<div class="group">
				 <div id="confirm">
			<!-- 	<button class="btn btn-warning" id="confirm">출발 스케줄 확정</button> -->
				<a href="#" id="confirm">출발 스케줄 확정</a>
				</div>
			</div>   
			
			<!-- ===========도착 스케줄 ============== -->
			<h3>도착 스케줄</h3>
			  
			<div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">   
			      <input type="text" class="form-control" id="dloca2" readonly="readonly">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>   
				    <div class="container">                                     
						<input type="text" class="form-control" id="rloca2" readonly="readonly">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<input type="text" class="form-control" id="seat2" readonly="readonly"> 
					</div>   
		    </div>
			<div class="form-group">
					<label>최대 인원 수</label>
			     		<div class="container">   	
						  <input type="text" class="form-control" id="capacity2" readonly="readonly">
						</div>
					</div>
		    </div>          
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="ddate2" readonly="readonly">
								</div>
					</div>   
					
			</div>
			<div class="group">
				
					<div class="form-group">
						  <label>출발 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="dtime2" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime2" readonly="readonly">
								</div>   
					</div>
			</div>                      
		    <div class="group">          
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode2" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName2" readonly="readonly">
								</div>
					</div>
			</div> 
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price2">
								</div>
					</div>
			</div>  
			<div class="group">
				<div class="form-group">
			    	<button type="submit" class="btn btn-primary" id="addFlight">추가</button>
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