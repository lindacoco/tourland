<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<script>
	$(function(){
		$("#mod").click(function(){
			var no = "${tour.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "tourModify?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
		$("#del").click(function(){
			if(!confirm("정말 삭제하시겠습니까?")) {
				alert("삭제가 취소되었습니다");
				return false;
			}
			var no = "${tour.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "tourDelete?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
		$("#return").click(function() {
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "tourMngList?page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">현지 투어 상세보기</h3>
				</div>
					<div class="box-body">
						<div class="col-sm-6">
							<div class="form-group">
								<label>번호</label> <input type="text" value="${tour.no}"
									class="form-control" readonly="readonly" name="no">
							</div>
							<div class="form-group">
								<label>지역구분</label> 
								<input type="text" value="${tour.ldiv? '해외':'국내'}"
									class="form-control" readonly="readonly" name="ldiv">
							</div>
							<div class="form-group">
								<label>투어지역</label>
								<input type="text" value="${tour.tlocation}"
									class="form-control" readonly="readonly" name="tlocation">
							</div>
							<div class="form-group">
								<label>투어 제목</label> <input type="text"
									class="form-control" value="${tour.tname}" readonly="readonly" name="tname">
							</div>
							<div class="form-group">
								<label>시작일자</label> <input type="text" value="<fmt:formatDate value='${tour.startDate}' pattern='yyyy-MM-dd'/>"
									class="form-control" readonly="readonly" name="startDate">
							</div>
							<div class="form-group">
								<label>종료일자</label> <input type="text" value="<fmt:formatDate value='${tour.endDate}' pattern='yyyy-MM-dd'/>"
									class="form-control" readonly="readonly" name="endDate">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>주소</label> <input type="text" 
									class="form-control" readonly="readonly" value="${tour.taddr}" name="taddr">
							</div>
							<div class="form-group">
								<label>소요시간</label> <input type="text" 
									class="form-control" readonly="readonly" value="<fmt:formatDate value='${tour.etime}' pattern='HH:mm:ss'/>" name="etime">
							</div>
							<div class="form-group">
								<label>인원수</label>
								<input type="text"  value="${tour.capacity}" readonly="readonly" class="form-control" name="capacity">
							</div>
							<div class="form-group">
								<label>가격</label> <input type="text" value='<fmt:formatNumber value='${tour.tprice}'></fmt:formatNumber>'
									class="form-control" readonly="readonly" name="tprice">
							</div>
						</div>
					</div>
					<div class="box-footer">
						<button class="btn btn-warning" id="mod">수정</button>
						<button class="btn btn-danger" id="del">삭제</button>
						<button class="btn btn-primary" id="return">돌아가기</button>
					</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>