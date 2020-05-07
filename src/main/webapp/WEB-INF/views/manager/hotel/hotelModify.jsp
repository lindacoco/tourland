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
    margin: 78px 522px;
    padding-top: 81px;
    width: 485px;
	}
	.box-footer button{
    	width: 200px;
    	height: 65px;
    	font-size: 20px;
    	margin-left:20px;
	}
	.error{
		color:red;
		display: none;
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
	
		$("#goList").click(function() {
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var keyword = "${cri.keyword}";
			location.href = "hotelMngList?page="+page+"&searchType="+searchType+"&keyword="+keyword;
		})
		
		$("form").submit(function(e){
			$(".error").css("display", "none");
			var price = $("input[name='price']").val();
			var capa = $("input[name='roomcapacity']").val();
			
			var priceReg = /^[0-9]{3,13}$/; //가격은 3-13 숫자
			if (priceReg.test(price) == false) {
				$("input[name='price']").next().css("display", "inline");
				  return false;
			  }
			
			var capaReg = /^[0-9]{1,3}$/;
			if (capaReg.test(capa) == false) {
				$("input[name='roomcapacity']").next().css("display", "inline");
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
					<h3 class="box-title">호텔 상품 등록</h3>
				</div>
				<form role="form" action="hotelModify" method="post">
					<input type="hidden" value="${cri.page}" name="page">
					<input type="hidden" value="${cri.searchType}" name="searchType">
					<input type="hidden" value="${cri.keyword}" name="keyword">
					<div class="box-body">
						<div class="noNameAddr">
							<label><span class="red">*</span>번호</label>
							<input type="text" name="no" class="form-control" value="${hotelVo.no }" readonly data-no="">
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>호텔이름</label>
							<input type="text" name="hname" class="form-control" required="required" value="${hotelVo.hname }">
						</div>
						<div class="noNameAddr">
							<label><span class="red">*</span>호텔주소</label>
							<input type="text" name="haddr" class="form-control" required="required" value="${hotelVo.haddr}">							
						</div>
						<div class="form-group">
							<label><span class="red">*</span>체크인 날짜</label>
							<input type="date" name="checkin" class="form-control"  id="checkin" value="<fmt:formatDate value="${hotelVo.checkin}" pattern='yyyy-MM-dd'/>">	
						</div>
						<div class="form-group">
							<label><span class="red">*</span>체크아웃 날짜</label>
							<input type="date" name="checkout" class="form-control"  id="checkout" value="<fmt:formatDate value="${hotelVo.checkout}" pattern='yyyy-MM-dd'/>">
						</div>
						<div class="form-group">
							<label><span class="red">*</span>허용인원수</label>
							<select name="capacity" class="form-control" id="capacity">
								<option value="1" ${hotelVo.capacity == 1? 'selected':'' }>1</option>
								<option value="2" ${hotelVo.capacity == 2? 'selected':'' }>2</option>
								<option value="3" ${hotelVo.capacity == 3? 'selected':'' }>3</option>
								<option value="4" ${hotelVo.capacity == 4? 'selected':'' }>4</option>
							</select> 
						</div>
						<div class="form-group">
							<label><span class="red">*</span>가격(1박)</label>
							<input type="text" name="price" class="form-control" value="${hotelVo.price }" >							
							<span class="error">가격은 4자리 이상의 숫자만 적어주세요.</span>
						</div>
						<div class="form-group">
							<label><span class="red">*</span>허용객실수</label>
							<input type="text" name="roomcapacity" class="form-control" value="${hotelVo.roomcapacity }">					
							<span class="error">허용객실수에는 4자리이하의 숫자만 적어주세요.</span>
						</div>
						<div class="form-group">
							<label><span class="red">*</span>객실타입</label>
							<select name="roomtype" class="form-control" id="roomtype">
								<option value="N" ${hotelVo.roomtype == "N"? 'selected':'' }>노말</option>
								<option value="D" ${hotelVo.roomtype == "D"? 'selected':'' }>디럭스</option>
								<option value="S" ${hotelVo.roomtype == "S"? 'selected':'' }>스위트</option>
							</select> 
						</div>
						<div class="form-group">
							<label>장소구분</label>
							<select name="ldiv" class="form-control" id="ldiv">
								<option value="1" ${hotelVo.ldiv == 1? 'selected':'' }>국내</option>
								<option value="0" ${hotelVo.ldiv == 0? 'selected':'' }>해외</option>
							</select>
						</div>
						<div class="form-group">
							<label>예약 가능 여부</label>
							<select name="bookedup" class="form-control" id="bookedup">
								<option value="0" ${hotelVo.bookedup == 0? 'selected':'' }>예약가능</option>
								<option value="1" ${hotelVo.bookedup == 1? 'selected':'' }>예약불가능</option>
							</select> 
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							<button class="btn btn-primary" id="goList">돌아가기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>