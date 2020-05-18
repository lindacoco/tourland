<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	.table th,td {
		text-align: center;
	}
	.pagination {
		margin-left : 650px;
	}
	.active {
		background-color : lightblue;
		color : white;  
	}
	.tourList:hover {
		cursor : pointer;
		background-color : lightgrey;
	}
	#prev, #next {
		padding-top : 40px;
	}
</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">현지 투어 관리</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option value="N">----------</option>
						<option value="name">투어이름</option>
						<option value="location">투어지역</option>
						<option value="date">날짜</option>
						<option value="addr">주소</option>
						<option value="div">장소구분</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button id="btnRegister">추가</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>투어제목</th>
							<th>투어장소</th>
							<th>시작일자</th>
							<th>종료일자</th>
							<th>주소</th>
							<th>소요시간</th>
							<th>허용인원</th>
							<th>가격</th>
							<th>장소구분</th>
						</tr>
						<c:forEach var="tour" items="${list}">
						<tr class="tourList" data-no="${tour.no}">
							<td>${tour.no}</td>
							<td>${tour.tname}</td>
							<td>${tour.tlocation}</td>
							<td><fmt:formatDate value="${tour.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${tour.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${tour.taddr}</td>
							<td><fmt:formatDate value="${tour.etime}" pattern="HH:mm:ss"/></td>
							<td>${tour.capacity}</td>
							<td><fmt:formatNumber value="${tour.tprice}" pattern="###,###"/></td>
							<td>${tour.ldiv?'해외':'국내'}</td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<ul class="pagination">
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageContext.request.contextPath}/manager/tourMngList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/manager/tourMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/manager/tourMngList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
					</c:if>
					</ul>
				</div>
			</div>         
		</div>
	</div>
</div>

<script>
	var curPage = ${page};
	var fixSearchTypeAndKeyword = function() {
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		$("#searchType option").each(function(i, obj) {
			var value = $(this).val();
			if(value==searchType) {
				$(this).prop("selected",true);
				return;
			}
		})
		$("#keywordInput").val(keyword);
	};
	$(".tourList").click(function() {
		var no = $(this).attr("data-no");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "tourDetail?no="+no+"&page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$("#btnSearch").click(function(){
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "tourMngList?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 	
	})
	$("#btnRegister").click(function(){
		location.href = "tourRegister";
	})
	fixSearchTypeAndKeyword();
	$(document).on("click",".pagination li",function() {
		curPage = $(this).text();
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "tourMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$(document).on("click","#prev",function(){
		curPage = ${pageMaker.startPage-1};
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "tourMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$(document).on("click","#next",function(){
		curPage = ${pageMaker.endPage+1};
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "tourMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
</script>

<%@ include file="../../include/footer.jsp"%>