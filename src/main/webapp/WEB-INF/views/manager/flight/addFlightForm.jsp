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
			newdate.setDate(newdate.getDate()+num);  //여행일에 따라 달라지는 num 숫자를 날짜에 더해줌
			var nd = new Date(newdate); //더해진 날짜 가져옴
			nd = getFormatDate(nd); //자바스크립트 함수로 fomatting 해줌 (yyyy-MM-dd 형식)
			
			//도착지 -> 항공사 코드 결정
			//좌석 -> 최대 인원수 결정
			//출발 일자 -> 도착 일자 결정
			//도착지, 여행일, 출/도착 여부 -> 편명 결정 
			if(dloca=="인천"){
				if(rloca=="제주"){
					if(tourDays==3){
						$("#dtime").val(" 09:00:00");        
						$("#rdate").val(nd);
						$("#rtime").val(" 10:15:00");
						$("#FName").val("301");
					}else if(tourDays==5){
						$("#dtime").val(" 10:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 11:15:00");
						$("#FName").val("311");   
					}else{
						$("#dtime").val(" 11:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 12:15:00");
						$("#FName").val("321");
					}
						
				}else if(rloca=="중국"){
					if(tourDays==3){
						$("#dtime").val(" 12:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 13:15:00");
						$("#FName").val("201");
					}else if(tourDays==5){
						$("#dtime").val(" 13:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 14:15:00");
						$("#FName").val("211");   
					}else{
						$("#dtime").val(" 14:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 15:15:00");
						$("#FName").val("221");
					}
				}
				else if(rloca=="일본"){
					if(tourDays==3){
						$("#dtime").val(" 15:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 16:15:00");
						$("#FName").val("101");
					}else if(tourDays==5){
						$("#dtime").val(" 16:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 17:15:00");
						$("#FName").val("111");   
					}else{
						$("#dtime").val(" 17:00:00");  
						$("#rdate").val(nd);
						$("#rtime").val(" 18:15:00");
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
					//도착 스케줄 값 자동설정용
					var seatName = $("#seat").val();
					var FCodeData = $("#FCode").val();
					var rdateData=  $("#rdate").val();
					
					//출발 스케줄 데이터 전송용
					var seatText = $("input[name='seatText']").val();//좌석
					var ddateText = $("input[name='ddateText']").val();//출발일자
					var dtime = $("input[name='dtime']").val();//출발시간
					var rdateText = $("input[name='rdateText']").val();//도착일자
					var rtime = $("input[name='rtime']").val();//도착시간
					var FCode = $("input[name='FCode']").val(); //항공사 코드
					var FName = $("input[name='FName']").val();//편명
					var seat;//좌석필드
					var ddate = ddateText + dtime; //출발 일시
					var rdate = rdateText + rtime; //도착 일시
					var ano = FCode + FName; //항공기 편명
					var ldiv = 0;
					if(seatText=="First-Class"){
						seat = "F";
					}else if(seatText=="Business-Class"){
						seat = "B";
					}else {
						seat = "E"
					}
					
					//출발 스케줄 input hidden에 값 저장
					$("#s").val(seat);
					$("#dd").val(ddate);
					$("#rd").val(rdate);
					$("#ano").val(ano);
					
					if(rloca=="제주"){
						ldiv = 1;
						$("#dloca2").val("제주");
						$("#rloca2").val("인천");
						if(tourDays==3){    
							$("#seat2").val(seatName);
							$("#FCode2").val(FCodeData);
							$("#ddate2").val(rdateData);
							$("#dtime2").val(" 09:30:00");  
							$("#rtime2").val(" 10:45:00");
							$("#FName2").val("302");
							$("#capacity2").val(capacity);
						}else if(tourDays==5){
							$("#seat2").val(seatName);
							$("#FCode2").val(FCodeData);
							$("#ddate2").val(rdateData);
							$("#dtime2").val(" 10:30:00");  
							$("#rtime2").val(" 11:45:00");
							$("#FName2").val("312");
							$("#capacity2").val(capacity); 
						}else{
							$("#seat2").val(seat);
							$("#FCode2").val(FCodeData);
							$("#ddate2").val(rdateData);
							$("#dtime2").val(" 11:30:00");  
							$("#rtime2").val(" 12:45:00");
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
					//출발스케줄 - 국내,해외 구분
					$("#ldiv").val(ldiv);
					
					//도착 스케줄 데이터 전송용
					var seatText2 = $("input[name='seatText2']").val();//좌석
					var ddateText2 = $("input[name='ddateText2']").val();//출발일자
					var dtime2 = $("input[name='dtime2']").val();//출발시간
					var rdateText2 = $("input[name='rdateText2']").val();//도착일자
					var rtime2 = $("input[name='rtime2']").val();//도착시간
					var FCode2 = $("input[name='FCode2']").val(); //항공사 코드
					var FName2 = $("input[name='FName2']").val();//편명
					var seat2;//좌석필드
					var ddate2 = ddateText2 + dtime2; //출발 일시
					var rdate2 = rdateText2 + rtime2; //도착 일시
					var ano2 = FCode2 + FName2; //항공기 편명
					if(seatText2=="First-Class"){
						seat2 = "F";
					}else if(seatText=="Business-Class"){
						seat2 = "B";
					}else {
						seat2 = "E"
					}
					//도착 스케줄 input hidden에 값 저장
					$("#s2").val(seat2);
					$("#dd2").val(ddate2);
					$("#rd2").val(rdate2);
					$("#ano2").val(ano2);
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
			       <select class="form-control" id="dloca" name="list[0].dlocation">
			       		<option>출발지 선택</option>
					    <option>인천</option>
	  				</select>  
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>
				    <div class="container">                                   
						<select class="form-control" id="rloca" name="list[0].rlocation">
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
				    	<select class="form-control" id="seat" name="seatText">
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
						  			<input type="text" class="form-control" id="capacity" name="list[0].capacity" readonly="readonly">
								</div>
					</div>
		    </div>
		    
		    <div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<!-- <input type="text" class="form-control" id="FCode"> -->
						  			 <div class='input-group date dateTimePicker' id='datetimepicker1'>
					                    <input type='text' class="form-control" id="ddate" name="ddateText"/>
					                     <input type='hidden' class="form-control" id="rdate" name="rdateText"/>
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
									<input type="text" class="form-control" id="dtime" name="dtime" readonly="readonly">
								</div>    
					</div>   
		    		<div class="form-group">     
						 <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime" name="rtime" readonly="readonly">
									<input type="hidden" class="form-control" id="rdate">
								</div>  
					</div>
		    </div>
		    <div class="group"> 
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode" name="FCode" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName" name="FName" readonly="readonly">
								</div>
					</div>
			</div>       
			
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price" name="list[0].price">
					                <input type="hidden" name="list[0].seat" id="s">
					                <input type="hidden" name="list[0].ddate" id="dd">
					                <input type="hidden" name="list[0].rdate" id="rd">
					                <input type="hidden" name="list[0].ano" id="ano">
					                <input type="hidden" name="list[0].ldiv" id="ldiv">      
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
			      <input type="text" class="form-control" id="dloca2" name="list[1].dlocation" readonly="readonly">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>   
				    <div class="container">                                     
						<input type="text" class="form-control" id="rloca2" name="list[1].rlocation" readonly="readonly">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<input type="text" class="form-control" id="seat2" name="seatText2" readonly="readonly"> 
					</div>   
		    </div>
			<div class="form-group">
					<label>최대 인원 수</label>
			     		<div class="container">   	
						  <input type="text" class="form-control" id="capacity2" name="list[1].capacity" readonly="readonly">
						</div>
					</div>
		    </div>          
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="ddate2" name="ddateText2" readonly="readonly">
						  			<input type="hidden" class="form-control" id="rdate2" name="rdateText2" readonly="readonly">
								</div>
					</div>   
					
			</div>
			<div class="group">
				
					<div class="form-group">
						  <label>출발 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="dtime2" name="dtime2" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime2" name="rtime2" readonly="readonly">
								</div>   
					</div>
			</div>                      
		    <div class="group">          
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode2" name="FCode2" readonly="readonly">
								</div>   
					</div>
					<div class="form-group">
						  <label>편명</label>
								<div class="container">       
						  			<input type="text" class="form-control" id="FName2" name="FName2" readonly="readonly">
								</div>
					</div>
			</div> 
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price2" name="list[1].price">
						  			<input type="hidden" name="list[1].seat" id="s2">
					                <input type="hidden" name="list[1].ddate" id="dd2">
					                <input type="hidden" name="list[1].rdate" id="rd2">
					                <input type="hidden" name="list[1].ano" id="ano2">
					                <input type="hidden" name="list[1].ldiv" id="ldiv2">   
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