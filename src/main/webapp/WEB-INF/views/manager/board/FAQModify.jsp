<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<script>
	$(function(){
		$("#mcate").empty();
		var val = "${faq.lcate}";
		switch(val) {
		case "D":
			var option = $("<option value='J'>").html("제주여행");
			$("#mcate").append(option);
			break;
		case "I":
			var option1 = $("<option value='P'>").html("여행상품");
			var option2 = $("<option value='V'>").html("여권 및 비자");
			var option3 = $("<option value='T'>").html("환율");
			var option4 = $("<option value='E'>").html("기타");
			$("#mcate").append(option1).append(option2).append(option3).append(option4);
			break;
		case "R":
			var option1 = $("<option value='B'>").html("예약 및 취소");
			var option2 = $("<option value='R'>").html("결제 및 환불");
			$("#mcate").append(option1).append(option2);
			break;
		case "U":
			var option = $("<option value='C'>").html("쿠폰,이벤트");
			$("#mcate").append(option);
			break;
		}
		$("#lcate option").each(function(i,obj){
			var searchType = "${faq.lcate}";
			if($(obj).val()==searchType) {
				$(obj).prop("selected",true);
			}
		})
		$("#mcate option").each(function(i,obj){
			var searchType2 = "${faq.mcate}";
			if($(obj).val()==searchType2) {
				$(obj).prop("selected",true);
			}
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">FAQ 수정</h3>
				</div>
				<form role="form" action="FAQModify" method="post">
					<input type="hidden" value="${faq.no}" name="no">
					<input type="hidden" value="${cri.page}" name="page">
					<input type="hidden" value="${cri.searchType}" name="searchType">
					<input type="hidden" value="${cri.searchType2}" name="searchType2">
					<input type="hidden" value="${cri.keyword}" name="keyword">
					<div class="box-body">
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" value="${faq.title}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea rows="15" cols="30" placeholder="내용을 입력하세요" name="content" class="form-control"><c:out value="${faq.content}"/></textarea>
						</div>
						<div class="form-group">
							<label>대분류</label>
							<select name="lcate" class="form-control" id="lcate" required="required">
								<option value="D">국내패키지상품</option>
								<option value="I">해외패키지상품</option>
								<option value="R">상품 예약 및 결제</option>
								<option value="U">회원혜택안내</option>
							</select> 
						</div>
						<div class="form-group">
							<label>중분류</label>
							<select name="mcate" class="form-control" id="mcate" required="required">
							</select>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>