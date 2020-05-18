<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>

<style>
	table .table table-bordered th,td,th{
       text-align: center;
    }
    .rentcarList:hover {
    	background-color : lightgrey;
    }
</style>
<script>

</script>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">렌트카 관리</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType" style="width:200px; height: 25px;">
						<option value="N" ${cri.searchType ==null?'selected':''}>----------</option>
						<option value="rentcarType" ${cri.searchType =='rentcarType'?'selected':''}>차종류</option>
						<option value="rentcarCno" ${cri.searchType =='rentcarCno'?'selected':''}>차번호</option>
						<option value="rentDepartaddr" ${cri.searchType =='rentDepartaddr'?'selected':''}>대여,반납 장소</option>
						<option value="rentLDiv" ${cri.searchType =='rentLDiv'?'selected':''}>장소구분(국내/해외)</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button id="btnRegister">렌트카 추가</button>
				</div>
				<div class="box-body">
				<p id="datePick">
				<span><i class="far fa-calendar-alt"></i> 시작 날짜 </span> 
				<span class="picker"><input type="date" class="datepicker" name="rentddate" placeholder="날짜를 선택하려면 클릭." style="height:30px;"></span>
				<span><i class="far fa-calendar-alt"></i> ~  종료 날짜 </span> 
				<span class="picker"><input type="date" class="datepicker" name="returndate" placeholder="날짜를 선택하려면 클릭." style="height:30px;"></span>
				<span id="pickSearch"><a href="#"><i class="fas fa-search"></i></a></span>
			</p>
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
							<th>상세보기</th>
							
						</tr>
						<c:forEach var="rentcarList" items="${list}">
						<tr class="rentcarList" data-click="${rentcarList.no}">
							<td>${rentcarList.no}</td>
							<td>${rentcarList.cdiv}</td>
							<td>${rentcarList.cno}</td>
							<td><fmt:formatDate value="${rentcarList.rentddate}" pattern="yyyy-MM-dd "/></td>
							<td><fmt:formatDate value="${rentcarList.returndate}" pattern="yyyy-MM-dd "/></td>
							<td>${rentcarList.rentaddr}</td>
							<td>${rentcarList.returnaddr}</td>
							<td>${rentcarList.price}</td>
							<td>${rentcarList.capacity}</td>
							<td>${rentcarList.insurance}</td>
							<td>${rentcarList.ldiv == 0?'해외':'국내'}</td>
							 <td><button style="background:steelblue; border:none;" class="toRentcarDetail" data-click="${rentcarList.no }">상세보기</button>
							 <button style="background:tomato; border:none;" class="delRentcar" data-click="${rentcarList.no }">삭제</button></td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/manager/rentcarMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}&keyword2=${cri.keyword2}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/manager/rentcarMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}&keyword2=${cri.keyword2}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/manager/rentcarMngList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}&keyword2=${cri.keyword2}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	               </div>
				</div>
			</div>         
		</div>
	</div>
</div>

<script>
 $("i.fas.fa-search").click(function(){
	var rentddate = $("input[name='rentddate']").val();
	var returndate = $("input[name='returndate']").val();
	location.href = "${pageContext.request.contextPath}/manager/rentcarMngList?searchType=rentDepartDate"+"&keyword="+rentddate+"&keyword2="+returndate;

	//<option value="rentDepartDate" ${cri.searchType =='rentDepartDate'?'selected':''}>출발날짜</option>
 })
 

$("#btnSearch").click(function(){
	var searchType = $("#searchType").val();
	var keyword = $("#keywordInput").val();
	location.href = "${pageContext.request.contextPath}/manager/rentcarMngList?searchType="+searchType+"&keyword="+keyword;
	//searchBoardController의 listPage GET 으로 받음 
	
})

$("#btnRegister").click(function(){
	location.href = "${pageContext.request.contextPath}/manager/rentcarRegister";
})

$(".toRentcarDetail").click(function(){
	var no = $(this).attr("data-click");
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	location.href = "${pageContext.request.contextPath}/manager/rentcarDetailForm?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
})
$(".delRentcar").click(function(){
	var cc = confirm("렌트카 상품을 삭제하시겠습니까?");
	if(cc){
	var no = $(this).attr("data-click");
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	location.href = "${pageContext.request.contextPath}/manager/delRentcar?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
	}
})

</script>

<%@ include file="../../include/footer.jsp"%>