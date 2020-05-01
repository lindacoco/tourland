<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<script>
	$(function(){
		$("#mod").click(function(){
			var no = "${faq.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}"==""?"N":"${cri.searchType}";
			var searchType2 = "${cri.searchType2}"==""?"N":"${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "FAQModify?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
		$("#del").click(function(){
			if(!confirm("정말 삭제하시겠습니까?")) {
				alert("삭제가 취소되었습니다");
				return false;
			}
			var no = "${notice.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}"==""?"N":"${cri.searchType}";
			var searchType2 = "${cri.searchType2}"==""?"N":"${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "removeNotice?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
		$("#return").click(function() {
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}"==""?"N":"${cri.searchType}";
			var searchType2 = "${cri.searchType2}"==""?"N":"${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "noticeMngList?page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">공지사항</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label>번호</label>
						<input type="text" name="title" class="form-control" value="${notice.no}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="title" class="form-control" value="${notice.title}">
					</div>
					<div class="form-group">
						<label>제목</label>
						<textarea rows="15" cols="30" name="content" class="form-control">${notice.content }</textarea>
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