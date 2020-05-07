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
			
		})   
		//출발 스케줄 - 도착지 선택 시 
		$("#rlocation_d").change(function(){
			var dloca = $("#dlocation_d").val();//출발지 dlocaData_d
			$("#dlocaData_d").val("ICN");
			var rloca = $(this).val(); //도착지
				if(rloca=="제주"){
					$("#rlocaData_d").val("CJU");
					$("#FCode_d").val("KA");
				}
				else if(rloca=="일본"){
					$("#rlocaData_d").val("NRT");
					$("#FCode_d").val("JA");
				}else{
					$("#rlocaData_d").val("PEK");
					$("#FCode_d").val("AC");
				}   
		})
		//출발 스케줄 - 좌석 선택 시 
		$("#seat_d").change(function(){
			var seat = $(this).val();
			if(seat=="First-Class"){
				$("#capacity_d").val("5");
			}else if(seat=="Business-Class"){
				$("#capacity_d").val("10");
			}else if(seat=="Economy-Class"){
				$("#capacity_d").val("30");
			}else{
				$("#capacity_d").val("");
			}
		})
		
		//출발 스케줄 - 여행일 선택 시 
		$("#tourDays_d").change(function(){
			var dloca = $("#dlocation_d").val(); //출발지
			var rloca = $("#rlocation_d").val(); //도착지
			var tourDays = $(this).val(); //여행일
			var ddate = $("#ddate_d").val();//출발일자
			
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
			newdate.setDate(newdate.getDate()+num);  //여행일에 따라 달라지는 num 숫자를 날짜에 더해줌
			var nd = new Date(newdate); //더해진 날짜 가져옴
			nd = getFormatDate(nd); //자바스크립트 함수로 fomatting 해줌 (yyyy-MM-dd 형식)
			
			//있어야하는 것
			//dloca, rloca, tourDays, ddate
			
			//도착지 -> 항공사 코드 결정
			//좌석 -> 최대 인원수 결정
			//출발 일자 -> 도착 일자 결정
			//도착지, 여행일, 출/도착 여부 -> 편명 결정 
			if(dloca=="인천"){
				if(rloca=="제주"){
					if(tourDays==3){
						$("#dtime_d").val(" 09:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 10:15:00");
						$("#FName_d").val("301");
					}else if(tourDays==5){
						$("#dtime_d").val(" 10:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 11:15:00");
						$("#FName_d").val("311");   
					}else{
						$("#dtime_d").val(" 11:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 12:15:00");
						$("#FName_d").val("321");
					}
						
				}else if(rloca=="중국"){
					if(tourDays==3){
						$("#dtime_d").val(" 12:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 13:15:00");
						$("#FName_d").val("201");
					}else if(tourDays==5){
						$("#dtime_d").val(" 13:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 14:15:00");
						$("#FName_d").val("211");   
					}else{
						$("#dtime_d").val(" 14:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 15:15:00");
						$("#FName_d").val("221");
					}
				}
				else if(rloca=="일본"){
					if(tourDays==3){
						$("#dtime_d").val(" 15:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 16:15:00");
						$("#FName_d").val("101");
					}else if(tourDays==5){
						$("#dtime_d").val(" 16:00:00");  
						$("#rdate_d").val(ddate);
						$("#rtime_d").val(" 17:15:00");
						$("#FName_d").val("111");   
					}else{
						$("#dtime").val(" 17:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 18:15:00");
						$("#FName_d").val("121");
					}
				}
			} 
		})
		
		//출발 스케줄 확정 클릭 시    
		$("#confirm").click(function(){     
			var dloca = $("#dlocation_d").val(); //출발지
			var rloca = $("#rlocation_d").val(); //도착지
			var seat = $("#seat_d").val();//좌석
			var ddate = $("#ddate_d").val();//출발일자
			var dtime = $("#dtime_d").val();//출발 시간  
			var rtime = $("#rtime_d").val();//도착 시간
			var price = $("#price_d").val();//가격
			var tourDays = $("#tourDays_d").val();//여행일
			var capacity = $("#capacity_d").val();
			var FCode = $("#FCode_d").val();//항공사 코드
			var FName = $("#FName_d").val(); //편명
			
			
			if(dloca=="출발지 선택" || rloca=="도착지 선택" || seat=="좌석 선택" || price=="" || dtime==""||rtime==""){
				alert("출발 스케줄의 모든 란을 선택/입력 해주세요.");	
				return false;     
			}else{
				if(dloca=="인천"){
					
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
					newdate.setDate(newdate.getDate()+num);  //여행일에 따라 달라지는 num 숫자를 날짜에 더해줌
					var nd = new Date(newdate); //더해진 날짜 가져옴
					nd = getFormatDate(nd); //자바스크립트 함수로 fomatting 해줌 (yyyy-MM-dd 형식)
					
					//국내, 해외 구분
					var ldiv = 0;
					
					//도착스케줄 인천으로 고정 
					$("#rlocation_r").val("인천");
					$("#rlocaData_r").val("ICN");
					
					if(rloca=="제주"){
						ldiv = 1;
						$("#dlocation_r").val("제주");
						$("#dlocaData_r").val("CJU");
						if(tourDays==3){    
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 09:30:00");  
							$("#rtime_r").val(" 10:45:00");
							$("#FName_r").val("302");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}else if(tourDays==5){
							$("#seat_r").val(seat);
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);
							$("#dtime_r").val(" 10:30:00");  
							$("#rtime_r").val(" 11:45:00");
							$("#FName_r").val("312");
							$("#capacity_r").val(capacity); 
						}else{
							$("#seat_r").val(seat);
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);
							$("#dtime_r").val(" 11:30:00");  
							$("#rtime_r").val(" 12:45:00");
							$("#FName2").val("322");
							$("#capacity2").val(capacity);
						}
							
					}else if(rloca=="중국"){
						$("#dlocation_r").val("중국");
						$("#dlocaData_r").val("PEK");
						if(tourDays==3){
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 12:30:00");  
							$("#rtime_r").val(" 13:45:00");
							$("#FName_r").val("202");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}else if(tourDays==5){
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 13:30:00");  
							$("#rtime_r").val(" 14:45:00");
							$("#FName_r").val("212");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}else{
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 14:30:00");  
							$("#rtime_r").val(" 15:45:00");
							$("#FName_r").val("222");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}
					}
					else if(rloca=="일본"){
						$("#dlocation_r").val("일본");
						$("#dlocaData_r").val("NRT");
						if(tourDays==3){
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 15:30:00");  
							$("#rtime_r").val(" 16:45:00");
							$("#FName_r").val("102");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}else if(tourDays==5){
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 16:30:00");  
							$("#rtime_r").val(" 17:45:00");
							$("#FName_r").val("112");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일 
						}else{
							$("#seat_r").val(seat); //출발 스케줄 좌석과 동일
							$("#FCode_r").val(FCode);//항공사 코드
							$("#ddate_r").val(nd);//출발 일자 
							$("#dtime_r").val(" 17:30:00");  
							$("#rtime_r").val(" 18:45:00");
							$("#FName_r").val("122");
							$("#capacity_r").val(capacity);//출발 스케줄 인원 수와 동일
						}
					}
					//출발스케줄 - 국내,해외 구분
					$("#ldivData_d").val(ldiv);
					$("#ldivData_r").val(ldiv);
					
					//출발 스케줄 데이터 input hidden에 저장
					//좌석
					var seatData;
					console.log(seat);
					console.log(seatData);
					if(seat=="First-Class"){
						seatData = "F";
					}else if(seat=="Business-Class"){
						seatData = "B";
					}else {
						seatData = "E";
					}
					$("#seatData_d").val(seatData);
					var d = $("#seatData_d").val();
					//출발일시
					var ddateData = ddate + dtime;
					$("#ddateData_d").val(ddateData);
					//도착일시
					var rdateData = ddate + rtime;
					$("#rdateData_d").val(rdateData);
					//항공사 코드 + 편명 
					var anoData = FCode+FName;
					$("#anoData_d").val(anoData);
					//번호
					var noData = "${airTotalCnt }"
					$("#noData_d").val(noData);
					//도착 스케줄 데이터 input hidden에 저장
					//좌석
					$("#seatData_r").val(seatData);
					
					//출발일시
					var ddate_r = $("#ddate_r").val();//출발일자 
					var dtime_r = $("#dtime_r").val();//출발시간
					var ddateData_r = ddate_r + dtime_r;
					$("#ddateData_r").val(ddateData_r);
					//도착일시
					var rtime_r = $("#rtime_r").val();//도착시간
					var rdateData_r = ddate_r + rtime_r;
					$("#rdateData_r").val(rdateData_r);
					//항공사 코드 + 편명 
					var FCode_r = $("#FCode_r").val();//항공사 코드
					var FName_r = $("#FName_r").val(); //편명 
					var anoData_r = FCode_r+FName_r;
					$("#anoData_r").val(anoData_r);
					//번호
					var noData_r = "${airTotalNextCnt }"
					$("#noData_r").val(noData_r);

					
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
			       <select class="form-control" id="dlocation_d">
			       		<option>출발지 선택</option>
					    <option>인천</option>
	  				</select>  
	  				<input type="hidden" id="dlocaData_d" name="list[0].dlocation" value="list[0].dlocation">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>    
				    <div class="container">                                   
						<select class="form-control" id="rlocation_d">
							<option>도착지 선택</option>
						    <option>제주</option>
						    <option>중국</option>
						    <option>일본</option>
	  					</select>
					</div>
					<input type="hidden" id="rlocaData_d"  name="list[0].rlocation" value="list[0].rlocation">
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<select class="form-control" id="seat_d" name="seatData_d">
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
						  			<input type="text" class="form-control" id="capacity_d" name="list[0].capacity" readonly="readonly">
								</div>
					</div>
		    </div>
		    
		    <div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<!-- <input type="text" class="form-control" id="FCode"> -->
						  			 <div class='input-group date dateTimePicker' id='datetimepicker1'>
					                    <input type='text' class="form-control" id="ddate_d" name="ddateData_d"/>
					                    <!--  <input type='hidden' class="form-control" id="rdate_d" name="rdateData_d"/> -->
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
                  					    </span>
                					</div> 
								</div>
					</div>   
					<div class="form-group">
						  <label><span class="red">*</span>여행일</label>
								<div class="container">   
									<select class="form-control" id="tourDays_d">
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
					<div class="form-group">     
						 <label>출발 시간</label>
								<div class="container">       
									<input type="text" class="form-control" id="dtime_d" name="dtimeData_d" readonly="readonly">
								</div>    
					</div>   
		    		<div class="form-group">     
						 <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime_d" name="rtimeData_d" readonly="readonly">
									<!-- <input type="hidden" class="form-control" id="rdate_d" name="rdateData_d"> -->
								</div>  
					</div>
		    </div>
		    <div class="group"> 
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode_d" name="FCodeData_d" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName_d" name="FNameData_d" readonly="readonly">
								</div>
					</div>
			</div>       
			
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price_d" name="list[0].price">
					                <input type="hidden" name="list[0].seat" id="seatData_d">
					                <input type="hidden" name="list[0].ddate" id="ddateData_d">
					                <input type="hidden" name="list[0].rdate" id="rdateData_d">
					                <input type="hidden" name="list[0].ano" id="anoData_d">
					                <input type="hidden" name="list[0].ldiv" id="ldivData_d">   
						  			<input type="hidden" name="list[0].no" id="noData_d"> 
								</div>
					</div>
			</div>
			<div class="group">
				 <div id="confirm">
			<!-- 	<button class="btn btn-warning" id="confirm">출발 스케줄 확정</button> -->
				<a href="#" id="confirm">출발 스케줄 확정</a>
				</div>
			</div>   
			
			<!-- =====================================도착 스케줄 ========================================== -->
			<h3>도착 스케줄</h3>
			  
			<div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">   
			      <input type="text" class="form-control" id="dlocation_r"readonly="readonly">
			      <input type="hidden" id="dlocaData_r" name="list[1].dlocation">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>   
				    <div class="container">                                     
						<input type="text" class="form-control" id="rlocation_r"readonly="readonly">
						<input type="hidden" id="rlocaData_r" name="list[1].rlocation">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<input type="text" class="form-control" id="seat_r" name="seatData_r" readonly="readonly"> 
					</div>   
		    </div>
			<div class="form-group">
					<label>최대 인원 수</label>
			     		<div class="container">   	
						  <input type="text" class="form-control" id="capacity_r" name="list[1].capacity" readonly="readonly">
						</div>
					</div>
		    </div>          
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="ddate_r" name="ddateData_r" readonly="readonly">
						  			<!-- <input type="hidden" class="form-control" id="rdate_r" name="rdateData_r" readonly="readonly"> -->
								</div>
					</div>   
					
			</div>
			<div class="group">
				
					<div class="form-group">
						  <label>출발 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="dtime_r" name="dtimeData_r" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime_r" name="rtimeData_r" readonly="readonly">
								</div>   
					</div>
			</div>                      
		    <div class="group">          
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode_r" name="FCodeData_r" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName_r" name="FNameData_r" readonly="readonly">
								</div>
					</div>
			</div> 
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price_r" name="list[1].price">
						  			<input type="hidden" name="list[1].seat" id="seatData_r">
					                <input type="hidden" name="list[1].ddate" id="ddateData_r">
					                <input type="hidden" name="list[1].rdate" id="rdateData_r">
					                <input type="hidden" name="list[1].ano" id="anoData_r">
					                <input type="hidden" name="list[1].ldiv" id="ldivData_r">
						  			<input type="hidden" name="list[1].no" id="noData_r">    
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