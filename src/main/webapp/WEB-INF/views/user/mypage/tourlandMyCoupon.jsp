<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>    
	/* 본문 */
	section div#myreserv { width:1000px; height: 100%; 
							  margin-left: 200px;
							 }
	section div#myreserv h1 { width: 200px;
								 height: 30px;  
							     padding: 20px;
							     border-bottom: 1px solid #929292; }							  
		
	#info { font-size: 13px; color: #929292; 
			margin-left: 10px;  }	
			
	table#reserv { width: 950px;  
				   border-collapse: collapse; 
				   margin: 0 40px 40px 40px; 
				   font-size: 14px; }
	table#reserv th, tr, td { border-top: 1px solid gray;
							  border-bottom: 1px solid gray;
						     text-align: center;     
						     height: 30px; }
	table#reserv th { background: #F2F2F2; height: 30px; }
	#warning { margin: 40px 0 10px 40px; font-size: 14px; color: maroon; font-weight: bold; }					        
</style>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userMyPageMenu.jsp"%>   
				<div id="myreserv">
				<h1>쿠폰</h1>
					<span id="info">쿠폰을 활용해서 멀리 떠나보세요! </span>
					
					<p id="warning">* 쿠폰은 만료일자가 가까운 순서로 정렬 됩니다.</p>
					<table id="reserv">
					
						<tr>
							<th>쿠폰 번호</th>
							<th>쿠폰 명</th>
							<th>쿠폰 내용</th>
							<th>만료 일자</th>
							<th>할인율</th>
						</tr>
						<c:forEach items="${list }" var="c">
						<tr>
							<td>${c.cno }</td>
							<td>${c.cname }</td>
							<td>${c.ccontent }</td>
							<td><fmt:formatDate value="${c.edate }" pattern="yyyy-MM-dd"/></td>
							<td>${c.mrate }%</td>  
						</tr>
						</c:forEach>
					</table>    
				</div>      
		
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>