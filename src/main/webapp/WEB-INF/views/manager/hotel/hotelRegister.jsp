<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	label{
		padding-bottom:6px;
	}
	.form-group{
		float:left;
		width: 300px;
		margin: 20px;
	}
	input[name='no']{
		background: lightGray;
		width:200px;
	}
	.noNameAddr{
		height:105px;
	}
	.red{
		color:red;
	}
	input[name='checkin'], input[name='checkout'], input[name='price'] {
		width:262px;
	}
	[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
	}

	[type="date"]::-webkit-inner-spin-button {
		display: none;
	}

	[type="date"]::-webkit-calendar-picker-indicator {
		opacity: 0;
	}
	.box-footer{
    	clear: both;
    	margin: 43px 636px;
    	padding-top: 70px;
	}
	.box-footer button{
    	width: 200px;
    	height: 65px;
    	font-size: 20px;
	}

</style>
<script>
$(function(){
	$(function() {
		//달력을 오늘 이후로만 선택할수 있게
		var now = new Date();
		var day = now.getDate();
		var month = (now.getMonth() + 1);
		var year = now.getFullYear();
		if (day < 10) {
			day = '0' + day;
		}
		if (month < 10) {
			month = '0' + month;
		}
		today = year + '-' + month + '-' + day;
		document.getElementById("checkin").setAttribute("min", today);
	})
})



</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">호텔 상품 등록</h3>
				</div>
				<form role="form" action="hotelRegister" method="post">
					<div class="box-body">
						<div class="noNameAddr">
							<label><span class="red">*</span>번호</label>
							<input type="text" name="no" class="form-control" value="" readonly>
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>호텔이름</label>
							<input type="text" name="hname" class="form-control" placeholder="호텔의 이름을 입력하세요." required="required">
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>호텔주소</label>
							<input type="text" name="haddr" class="form-control" placeholder="호텔의 주소를 입력하세요." required="required">							
						</div>
						<div class="form-group">
							<label><span class="red">*</span>체크인 날짜</label>
							<input type="date" name="checkin" class="form-control"  required="required" id="checkin">	
						</div>
						<div class="form-group">
							<label><span class="red">*</span>체크아웃 날짜</label>
							<input type="date" name="checkout" class="form-control" required="required" id="checkout">
						</div>
						<div class="form-group">
							<label><span class="red">*</span>허용인원수</label>
							<select name="capacity" class="form-control" id="capacity" required="required" >
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select> 
						</div>
						<div class="form-group">
							<label><span class="red">*</span>가격</label>
							<input type="text" name="price" class="form-control" required="required" placeholder="원화로 입력해주세요.">							
						</div>
						<div class="form-group">
							<label><span class="red">*</span>허용객실수</label>
							<input type="text" name="roomcapacity" class="form-control" required="required" placeholder="객실의 남은 개수를 입력해주세요.">					
						</div>
						<div class="form-group">
							<label><span class="red">*</span>객실타입</label>
							<select name="roomtype" class="form-control" id="roomtype" required="required">
								<option value="N">노말</option>
								<option value="D">디럭스</option>
								<option value="S">스위트</option>
							</select> 
						</div>
						<div class="form-group">
							<label><span class="red">*</span>장소구분</label>
							<select name="ldiv" class="form-control" id="ldiv" required="required">
								<option value="0">국내</option>
								<option value="1">해외</option>
							</select> 
						</div>
						<div class="form-group">
							<label><span class="red">*</span>예약 가능 여부</label>
							<select name="bookedup" class="form-control" id="bookedup" required="required">
								<option value="0">예약가능</option>
								<option value="1">예약불가능</option>
							</select> 
						</div>
						
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>