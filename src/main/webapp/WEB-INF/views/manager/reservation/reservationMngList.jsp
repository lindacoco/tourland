<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	/* #opa { width: 100%; height: 100%; background: gray; opacity: 0.2; } */
</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">공지사항 관리</h2>
				</div>
				<div class="box-body">
				<!-- 검색 작업에서 유지될 데이터 
					1. 현재 페이지의 번호     
					2. 페이지당 보여지는 데이터의 수
					3. 검색의 종류
					4. 검색의 키워드
				 -->
					<select name="searchType" id="searchType">
						<option value="n">-----</option>
						<option value="t">번호</option>
						<option value="c">제목</option>
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
							<th style="width:30px;">번호</th>
							<th>고객명</th>
							<th>상품명</th>
							<th>항공편</th>
							<th>출발날짜</th>
							<th>도착날짜</th>
						</tr>  
						<tr>
								<td>1</td>
								<td><a href="#">테스트 고객</a></td>
								<td>상품1</td>
								<td>AK001</td>  
								<td>2020/04/25</td>
								<td>2020/04/26</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">테스트 고객</a></td>
								<td>상품1</td>
								<td>AK001</td>  
								<td>2020/04/25</td>
								<td>2020/04/26</td>    
							</tr>   
							<tr>
								<td>3</td>
								<td><a href="#">테스트 고객</a></td>
								<td>상품1</td>
								<td>AK001</td>  
								<td>2020/04/25</td>
								<td>2020/04/26</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="#">테스트 고객</a></td>
								<td>상품1</td>
								<td>AK001</td>  
								<td>2020/04/25</td>
								<td>2020/04/26</td>
							</tr>
					</table>      
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