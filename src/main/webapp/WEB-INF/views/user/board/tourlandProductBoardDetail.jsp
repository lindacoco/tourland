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
				  <p>고객님의 문의사항 입니다. </p>
				</div>
				<div id="detailContent">
				   <ul id="datailUl">
				   <li> ${plan.no } </li>
				   <li class="detailLi"> ${plan.title} </li>
				   <li> ${plan.writer }</li>
				   <li> <fmt:formatDate value='${plan.regdate }' pattern="yyyy-MM-dd"/> </li>
				   </ul>
				   <div id="datailRealContent">
				       ${plan.content}
				       
				        
				        
				   </div>
				   <!-- 답변  -->
				   <div id="detailComment">
				      <button>답변하기</button>
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