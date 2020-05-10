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
	.pagination li:hover {
		cursor: pointer;
	}
	.active {
		background-color : lightblue;
		color : white;  
	}
	.faqList:hover {
		cursor : pointer;
		background-color : lightgrey;
	}
</style>
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">상품 문의사항</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option value="">전체</option>
						<option value="D">국내패키지상품</option>
						<option value="I">해외패키지상품</option>
						<option value="R">상품 예약 및 결제</option>
						<option value="U">회원혜택안내</option>
					</select>
					<select name="searchType2" id="searchType2">
						<option value="N">-----------</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">검색</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>대분류</th>
							<th>중분류</th>
						</tr>
						<c:forEach var="planBoard" items="${list}">
						<tr class="planBoardList" data-no="${vo.no}">
							<td>${planBoard.no}</td>
							<td>${planBoard.title}</td>
							<td>${planBoard.lcate eq 'D'?'국내패키지상품':planBoard.lcate eq 'I'?'해외패키지상품':planBoard.lcate eq 'R'?'상품 예약 및 결제':'회원혜택안내'}</td>
							<td>${planBoard.mcate eq 'P'?'여행상품':planBoard.mcate eq 'V'?'여권 및 비자':planBoard.mcate eq 'T'?'환율':planBoard.mcate eq 'J'?'제주여행':planBoard.mcate eq 'B'?'예약 및 취소':planBoard.mcate eq 'R'?'결제 및 환불':planBoard.mcate eq 'C'?'쿠폰 및 이벤트':'기타'}</td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<ul class="pagination">
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageContext.request.contextPath}/FAQMngList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/FAQMngList?page=${idx}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/FAQMngList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">&raquo;</a></li>
					</c:if>
					</ul>
				</div>
			</div>         
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>