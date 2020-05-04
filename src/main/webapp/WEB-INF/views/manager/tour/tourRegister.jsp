<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap-slider/slider.css">
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
	$(function() {
		$("#startDate").datepicker({
			format : "yyyy-mm-dd",
			autoclose : true
		}).datepicker("setDate", 'now');
		$("#endDate").datepicker({
			format : "yyyy-mm-dd",
			autoclose : true
		}).datepicker("setDate", 'now');
		$("#etime").timepicker({
			timeFormat : 'HH:mm:ss',
			interval : 10,
			minTime : '00:10:00',
			maxTime : '23:50:00'
		})
		$("#capacity").slider({
			formatter : function(value) {
				return '현재 값 : ' + value;
			}
		})
		$("#capacity").on("slide",function(slidEvt){
			$("#miniVal").text(slideEvt.value);
		})
		$("#div").change(function() {
			$("#location").empty();
			if ($("#div option:selected").val() == '1') {
				var option1 = $("<option value='도쿄'>").html("도쿄");
				var option2 = $("<option vlaue='베이징'>").html("베이징");
				$("#location").append(option1).append(option2);
			} else {
				var option1 = $("<option value='제주'>").html("제주");
				$("#location").append(option1);
			}
		})
		$("form").submit(function(){
			var price = $("#price").val();
			var priceReg = /^[0-9]*$/;
			if(!priceReg.test(price)) {
				alert("숫자만 입력하세요")
				return false;
			}
		})
	})
</script> 
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">현지 투어 등록</h3>
				</div>
				<form role="form" action="tourRegister" method="post">
					<div class="box-body">
						<div class="col-sm-6">
							<div class="form-group">
								<label>번호</label> <input type="text" value="${no+1}" name="no"
									class="form-control" readonly="readonly">
							</div>
							<div class="form-group">
								<label>지역구분</label> <select class="form-control" name="ldiv"
									id="div">
									<option value='1'>해외</option>
									<option value='0'>국내</option>
								</select>
							</div>
							<div class="form-group">
								<label>투어지역</label> <select class="form-control"
									name="tlocation" id="location">
									<option value='도쿄'>도쿄</option>
									<option value='베이징'>베이징</option>
								</select>
							</div>
							<div class="form-group">
								<label>투어 제목</label> <input type="text" name="tname"
									class="form-control" placeholder="제목을 입력하세요"
									required="required">
							</div>
							<div class="form-group">
								<label>시작일자</label> <input type="text" name="startDate"
									class="form-control" required="required" id="startDate">
							</div>
							<div class="form-group">
								<label>종료일자</label> <input type="text" name="endDate"
									class="form-control" required="required" id="endDate">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>주소</label> <input type="text" name="taddr"
									class="form-control" required="required">
							</div>
							<div class="form-group">
								<label>소요시간</label> <input type="text" name="etime"
									class="form-control" required="required" id="etime">
							</div>
							<div class="form-group">
								<label>인원수</label>
								<input type="text" name="capacity" id="capacity" data-slider-min="0" data-slider-max="40" data-slider-step="1">
							</div>
							<div class="form-group">
								<label>가격</label> <input type="text" name="tprice"
									class="form-control" required="required" id="price">
							</div>
						</div>
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>