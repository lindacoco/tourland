<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	.table th,td {
		text-align: center;
	}
	.pagination {
		margin-left : 650px;
	}
	.pagination li:hover {
		cursor: pointer;
	}
	.active {
		background-color : lightblue;
		color : white;  
	}
	.planBoardList:hover {
		cursor : pointer;
		background-color : lightgrey;
	}
	#btnSearch{
		width: 72px;
    	margin-left: 30px;
	}
	#searchType{
		padding:3px;
	}   
	#searchType2{
		padding: 2px;
    	margin: 0px 8px;
	}
	#keywordInput{
		padding:2px;
	}
	
</style>
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">상품 문의사항</h2>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option value="">전체</option>
						<option value="D">국내패키지상품</option>
						<option value="I">해외패키지상품</option>
						<option value="R">상품 예약 및 결제</option>
						<option value="U">회원혜택안내</option>
					</select>
					<select name="searchType2" id="searchType2">
						<option value="N">-----------</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">검색</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>답변상태</th>
						</tr>
						<c:forEach var="planBoard" items="${list}">
						<tr class="planBoardList" data-no="${planBoard.no}" data-respond="${planBoard.respond}">
							<td>${planBoard.no}</td>
							<td>${planBoard.title}</td>
							<td>${faq.lcate eq 'D'?'국내패키지상품':faq.lcate eq 'I'?'해외패키지상품':faq.lcate eq 'R'?'상품 예약 및 결제':'회원혜택안내'}</td>
							<td>${faq.mcate eq 'P'?'여행상품':faq.mcate eq 'V'?'여권 및 비자':faq.mcate eq 'T'?'환율':faq.mcate eq 'J'?'제주여행':faq.mcate eq 'B'?'예약 및 취소':faq.mcate eq 'R'?'결제 및 환불':faq.mcate eq 'C'?'쿠폰 및 이벤트':'기타'}</td>
							<td>${planBoard.writer}</td>
							<td><fmt:formatDate value="${planBoard.regdate}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${planBoard.answer==0}">
								<td><span class="badge bg-orange">답변미완료</span></td>
							</c:if>
							<c:if test="${planBoard.answer==1 }">
								<td><span class="badge bg-blue">답변완료</span></td>
							</c:if>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<ul class="pagination">
					<c:if test="${pageMaker.prev == true}">
						<li><a href="${pageContext.request.contextPath}/planBoardList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="${cri.page==idx?'active':''}"><a href="${pageContext.request.contextPath}/planBoardList?page=${idx}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next == true}">
						<li><a href="${pageContext.request.contextPath}/planBoardList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&searchType2=${cri.searchType2}&keyword=${cri.keyword}">&raquo;</a></li>
					</c:if>
					</ul>
				</div>
			</div>         
		</div>
	</div>
</div>
<script>
var makeDetailOption = function(searchType) {
	switch(searchType) {
	case "D":
		var option = $("<option value='J'>").html("제주여행");
		$("#searchType2").append(option);
		break;
	case "I":
		var option = $("<option value=''>").html("전체");
		var option1 = $("<option value='P'>").html("여행상품");
		var option2 = $("<option value='V'>").html("여권 및 비자");
		var option3 = $("<option value='T'>").html("환율");
		var option4 = $("<option value='E'>").html("기타");
		$("#searchType2").append(option).append(option1).append(option2).append(option3).append(option4);
		break;
	case "R":
		var option = $("<option value=''>").html("전체");
		var option1 = $("<option value='B'>").html("예약 및 취소");
		var option2 = $("<option value='R'>").html("결제 및 환불");
		$("#searchType2").append(option).append(option1).append(option2);
		break;
	case "U":
		var option = $("<option value='C'>").html("쿠폰,이벤트");
		$("#searchType2").append(option);
		break;
	default :
		var option = $("<option value=''>").html("-----------");
		$("#searchType2").append(option);
	}
}
var fixSearchTypeAndKeyword = function() {
	var searchType = "${cri.searchType}";
	var searchType2 = "${cri.searchType2}";
	var keyword = "${cri.keyword}";
	$("#searchType2").empty();
	makeOption(searchType);
	$("#searchType option").each(function(i, obj) {
		var value = $(this).val();
		if(value==searchType) {
			$(this).prop("selected",true);
			return;
		}
	})
	$("#searchType2 option").each(function(i, obj) {
		var value = $(this).val();
		if(value==searchType2) {
			$(this).prop("selected",true);
			return;
		}
	})
	$("#keywordInput").val(keyword);
};
	
	$("#searchType").change(function() {
		$("#searchType2").empty();
		makeDetailOption($("#searchType option:selected").val());
		$("#keywordInput").val("");
	})
	
		$(".planBoardList").click(function() {
		var no = $(this).attr("data-no");
		var respond=$(this).attr("data-respond");
		var page =	"${cri.page}"; 
		var searchType = "${cri.searchType}";
		var searchType2 = "${cri.searchType2}";
		var keyword = "${cri.keyword}";
		if(respond==null || respond==""){
			location.href = "planBoardDetail?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;
		}else{
			location.href = "planBoardModify?no="+no+"&page="+page+"&searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword+"&respond="+respond;
		}
	})
	$("#btnSearch").click(function(){
		var searchType = $("#searchType option:selected").val();
		var searchType2 = $("#searchType2 option:selected").val();
		var keyword = $("#keywordInput").val();
		location.href = "planBoardList?searchType="+searchType+"&searchType2="+searchType2+"&keyword="+keyword;	
	})
</script>
<%@ include file="../../include/footer.jsp"%>