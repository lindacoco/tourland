<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	 $('.dateTimePicker').datetimepicker({format:"YYYY-MM-DD"});
	}); 
	
</script>
<script>
	$(function(){
		//출발 스케줄 일시 input hidden에 넣음 
		var ddate = $("#ddate_d").val();//출발일자
		var dtime = $("#dtime_d").val();//출발 시간  
		var rtime = $("#rtime_d").val();//도착 시간
		//출발일시
		var ddateData = ddate + dtime;
		$("#ddateData_d").val(ddateData);
		//도착일시
		var rdateData = ddate + rtime;
		$("#rdateData_d").val(rdateData);
		//도착 스케줄 일시 input hidden에 넣음
		//출발일시
		var ddate_r = $("#ddate_r").val();//출발일자 
		var dtime_r = $("#dtime_r").val();//출발시간
		var ddateData_r = ddate_r + dtime_r;
		$("#ddateData_r").val(ddateData_r);
		//도착일시
		var rtime_r = $("#rtime_r").val();//도착시간
		var rdateData_r = ddate_r + rtime_r;
		$("#rdateData_r").val(rdateData_r);
	})
</script>
<body>      
	<div class="container">         
		<div class="row">   
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
		 			 <h2>항공 스케줄 수정</h2>
		 		 </div>
		  <p id="guide">항공 스케줄은 고정된 스케줄이므로 가격만 수정할 수 있습니다.</p>
		<form class="form-inline" action="editFlight" method="post"> 
		  	<h3>출발 스케줄</h3>
		  <div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">
	  					<input type="text" id="dlocaData_d" class="form-control" name="list[0].dlocation" value="${depAir.dlocation }" readonly="readonly">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>    
				    <div class="container">
	  					<input type="text" id="rlocaData_d" class="form-control" name="list[0].rlocation"   value="${depAir.rlocation }" readonly="readonly">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    	<c:if test="${depAir.seat=='E' }">
				    		<input type="text" class="form-control" value="Economy-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="E" name="list[0].seat" readonly="readonly">
				    	</c:if>
				    	<c:if test="${depAir.seat=='B' }">
				    		<input type="text" class="form-control" value="Business-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="B" name="list[0].seat" readonly="readonly">
				    	</c:if>
				    	<c:if test="${depAir.seat=='F' }">
				    		<input type="text" class="form-control" value="First-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="F" name="list[0].seat" readonly="readonly">
				    	</c:if>
					</div>   
		    </div>
		    
					<div class="form-group">
						  <label>최대 인원 수</label>   
			     				<div class="container">
			     					<input type="text" class="form-control" id="capacity_d" name="list[0].capacity" value="${depAir.capacity }" readonly="readonly">
								</div>     
					</div>
		    </div>
		    
		    <div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			 <div class='input-group date dateTimePicker' id='datetimepicker1'>
					                    	<input type='text' class="form-control" id="ddate_d" name="ddateData_d" value="<fmt:formatDate value="${depAir.ddate }" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
                  					    </span>
                					</div> 
								</div>
					</div>   
			</div>
		    <div class="group">
					<div class="form-group">     
						 <label>출발 시간</label>
								<div class="container">   
										<input type="text" class="form-control" id="dtime_d" name="dtimeData_d" readonly="readonly" value="${dep_dtime }">	
								</div>    
					</div>   
		    		<div class="form-group">     
						 <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime_d" name="rtimeData_d" readonly="readonly" value="${dep_rtime }">
								</div>  
					</div>
		    </div>
		    <div class="group"> 
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  				<input type="text" class="form-control" id="FCode_d" name="list[0].ano" readonly="readonly" value="${depAir.ano }">
								</div>   
					</div>
			</div>       
			
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">
			     						<input type="text" class="form-control"  name="list[0].price"  id="price_d" value="${depAir.price }">
						                <input type="hidden" name="list[0].ddate" id="ddateData_d">
						                <input type="hidden" name="list[0].rdate" id="rdateData_d">
						                <input type="hidden" name="list[0].ldiv" id="ldivData_d" value="${depAir.ldiv }">   
							  			<input type="hidden" name="list[0].pdiv" id="pdivData_d" value="0">
						               	<input type="hidden"  id="noData_d" name="list[0].no" value="${depAir.no }"> 
								</div>
					</div>
			</div>  
			
			<!-- =====================================도착 스케줄 ========================================== -->
			<h3>도착 스케줄</h3>
			  
			<div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">   
			     	 <input type="text" class="form-control" id="dlocation_r"readonly="readonly" name="list[1].dlocation" value="${appAir.dlocation }">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>   
				    <div class="container">    
				    	<input type="text" class="form-control" id="rlocation_r"readonly="readonly" name="list[1].rlocation" value="${appAir.rlocation }">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container"> 
				    	<c:if test="${appAir.seat=='E' }">
				    		<input type="text" class="form-control" value="Economy-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="E" name="list[1].seat" readonly="readonly">
				    	</c:if>
				    	<c:if test="${appAir.seat=='B' }">
				    		<input type="text" class="form-control" value="Business-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="B" name="list[1].seat" readonly="readonly">
				    	</c:if>
				    	<c:if test="${appAir.seat=='F' }">
				    		<input type="text" class="form-control" value="First-Class" readonly="readonly">
				    		<input type="hidden" class="form-control" value="F" name="list[1].seat" readonly="readonly">
				    	</c:if>	 
					</div>   
		    </div>
			<div class="form-group">
					<label>최대 인원 수</label>
			     		<div class="container"> 
						  	<input type="text" class="form-control" id="capacity_r" name="list[1].capacity" value="${appAir.capacity }" readonly="readonly">
						</div>
					</div>
		    </div>          
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
					                    	<input type='text' class="form-control" id="ddate_r" value="<fmt:formatDate value="${appAir.ddate }" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
								</div>
					</div>   
					
			</div>
			<div class="group">
				
					<div class="form-group">
						  <label>출발 시간</label>
								<div class="container">  
										<input type="text" class="form-control" id="dtime_r"  readonly="readonly" value="${app_dtime }">	
								</div>   
					</div>
					<div class="form-group">
						  <label>도착 시간</label>
								<div class="container">  
										<input type="text" class="form-control" id="rtime_r"  readonly="readonly" value="${app_rtime }">	
								</div>   
					</div>
			</div>                      
		    <div class="group">          
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container"> 
			     					<input type="text" class="form-control" id="FCode_r" name="list[1].ano" readonly="readonly" value="${appAir.ano }">	
								</div>   
					</div>
			</div> 
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   
			     					<input type="text" class="form-control" id="price_r" name="list[1].price"   value=${appAir.price }>
			     					 <input type="hidden" name="list[1].ddate" id="ddateData_r">
						             <input type="hidden" name="list[1].rdate" id="rdateData_r">
						             <input type="hidden" name="list[1].ldiv" id="ldivData_r" value="${appAir.ldiv }">   
							  		 <input type="hidden" name="list[1].pdiv" id="pdivData_r" value="0"> 
					            	<input type="hidden" name="list[1].no" id="noData_r" name="list[1].no"   value="${appAir.no }">   
								</div>
					</div>
			</div>  
			<div class="group">
				<div class="form-group">
			    	<button class="btn btn-warning" id="mod">수정</button>
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