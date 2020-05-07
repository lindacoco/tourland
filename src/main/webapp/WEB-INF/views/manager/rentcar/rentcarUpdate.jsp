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
		//달력을 오늘 이후로만 선택할 수 있게
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
	
	$(function(){
		$("#checkin").change(function() {
			//체크인 날짜가 선택되면 체크아웃은 체크인날짜 다음날부터 선택할 수 있게
			var checkIn = document.getElementById("checkin").value;
			var day = parseInt(checkIn.substr(8,10))+1;
			if (day < 10) {
				day = '0' + day;
			}
			var result = checkIn.substr(0,7)+ '-' + day;
			document.getElementById("checkout").setAttribute("min",result);
		})
	})
})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">렌트카 상품 등록</h3>
				</div>
				<form role="form" action="hotelRegister" method="post">
					<div class="box-body">
						<div class="noNameAddr">
							<label><span class="red">*</span>번호</label>
							<input type="text" name="no" class="form-control" value="${autoNo}" readonly>
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>차 종류</label>
							<select name="cdiv" class="form-control" required="required">
							   <option ${cri.searchType ==null?'selected':''}>---------</option>
							   <option value="L">경차</option>
							   <option value="S">세단</option>
							   <option value="U">SUV</option>
							   <option value="V">밴</option>
							   <option value="B">버스</option>
							</select>
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>차번호</label>
							<input type="text" name="cno" class="form-control" required="required">					<!-- 리스트 불러오도록 할 것  -->		
						</div>
						<div class="form-group">
							<label><span class="red">*</span>대여 날짜</label>
							<input type="date" name="rentddate" class="form-control"  required="required" id="checkin">	
						</div>
						<div class="form-group">
							<label><span class="red">*</span>반납 날짜</label>
							<input type="date" name="returndate" class="form-control" required="required" id="checkout">
						</div>
						<div class="form-group">
							<label><span class="red">*</span>대여장소</label>
							<input type="text" name="rentaddr" class="form-control" required="required" >							
						</div>
						<div class="form-group">
							<label><span class="red">*</span>반납장소</label>
							<input type="text" name="returnaddr" class="form-control" required="required" >					
						</div>
						<div class="form-group">
							<label><span class="red">*</span>가격</label>
							<input type="text" name="price" class="form-control" required="required" >					
						</div>
						<div class="form-group">
							<label><span class="red">*</span>허용인원 수</label>
							<select name="capacity" class="form-control"  required="required">
								<option value="4">4명</option>
								<option value="6">6명</option>
								<option value="10">10명</option>
								<option value="30">30명</option>
							</select> 
						</div>
						<div class="form-group">
							<label><span class="red">*</span>보험여부</label>
							<select name="insurance" class="form-control" id="ldiv" required="required">
								<option value="0">선택안함</option>
								<option value="1">포함</option>
							</select> 	
						</div>
						<div class="form-group">
							<label>장소구분</label>
							<select name="ldiv" class="form-control" id="ldiv" required="required">
								<option value="0">해외</option>
								<option value="1">국내</option>
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