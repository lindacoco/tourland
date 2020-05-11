<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	.form-group input{
		background-color: lightgray;
	}
	#small div{
	    float: left;
	    margin-top: 20px;
	    width: 200px;
	}
</style>
<script>
	$(function(){
/* 		$("#mod").click(function(){
			var no = "${plan.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "planModify?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
		$("#del").click(function(){
			if(!confirm("정말 삭제하시겠습니까?")) {
				alert("삭제가 취소되었습니다");
				return false;
			}
			var no = "${plan.no}";
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "planDelete?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		}) */
		$("#goList").click(function() {
			var page =	"${cri.page}";
			var searchType = "${cri.searchType}";
			var searchType2 = "${cri.searchType2}";
			var keyword = "${cri.keyword}";
			location.href = "planBoardList?page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">상품 문의사항</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="title" class="form-control" value="${plan.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="15" cols="30" placeholder="내용을 입력하세요" name="content" class="form-control" readonly="readonly"><c:out value="${plan.content}"/></textarea>
					</div>
				<div id="small">	
					<div class="form-group">
						<label>대분류</label>
						<input type="text" readonly="readonly" value="${plan.lcate eq 'D'?'국내패키지상품':plan.lcate eq 'I'?'해외패키지상품':plan.lcate eq 'R'?'상품 예약 및 결제':'회원혜택안내'}" class="form-control" style="width:117px;">		 
					</div>
					<div class="form-group">
						<label>중분류</label>
						<input type="text" readonly="readonly" value="${plan.mcate eq 'P'?'여행상품':plan.mcate eq 'V'?'여권 및 비자':plan.mcate eq 'T'?'환율':plan.mcate eq 'J'?'제주여행':plan.mcate eq 'B'?'예약 및 취소':plan.mcate eq 'R'?'결제 및 환불':plan.mcate eq 'C'?'쿠폰 및 이벤트':'기타'}" class="form-control" style="width:117px;">
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="text" readonly="readonly" value="${plan.writer }" class="form-control" style="width:117px;">
					</div>
					<div class="form-group">
						<label>작성일자</label>
						<input type="text" readonly="readonly" value="<fmt:formatDate value="${plan.regdate}" pattern="yyyy-MM-dd"/>" class="form-control" style="width:117px;">
					</div>
					<div class="form-group">
						<label>답변여부</label>
						<input type="text" readonly="readonly" value="${plan.answer=='0'? '미완료':'완료'}" class="form-control" style="width:117px;">
					</div>
				</div>
				</div>
				<div class="box-footer">
					<button class="btn btn-warning" id="answer">답변하기</button>
					<button class="btn btn-primary" id="goList">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>