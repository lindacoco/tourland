<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	table .table table-bordered th,td,th{
       text-align: center;
    }
</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">렌트카 관리</h2>
				</div>
				<div class="box-body">

					<select name="searchType" id="searchType">
						<option value="N">----------</option>
						<option value="rentcarType">차종류</option>
						<option value="rentcarNo">차번호</option>
						<option value="rentDepartDate">출발날짜</option>
						<option value="rentDepartaddr">대여,반납 장소</option>
						<option value="rentLDiv">장소구분</option>
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
							<th>차 종류</th>
							<th>차 번호</th>
							<th>대여 일자</th>
							<th>반납 일자</th>
							<th>대여 장소</th>
							<th>반납 장소</th>
							<th>가격</th>
							<th>허용인원</th>
							<th>보험여부</th>
							<th>국내/해외</th>
						</tr>
						<c:forEach var="rentcarList" items="${list}">
						<tr class="rentcarList" data-no="${rentcarList.no}">
							<td>${rentcarList.no}</td>
							<td>${rentcarList.cdiv}</td>
							<td>${rentcarList.cno}</td>
							<td>${rentcarList.rentddate}</td>
							<td>${rentcarList.returndate}</td>
							<td>${rentcarList.rentaddr}</td>
							<td>${rentcarList.returnaddr}</td>
							<td>${rentcarList.price}</td>
							<td>${rentcarList.capacity}</td>
							<td>${rentcarList.insurance}</td>
							<td>${rentcarList.ldiv == 0?'해외':'국내'}</td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/rentcarMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/rentcarMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/rentcarMngList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	               </div>
				</div>
			</div>         
		</div>
	</div>
</div>

<script>
$("#btnSearch").click(function(){
	var searchType = $("#searchType").val();
	var keyword = $("#keywordInput").val();
	location.href = "${pageContext.request.contextPath}/rentcarMngList?searchType="+searchType+"&keyword="+keyword;
	//searchBoardController의 listPage GET 으로 받음 
	
})

$("#btnRegister").click(function(){
	location.href = "${pageContext.request.contextPath}/rentcarRegister";
})

//각 리스트를 클릭했을 때 디테일로 넘어가는 부분
$(".rentcarList").click(function(){
	var no = $(this).attr("data-click");
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	location.href = "${pageContext.request.contextPath}/rentcarDetailForm?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
	
})
</script>

<%@ include file="../../include/footer.jsp"%>