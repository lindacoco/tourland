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
							<th>상품제목</th>
							<th>출발일자</th>
							<th>도착일자</th>
							<th>여행기간</th>
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
								<c:forEach var="air" items="${product.air}" begin="0" end="0">
									<fmt:formatDate value="${air.ddate}" pattern="yyyy-MM-dd"/>
									<c:set var="ddate" value="${air.ddate.time}"/>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="air" items="${product.air}" begin="1" end="1">
									<fmt:formatDate value="${air.rdate}" pattern="yyyy-MM-dd"/>
									<c:set var="rdate" value="${air.rdate.time}"/>
								</c:forEach>
							</td>
							<td>
								<c:set value="${(rdate-ddate)/(1000*60*60*24)}" var="dateDiff"/>
								<fmt:formatNumber value='${dateDiff-(dateDiff%1)+1}' type='number'/>
							</td>
							<td>
								<c:forEach var="hotel" items="${product.hotel}" begin="0" end="0">
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
						<li><a href="${pageContext.request.contextPath}/productMngList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/productMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/productMngList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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