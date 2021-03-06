<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.productList:hover {
		cursor : pointer;
		background-color : lightgrey;
	}
	#prev, #next {
		padding-top : 40px;
	}
</style>
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">상품 리스트</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option value="N" ${cri.searchType=='N'?'selected':''}>----------</option>
						<option value="name" ${cri.searchType=='name'?'selected':''}>상품제목</option>
						<option value="expire" ${cri.searchType=='expire'?'selected':''}>유효기간</option>
						<option value="location" ${cri.searchType=='location'?'selected':''}>지역</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button id="btnRegister">추가</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>상품제목</th>
							<th>항공편명</th>
							<th>호텔상품</th>
							<th>투어상품</th>
							<th>렌트카상품</th>
							<th>상품유효기간</th>
							<th>가격</th>
						</tr>
						<c:forEach var="product" items="${list}">
						<tr class="productList" data-no="${product.pno}">
							<td>${product.pno}</td>
							<td>${product.pname}</td>
							<td>
								<c:forEach var="air" items="${product.air}">
									${air.ano}
								</c:forEach>
							</td>
							<td>
								<c:forEach var="hotel" items="${product.hotel}">
									<p>
										${hotel.hname}
									</p>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="tour" items="${product.tour}">
									<p>
										${tour.tname}
									</p>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="rentcar" items="${product.rentcar}">
									<p>
										${rentcar.cdiv eq 'L'?'경차':rentcar.cdiv eq 'S'?'세단':rentcar.cdiv eq 'U'?'SUV':
										rentcar.cdiv eq 'V'?'밴':'버스'}
									</p>
								</c:forEach>
							</td>
							<td><fmt:formatDate value="${product.pexpire}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatNumber value="${product.pprice}" pattern="###,###"/></td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<ul class="pagination">
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageContext.request.contextPath}/manager/productMngList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/manager/productMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/manager/productMngList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
					</c:if>
					</ul>
				</div>
			</div>         
		</div>
	</div>
</div>
<script>
	var curPage = ${pageMaker.cri.page};
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
	$(".productList").click(function() {
		var no = $(this).attr("data-no");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "productDetail?no="+no+"&page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$("#btnSearch").click(function(){
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "productMngList?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 	
	})
	$("#btnRegister").click(function(){
		location.href = "addProductForm";
	})
	fixSearchTypeAndKeyword();
	$(document).on("click",".pagination li",function() {
		curPage = $(this).text();
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "productMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$(document).on("click","#prev",function(){
		curPage = ${pageMaker.startPage-1};
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "productMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
	$(document).on("click","#next",function(){
		curPage = ${pageMaker.endPage+1};
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "productMngList?page="+curPage+"&searchType="+searchType+"&keyword="+keyword;
	})
</script>

<%@ include file="../../include/footer.jsp"%>