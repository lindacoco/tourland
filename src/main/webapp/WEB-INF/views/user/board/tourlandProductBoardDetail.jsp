<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/boardStyle.css" rel="stylesheet" type="text/css" />
<style>
  section nav ul li:nth-child(4) {
	background: mistyrose;
}
#datailRealContent{
	width: 700px;
    margin: 0 auto;
    margin-top: 30px;
    margin-bottom: 50px;
}
#respond{
	background-color: #D5D5D5;
    margin-top: 52px;
    padding: 75px;
}

</style>
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
				   <li> <fmt:formatDate value='${plan.regdate }' pattern="yyyy-MM-dd"/></li>
				   </ul>
				   <div id="datailRealContent">
				       ${plan.content}
				   </div>
				   
				   	<!-- 답변이 있을때 나오게 -->
				   	
				   <c:if test="${plan.answer ==1}">
				   <hr>
					   	<div id="respond">
					   			${plan.respond }
					   	</div>
				   </c:if>
				   
				   <!-- 답변  -->
				   <c:if test="${Manager!=null }">
				   	   	<div id="detailComment">
				     	 	<button id="reply">답변관리</button>
				   		</div>
				   </c:if>
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
	$("#reply").click(function(){
		var answer ="${plan.answer}";
		var no = "${plan.no }";
		if(answer==0){
			location.href = "planBoardDetail?no="+no;
		}
	})
</script>
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>