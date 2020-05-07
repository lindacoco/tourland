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

</script>
<body>      
	<div class="container">         
		<div class="row">   
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
		 			 <h2>항공 스케줄 수정</h2>
		 		 </div>
		  <p id="guide">항공 스케줄의 세부 사항 입니다.</p>
		  <form class="form-inline" action="${pageContext.request.contextPath }/addFlightForm" method="post">
		  	<h3>출발 스케줄</h3>
		  <div class="group">
		    <div class="form-group">   
		      <label><span class="red">*</span>출발지</label>
			     <div class="container">
			     
			        
	  				<c:if test="${noDiv==0 }">
	  					<input type="text" id="dlocaData_d" class="form-control" value="${prevAir.dlocation }" readonly="readonly">
	  				</c:if>
	  	
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>    
				    <div class="container">    
	  					
					<c:if test="${noDiv==0 }">
	  					<input type="text" id="rlocaData_d" class="form-control" value="${prevAir.rlocation }" readonly="readonly">
	  				</c:if>

					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container">  
				    
				    <c:if test="${noDiv==0 }">
				    	<c:if test="${prevAir.seat=='E' }">
				    		<input type="text" class="form-control" value="Economy-Class" readonly="readonly">
				    	</c:if>
				    	<c:if test="${prevAir.seat=='B' }">
				    		<input type="text" class="form-control" value="Business-Class" readonly="readonly">
				    	</c:if>
				    	<c:if test="${prevAir.seat=='F' }">
				    		<input type="text" class="form-control" value="First-Class" readonly="readonly">
				    	</c:if>
	  					
	  				</c:if>
					</div>   
		    </div>
		    
					<div class="form-group">
						  <label>최대 인원 수</label>   
			     				<div class="container">
			     					<c:if test="${noDiv==0 }">
			     						<input type="text" class="form-control" id="capacity_d" value="${prevAir.capacity }" readonly="readonly">
			     					</c:if>	
								</div>     
					</div>
		    </div>
		    
		    <div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			 <div class='input-group date dateTimePicker' id='datetimepicker1'>
						  			 	<c:if test="${noDiv==0 }">
					                    	<input type='text' class="form-control" id="ddate_d" name="ddateData_d" value="<fmt:formatDate value="${prevAir.ddate }" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
					                    </c:if>
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
									<c:if test="${noDiv==0 }">
										<input type="text" class="form-control" id="dtime_d" name="dtimeData_d" readonly="readonly" value="${prev_dtime }">	
									</c:if>    
									
								</div>    
					</div>   
		    		<div class="form-group">     
						 <label>도착 시간</label>
								<div class="container">  
									<input type="text" class="form-control" id="rtime_d" name="rtimeData_d" readonly="readonly" value="${prev_rtime }">
									<!-- <input type="hidden" class="form-control" id="rdate_d" name="rdateData_d"> -->
								</div>  
					</div>
		    </div>
		    <div class="group"> 
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
			     					<c:if test="${noDiv==0 }">
						  				<input type="text" class="form-control" id="FCode_d" name="FCodeData_d" readonly="readonly" value="${prevAir.ano }">
						  			</c:if>
								</div>   
					</div>
			</div>       
			
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">
			     					<c:if test="${noDiv==0 }">
			     						<input type="text" class="form-control" id="price_d" value="${prevAir.price }" readonly="readonly">
			     					</c:if>   	
						  			
					                <input type="hidden" name="list[0].seat" id="seatData_d">
					                <input type="hidden" name="list[0].ddate" id="ddateData_d">
					                <input type="hidden" name="list[0].rdate" id="rdateData_d">
					                <input type="hidden" name="list[0].ano" id="anoData_d">
					                <input type="hidden" name="list[0].ldiv" id="ldivData_d">   
						  			<input type="hidden" name="list[0].no" id="noData_d" value="${prevAir.no }"> 
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
			      <input type="text" class="form-control" id="dlocation_r"readonly="readonly" value="${selectedAir.dlocation }">
			      <input type="hidden" id="dlocaData_r" name="list[1].dlocation">
				</div>        
		    </div>  
		    <div class="form-group">
		      <label><span class="red">*</span>도착지</label>   
				    <div class="container">                                     
						<input type="text" class="form-control" id="rlocation_r"readonly="readonly" value="${selectedAir.rlocation }">
					</div>
		   </div> 
		    <div class="form-group">  
		      <label><span class="red">*</span>좌석</label>
				    <div class="container"> 
				    <c:if test="${noDiv==0 }">
				    	<c:if test="${selectedAir.seat=='E' }">
				    		<input type="text" class="form-control" value="Economy-Class" readonly="readonly">
				    	</c:if>
				    	<c:if test="${selectedAir.seat=='B' }">
				    		<input type="text" class="form-control" value="Business-Class" readonly="readonly">
				    	</c:if>
				    	<c:if test="${selectedAir.seat=='F' }">
				    		<input type="text" class="form-control" value="First-Class" readonly="readonly">
				    	</c:if>
				    </c:if>
				    	 
					</div>   
		    </div>
			<div class="form-group">
					<label>최대 인원 수</label>
			     		<div class="container"> 
			     		  	<c:if test="${noDiv==0 }">
						  	<input type="text" class="form-control" id="capacity_r" value="${selectedAir.capacity }" readonly="readonly">
						  </c:if>
						</div>
					</div>
		    </div>          
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>출발 일자</label>
			     				<div class="container">   	
						  			<c:if test="${noDiv==0 }">
					                    	<input type='text' class="form-control" id="ddate_d" value="<fmt:formatDate value="${selectedAir.ddate }" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
					                    </c:if>
								</div>
					</div>   
					
			</div>
			<div class="group">
				
					<div class="form-group">
						  <label>출발 시간</label>
								<div class="container">  
									<c:if test="${noDiv==0 }">
										<input type="text" class="form-control" id="dtime_r"  readonly="readonly" value="${selected_dtime }">	
									</c:if>
								</div>   
					</div>
					<div class="form-group">
						  <label>도착 시간</label>
								<div class="container">  
									<c:if test="${noDiv==0 }">
										<input type="text" class="form-control" id="rtime_r"  readonly="readonly" value="${selected_rtime }">	
									</c:if>
								</div>   
					</div>
			</div>                      
		    <div class="group">          
				    <div class="form-group">
						  <label>항공사 코드</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="FCode_r" name="FCodeData_r" readonly="readonly" value="${selectedAir.ano }">
								</div>   
					</div>
			</div> 
			<div class="group"> 
				    <div class="form-group">
						  <label><span class="red">*</span>가격</label>
			     				<div class="container">   	
						  			<input type="text" class="form-control" id="price_r" value=${selectedAir.price } readonly="readonly">
						  			<input type="hidden" name="list[1].seat" id="seatData_r">
					                <input type="hidden" name="list[1].ddate" id="ddateData_r">
					                <input type="hidden" name="list[1].rdate" id="rdateData_r">
					                <input type="hidden" name="list[1].ano" id="anoData_r">
					                <input type="hidden" name="list[1].ldiv" id="ldivData_r">
						  			<input type="hidden" name="list[1].no" id="noData_r" value="${selectedAir.no }">    
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