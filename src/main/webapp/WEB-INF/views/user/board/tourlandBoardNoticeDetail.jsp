<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/boardStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userBoardMenu.jsp"%>   
		    <div id="detailDiv">
				<div>
				  <br>
				  <p>투어랜드에서 알려드리는 공지사항입니다. </p>
				</div>
				<div id="detailContent">
				   <ul id="datailUl">
				   <li> ${notice.no} </li>
				   <li class="detailLi"> ${notice.title} </li>
				   <li> ${notice.writer} </li>
				   <li> <fmt:formatDate value='${notice.regdate}' pattern="yyyy-MM-dd"/> </li>
				   </ul>
				   <div id="datailRealContent">
				       ${notice.content}
				   </div>
				</div>
				
				
		     </div>
		     
		</section>
		<script>
	$("#btnSearch").click(function(){
		var searchType = $("#searchType").val();
		var keyword = $("#keywordInput").val();
		location.href = "tourlandBoardNotice?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 
		
	})
</script>
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>