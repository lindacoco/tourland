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
					<h2 class="box-title">직원 관리</h2>
				</div>
				<div class="box-body">
				<!-- 검색 작업에서 유지될 데이터 
					1. 현재 페이지의 번호     
					2. 페이지당 보여지는 데이터의 수
					3. 검색의 종류
					4. 검색의 키워드
				 -->
					<select name="searchType" id="searchType" style="width:200px; height: 25px;">
						<option value="n" ${cri.searchType ==null?'selected':''}>-----</option>
						<option value="empNo" ${cri.searchType =='empNo'?'selected':''}>사원번호</option>
						<option value="empName" ${cri.searchType =='empName'?'selected':''}>사원명</option>

					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
				    <button id="twowayBtn">${btnName }</button>
					<button id="btnRegister" style="background:mistyrose; margin-left:10px; ${btnName =='퇴사사원 조회'?'visibility:visible;':'visibility:hidden;'}" >추가</button>
					
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width:100px;">사원 번호</th>
							<th>사원명</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>아이디</th>
							<th>권한</th>
						</tr>     
						<!-- 반복 돌면서 list가져오기 -->
						<c:forEach var="empList" items="${list}">
						    <tr data-click="${empList.empno }" class="empList"> <!-- 전체 줄 클릭했을 때 디테일로 넘어가도록 처리할 data-click 속성 선언 -->
						    <td>${empList.empno }</td>
						    <td>${empList.empname }</td>
						    <td><fmt:formatDate value="${empList.empbirth }" pattern="yyyy-MM-dd hh:mm"/></td>
						    <td>${empList.emptel }</td>
						    <td>${empList.empid }</td>
						    <td>${empList.empauth==1?"관리자":"사원" }</td>
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
	                          <li><a href="${pageContext.request.contextPath}/empMngList/${empretired }?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/empMngList/${empretired }?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/empMngList/${empretired }?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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
		
		if("${btnName}"=="퇴사사원 조회"){ //근무사원 리스트에서 검색한 경우
		  location.href = "${pageContext.request.contextPath}/empMngList/0?searchType="+searchType+"&keyword="+keyword;
		}else{
		  location.href = "${pageContext.request.contextPath}/empMngList/1?searchType="+searchType+"&keyword="+keyword;	
		}
		
	})
	
	$("#btnRegister").click(function(){
		
		location.href = "${pageContext.request.contextPath}/employeeRegister";
	})
	
	//퇴사 사원 혹은 근무사원 리스트 클릭
	$("#twowayBtn").click(function(){
	   //버튼 이름이 퇴사사원 조회인 경우 = 지금 페이지는 현직 직원 리스트 
	   var btnName = "${btnName}";
	   
	   if(btnName == "퇴사사원 조회"){
	    	
	       location.href ="${pageContext.request.contextPath}/empMngList/1";
	       
	    }else{
	
	       location.href ="${pageContext.request.contextPath}/empMngList/0";
	    }
	})
	
	//각 리스트를 클릭했을 때 디테일로 넘어가는 부분
	$(".empList").click(function(){
		var empno = $(this).attr("data-click");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "${pageContext.request.contextPath}/employeeDetail/${empretired}?empno="+empno+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
		
	})
</script>

<%@ include file="../../include/footer.jsp"%>