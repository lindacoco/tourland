<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>

<style>
	/* #opa { width: 100%; height: 100%; background: gray; opacity: 0.2; } */
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
					<h2 class="box-title">고객 관리</h2>
				</div>
				<div class="box-body">
				<!-- 검색 작업에서 유지될 데이터 
					1. 현재 페이지의 번호     
					2. 페이지당 보여지는 데이터의 수
					3. 검색의 종류
					4. 검색의 키워드
				 -->
					<select name="searchType" id="searchType" style="width:200px;">
						<option value="n" ${cri.searchType ==null?'selected':''}>-----</option>
						<option value="유저아이디" ${cri.searchType =='userId'?'selected':''}>유저아이디</option>
						<option value="유저명" ${cri.searchType =='userName'?'selected':''}>유저명</option>

					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button>추가</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width:100px;">유저번호</th>
							<th>유저명</th>
							<th>생년월일</th>
							<th>여권등록여부</th>
							<th>유저아이디</th>
						</tr>     
						<!-- 반복 돌면서 list가져오기 -->
						<c:forEach var="userList" items="${list}">
						    <tr data-click="${userList.userno }"> <!-- 전체 줄 클릭했을 때 디테일로 넘어가도록 처리할 data-click 속성 선언 -->
						    <td>${userList.userno }</td>
						    <td>${userList.username }</td>
						    <td><fmt:formatDate value="${userList.userbirth }" pattern="yyyy-MM-dd hh:mm"/></td>
						    <td>${userList.userpassport == null?'등록필요':'등록완료' }</td>
						    <td>${userList.userid }</td>
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
	                          <li><a href="listPage?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="listPage?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="listPage?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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
		location.href = "listPage?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 
		
	})
	
	$("#btnRegister").click(function(){
		location.href = "register";
	})
</script>

<%@ include file="../../include/footer.jsp"%>