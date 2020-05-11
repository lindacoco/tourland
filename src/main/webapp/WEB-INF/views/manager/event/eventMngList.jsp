<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	/* #opa { width: 100%; height: 100%; background: gray; opacity: 0.2; } */
	
	table .table table-bordered th,td,th{
       text-align: center;
    }
    .eventList:hover {
    	background-color : lightgrey;
    }

    #formTable td{
       height: 95px;
       vertical-align: middle;
    }

    #previewPopup1{
    width:400px;
    box-shadow: 0 0 8px black;
    position: absolute;
    left:85px;
    top:50px;
  }

</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12" style="heigth:800px;">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">이벤트  관리</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType" style="width:200px; height: 25px;">
						<option value="n" ${cri.searchType ==null?'selected':''}>-----</option>
						<option value="eventTitle" ${cri.searchType =='eventTitle'?'selected':''}>이벤트 타이틀</option>
						<option value="evemtContent" ${cri.searchType =='evemtContent'?'selected':''}>이벤트 설명</option>

					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button id="btnRegister">추가</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered" id="formTable">
						<tr>
							<th style="width:100px;">이벤트 번호</th>
							<th>썸네일</th>
							<th style="width:15%">이벤트명</th>
							<th style="width:35%">이벤트설명</th>
							<th style="width:8%">시작 날짜</th>
							<th style="width:8%">종료 날짜</th>
					        <th>상세보기</th>
						</tr>     
						<!-- 반복 돌면서 list가져오기 -->
						<c:forEach var="eventList" items="${list}">
						    <tr data-click="${eventList.no }" class="eventList"> 
						    <td>${eventList.no }</td>
						    <td><img src="displayFile/event?filename=${eventList.pic }" style="width:95px; height:95px;" ></td>
						    <td>${eventList.title }</td>
						    <td>${eventList.content }</td>
						    <td><fmt:formatDate value="${eventList.startdate}" pattern="yyyy-MM-dd"/></td>
						    <td><fmt:formatDate value="${eventList.enddate}" pattern="yyyy-MM-dd"/></td>
						    <td><button style="background:lightskyblue; border:none;" class="toEventDetail" data-click="${eventList.no }">상세보기</button></td>
						    </tr>
						</c:forEach>	
					</table>      
				</div>
		        <div class="box-footer">
	             <%--   --%>
	              <!--  부트 스트랩으로 사용  -->
	              <div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/eventMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/eventMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/eventMngList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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
		location.href = "${pageContext.request.contextPath}/eventMngList?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 
		
	})
	
	$("#btnRegister").click(function(){
		location.href = "${pageContext.request.contextPath}/eventRegister";
	})

	
	$(".toEventDetail").click(function(){
		var no = $(this).attr("data-click");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "${pageContext.request.contextPath}/eventDetailForm?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
	})
	
</script>

<%@ include file="../../include/footer.jsp"%>