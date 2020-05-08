<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	table th, td { text-align: center;}
	.first { color: maroon; font-weight: bold;}
	.bus { color: steelblue; font-weight: bold;}
	.eco { color: goldenrod; font-weight: bold;}
</style>

<script>

function getFormatDate(date){
    var year = date.getFullYear()+"-";              //yyyy
    var month = (date.getMonth()+1)+"-";          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '' + month + '' + day;
}


function getDomList(page){
	$.ajax({   
		url : "flightDomList/"+page,
		type : "get", 
		dataType : "json",                            
		success: function(rs){                  
			console.log(rs);
			$(rs.list).each(function(i, obj){
				console.log(obj);
			})
			 $(".forEachTr").remove();
			 $(rs.list).each(function(i, obj) {
				 var date1 = new Date(obj.ddate);
				 var date2 = new Date(obj.rdate);
				 
				 var ddate = getFormatDate(date1);
				 var rdate = getFormatDate(date2);
				 
				 $tr = $("<tr>").addClass("forEachTr");
				 
				 $td1 = $("<td>").html(obj.no);
				 $td2 = $("<td>");
				 $td3 = $("<td>").html(obj.dlocation);
				 $td4 = $("<td>").html(obj.rlocation);
				 $td5 = $("<td>").html(ddate);
				 $td6 = $("<td>").html(rdate);
				 if(obj.ldiv==0){
					 $td7 = $("<td>해외</td>");
				 }else {
					 $td7 = $("<td>국내</td>");
				 }
				 $td8 = $("<td>").html(obj.capacity);
				 if(obj.seat=='F'){
					 $td9 = $("<td>").html("First-Class").addClass("first");
				 }else if(obj.seat=='B'){
					 $td9 = $("<td>").html("Business-Class").addClass("bus");
				 }else {
					 $td9 = $("<td>").html("Economy-Class").addClass("eco");
				 }
				 $td10 = $("<td>").html(obj.price);
				 
				 $a = $("<a>").attr("href", "${pageContext.request.contextPath }/flightDetail?no=${obj.no}").html(obj.ano);
				 
				 $td2.append($a);
				 $tr.append($td1);
				 $tr.append($td2);
				 $tr.append($td3);
				 $tr.append($td4);
				 $tr.append($td5);
				 $tr.append($td6);
				 $tr.append($td7);
				 $tr.append($td8);
				 $tr.append($td9);
				 $tr.append($td10);
				 
				 $("table").append($tr);
				 
			}) 
		 	$(".pagination").empty();
			for(var i = rs.pageMaker.startPage; i<= rs.pageMaker.endPage; i++){
				
				var $li = $("<li>").html(i);
				if(rs.pageMaker.prev==true){
					var $a = $("<a>").attr("href", "flightMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}").html("&laquo");
				}
				for()
				
				
				$(".pagination").append($li);
			}   
		}   
	})   
}


	$(function(){
		$("#dom").click(function(){
			 getDomList(1); 
		})
	})
</script>

<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">항공 관리</h2>
				</div>
				<div class="box-body">
				<!-- 검색 작업에서 유지될 데이터 
					1. 현재 페이지의 번호     
					2. 페이지당 보여지는 데이터의 수
					3. 검색의 종류
					4. 검색의 키워드
				 -->
					<select name="searchType" id="searchType">
						<option value="n" ${cri.searchType ==null?'selected':''}>-----</option>
						<option value="no" ${cri.searchType =='no'?'selected':''}>번호</option>
						<option value="ano" ${cri.searchType =='ano'?'selected':''}>항공기 번호</option>
						<option value="dloca" ${cri.searchType =='dloca'?'selected':''}>출발 지역</option>
						<option value="rloca" ${cri.searchType =='rloca'?'selected':''}>도착 지역</option>
						<option value="ddate" ${cri.searchType =='ddate'?'selected':''}>출발 일시</option>
						<option value="rdate" ${cri.searchType =='rdate'?'selected':''}>도착 일시</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button type="button" class="btn btn-info">항공편 추가</button>
					<button type="button" class="btn" id="dom">국내</button>
					<button type="button" class="btn" id="ab">해외</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>항공기 번호</th>
							<th>출발 지역</th>
							<th>도착 지역</th>
							<th>출발 일시</th>
							<th>도착 일시</th>
							<th>장소 구분</th>
							<th>허용 인원</th>
							<th>좌석</th>
							<th>가격</th>
						</tr> 
						<c:forEach items="${flightList }" var="f">   
							<tr class="forEachTr">
								<td>${f.no }</td>
								<td><a href="${pageContext.request.contextPath }/flightDetail?no=${f.no}">${f.ano }</a></td>
								<td>${f.dlocation }</td>
								<td>${f.rlocation }</td>
								<td><fmt:formatDate value="${f.ddate }" pattern ="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${f.rdate }" pattern ="yyyy-MM-dd"/></td>
								<c:if test="${f.ldiv==0 }">
									<td>해외</td>
								</c:if>
								<c:if test="${f.ldiv==1 }">
									<td>국내</td>
								</c:if>
								<td>${f.capacity }</td>
								<c:if test="${f.seat =='F'}">
									<td class="first">First-Class</td>
								</c:if>
								<c:if test="${f.seat =='B'}">
									<td class="bus">Business-Class</td>
								</c:if>
								<c:if test="${f.seat =='E'}">
									<td class="eco">Economy-Class</td>
								</c:if>
								<td>${f.price }</td>
							</tr>
						</c:forEach>   
					</table>      
				</div>  
			<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev == true }">
								<li><a href="flightMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li class="${pageMaker.cri.page == idx ?'active':''}"><a href="flightMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a></li>
								<!-- 주소의 시작이 /로 시작하지 않고 localhost:8080..으로 시작하면 맨 마지막 것만 바꿔주면됨 -->
							</c:forEach>
							<c:if test="${pageMaker.next == true }">
								<li><a href="flightMngList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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
	
	$(".btn-info").click(function(){
		location.href = "addFlightForm";
	})
</script>

<%@ include file="../../include/footer.jsp"%>