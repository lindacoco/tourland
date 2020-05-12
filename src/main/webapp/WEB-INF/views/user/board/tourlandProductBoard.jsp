<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/paging.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/css/boardStyle.css" rel="stylesheet" type="text/css" />

</head>

<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userBoardMenu.jsp"%>   
				<div id="myreserv">
				<h1>상품문의 사항</h1>
				<div id="searchDiv">
					    <select name="searchType" id="searchType" >
						<option value="N" ${cri.searchType ==null?'selected':''}>----------</option>
						<option value="" ${cri.searchType ==''?'selected':''}>내용</option>
						<option value="" ${cri.searchType ==''?'selected':''}>글쓴이</option>
						<option value="" ${cri.searchType ==''?'selected':''}>등록날짜</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" placeholder="검색어를 입력해주세요">
					<button id="btnSearch">검색</button>
				</div>
					<table id="reserv">
						<tr>
							<th class="nono">번호</th>
							<th class="thTitle">제목</th>
							<th>작성자</th>
							<th>작성 일자</th>

						</tr>
						<c:forEach var="custBoardList" items="${list}">
						<tr class="custBoardList" data-click="${custBoardList.no}">
							<td class="nono">${custBoardList.no}</td>
							<td class="thTitle">${custBoardList.title}</td>
							<td>${custBoardList.writer}</td>
							<td><fmt:formatDate value="${custBoardList.regdate}" pattern="yyyy-MM-dd "/></td>
						</tr>
						</c:forEach>    
					</table>
					   <div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/tourlandCustBoard?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/tourlandCustBoard?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/tourlandCustBoard?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	               </div>
				</div>
		    
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>