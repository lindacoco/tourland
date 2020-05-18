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
	.box-primary { height: 900px; } 
	h3 { text-indent: 10px; font-weight: bold;}	    	              
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
	        $('#datepicker3').datetimepicker({
	            useCurrent: false
	        });
	        $('#datepicker4').datetimepicker({
	            useCurrent: false
	        });
	       
	       // 함수 호출 순서가 4,3,2 순서이다.
	       // 4가 바뀌어야 3이 바뀌고 3이 바뀌어야 2가 바뀐다.
	        $("#datepicker1").on("dp.change", function (e) {
	            $('#datepicker4').data("DateTimePicker").minDate(e.date);
	        });
	        $("#datepicker1").on("dp.change", function (e) {
	            $('#datepicker3').data("DateTimePicker").minDate(e.date);
	        });
	        $("#datepicker1").on("dp.change", function (e) {
	            $('#datepicker2').data("DateTimePicker").minDate(e.date);
	        });
	           
	}); 
	
</script>  
<body>      
	<div class="container">         
		<div class="row">   
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
		 			 <h2>쿠폰 추가</h2>      
		 		 </div>     
		  <p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
		  <form class="form-inline" action="${pageContext.request.contextPath }/manager/addCouponForm" method="post">
		  <div class="group">
			    <div class="form-group">   
			      <label>번호</label>
				     <div class="container">
				     	<input type="text" class="form-control" name="cno" readonly="readonly" value="${totalCnt }">
					</div>        
			    </div>  
		    </div>
		  <div class="group">
			    <div class="form-group">   
			      <label><span class="red">*</span>쿠폰명</label>
				     <div class="container">
				     	<input type="text" class="form-control" name="cname">
					</div>        
			    </div>  
		    </div>
		    <div class="group">
		    	<div class="form-group">
		    	
		    		<label><span class="red">*</span>시작일</label>
		    		<div class='input-group date dateTimePicker' id='datetimepicker1'>
					    <input type='text' class="form-control" name="pdate"/>
					       <span class="input-group-addon">
					         <span class="glyphicon glyphicon-calendar"></span>
                  				</span>
                	</div> 
		    	</div>
		    	<div class="form-group">
		    		<label><span class="red">*</span>마감일</label>
		    		<div class='input-group date dateTimePicker' id='datetimepicker2'>
					    <input type='text' class="form-control" name="edate"/>
					       <span class="input-group-addon">
					         <span class="glyphicon glyphicon-calendar"></span>
                  				</span>
                	</div> 
		    	</div>
		    </div>
		    <script type="text/javascript">

		          $(function () {
		            $('#datetimepicker1').datetimepicker();
		            $('#datetimepicker2').datetimepicker();
		          });

       		 </script>
		    <div class="group">
			    <div class="form-group">   
			      <label><span class="red">*</span>내용</label>
				     <div class="container">
				     	<textarea rows="10" cols="100" name="ccontent"></textarea>
					</div>          
			    </div> 
			<div class="group"></div> 
			<div class="group"></div> 
			<div class="group"></div> 
			<div class="group">
			 <div class="form-group">   
			      <label><span class="red">*</span>할인율(%)</label>
				     <div class="container">
				     	<input type="text" class="form-control" name="mrate" placeholder="퍼센트 제외 / ex.5,10..">
					</div>        
			    </div> 
			</div>
			   <div class="group">
			    <div class="form-group">   
			      	<button class="btn btn-primary">등록</button> 
			    </div>  
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