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
				   margin: 40px; 
				   font-size: 14px; }
	table#reserv th, tr, td { border: 1px solid gray;
						     text-align: center; 
						     height: 30px; }
	table#reserv th { background: #ece6cc; height: 30px; }					    
</style>
<body>   
	<%@ include file="../../include/userHeader.jsp"%>
		<section>
		<%@ include file="../../include/userMyPageMenu.jsp"%>   
				<div id="myreserv">
				<h1>쿠폰</h1>
					<span id="info">쿠폰을 활용해서 멀리 떠나보세요! </span>
					
					<table id="reserv">
						<tr>
							<th>쿠폰 번호</th>
							<th>쿠폰 명</th>
							<th>쿠폰 내용</th>
							<th>만료 일자</th>
							<th>할인율</th>
						</tr>
						<tr>
							<td>1</td>
							<td>모든 해외여행 총집합 할인</td>
							<td>모든 해외여행 30% 할인</td>
							<td>2020/05/20</td>
							<td>30%</td>
						</tr>
						<tr>
							<td>2</td>
							<td>여름 휴가 시작 할인</td>
							<td>여름 휴가 떠나자 할인 쿠폰</td>
							<td>2020/08/01</td>
							<td>20%</td> 
						</tr>
					</table>
				</div>
		
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>