<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2 {
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 1px solid gray;
}
.form-group {
	width: 200px;
	margin: 20px;
	float: left;
}

.group {
	width: 100%;
	height: 100px;
}

#guide {
	text-indent: 10px;
}

.red {
	color: red;
}
.flightList:hover {
	background-color : lightgrey;
}
</style>
<script>
	var page;
	var searchType;
	var keyword;
	var clickAir = function(no) {
		$.ajax({
			url : "flightList/"+no,
			type : "get",
			dataType : "json",
			success : function(res) {
				var no = $("<input type='hidden' name='airNo'>").val(res.vo.no);
				var ano = $("<input type='hidden' name='airAno'>").val(res.vo.ano);
				var dlocation = $("<input type='hidden' name='airdLocation'>").val(res.vo.dlocation);
				var rlocation = $("<input type='hidden' name='airrLocation'>").val(res.vo.rlocation);
				var $ddate = new Date(res.vo.ddate);
				var ddateMonth = ($ddate.getMonth()+1)<10?"0"+($ddate.getMonth()+1):($ddate.getMonth()+1);
				var ddatedate = $ddate.getDate()<10?"0"+$ddate.getDate():$ddate.getDate();
				var ddateStr = $ddate.getFullYear() + "-" + ddateMonth + "-" + ddatedate;
				var ddate = $("<input type='hidden' name='ddate'>").val(ddateStr);
				var $rdate = new Date(res.vo.rdate);
				var rdateMonth = ($rdate.getMonth()+1)<10?"0"+($rdate.getMonth()+1):($rdate.getMonth()+1);
				var rdatedate = $rdate.getDate()<10?"0"+$rdate.getDate():$rdate.getDate();
				var rdateStr = $rdate.getFullYear() + "-" + rdateMonth + "-" + rdatedate;
				var rdate = $("<input type='hidden' name='rdate'>").val(rdateStr);
				var ldiv = $("<input type='hidden' name='ldiv'>").val(res.vo.ldiv);
				var capacity = $("<input type='hidden' name='capacity'>").val(res.vo.capacity);
				var seat = $("<input type='hidden' name='seat'>").val(res.vo.seat);
				var price = $("<input type='hidden' name='price'>").val(res.vo.price);
				$(".result").eq(0).empty();
				$(".result").eq(0).append(res.vo.no+" "+res.vo.ano+" "+res.vo.dlocation+" "+res.vo.rlocation+" "+ddateStr+" "+rdateStr+" "+res.vo.ldiv+" "+res.vo.capacity+" "+res.vo.seat+" "+res.vo.price);
				$("form").append(no).append(ano).append(dlocation).append(rlocation).append(ddate).append(rdate).append(ldiv).append(capacity).append(seat).append(price);
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		    }
		})
	}
	var ajax = function(page,searchType,keyword) {
		$.ajax({
			url : "flightList",
			type : "get",
			data : {
				page : page,
				searchType : searchType,
				keyword : keyword
			},
			dataType : "json",
			success : function(res) { // 결과 성공 콜백함수
		        console.log(res);
				$(".flightList").remove();
				$(".pagination").empty();
				$(res.list).each(function(i,obj){
					var td1 = $("<td>").html(obj.no);
					var td2 = $("<td>").html(obj.ano);
					var td3 = $("<td>").html(obj.dlocation);
					var td4 = $("<td>").html(obj.rlocation);
					var ddate = new Date(obj.ddate);
					var ddateMonth = (ddate.getMonth()+1)<10?"0"+(ddate.getMonth()+1):(ddate.getMonth()+1);
					var ddatedate = ddate.getDate()<10?"0"+ddate.getDate():ddate.getDate();
					var ddateStr = ddate.getFullYear() + "-" + ddateMonth + "-" + ddatedate;
					var td5 = $("<td>").html(ddateStr);
					var rdate = new Date(obj.rdate);
					var rdateMonth = (rdate.getMonth()+1)<10?"0"+(rdate.getMonth()+1):(rdate.getMonth()+1);
					var rdatedate = rdate.getDate()<10?"0"+rdate.getDate():rdate.getDate();
					var rdateStr = rdate.getFullYear() + "-" + rdateMonth + "-" + rdatedate;
					var td6 = $("<td>").html(rdateStr);
					var td7 = $("<td>").html(obj.ldiv);
					var td8 = $("<td>").html(obj.capacity);
					var td9 = $("<td>").html(obj.seat);
					var td10 = $("<td>").html(obj.price);
					var tr = $("<tr class='flightList' data-no='"+obj.no+"'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10);
					$("#table").append(tr);
				});
				var preva =  $("<a href='#' id='prev'>").html("&laquo;");
				var prevli = $("<li>").append(preva);
				var nexta = $("<a href='#' id='next'>").html("&raquo;");
				var nextli = $("<li>").append(nexta);
				if(res.pageMaker.prev) $(".pagination").append(prevli);
				for(var i=res.pageMaker.startPage;i<=res.pageMaker.endPage;i++) {
					var a = $("<a class='index' data-index='"+i+"'>").html(i);
					var li = $("<li>").append(a);
					if(res.pageMaker.cri.page==i) {
						li.addClass("active");
					}
					$(".pagination").append(li);
				}
				if(res.pageMaker.next) $(".pagination").append(nextli);
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		    }
		});
	}
	$(function(){
		$(".index").click(function(){
			page = $(this).attr("data-index");
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$("#prev").click(function(){
			page = Number($(".index").eq(0).attr("data-index"))-1;
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$("#next").click(function(){
			page = Number($(".index").eq(9).attr("data-index"))+1;
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$(document).on("click",".index",function(){
			page = $(this).attr("data-index");
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$(document).on("click","#prev",function(){
			page = Number($(".index").eq(0).attr("data-index"))-1;
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$(document).on("click","#next",function(){
			page = Number($(".index").eq(9).attr("data-index"))+1;
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$("#btnSearch").click(function(){
			page = $(".pagination").find(".active a").attr("data-index");
			searchType = $("#searchType option:selected").val();
			keyword = $("#keywordInput").val();
			ajax(page,searchType,keyword);
		})
		$(".flightList").click(function(){
			var no = $(this).attr("data-no");
			clickAir(no);
			$("#flight")
			$(".close").click();
			$('.modal-backdrop').remove();
		})
		$(document).on("click",".flightList",function(){
			var no = $(this).attr("data-no");
			clickAir(no);
			$(".close").click();
			$('.modal-backdrop').remove();
		})
	})
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-primary">
					<div class="box-header">
						<h2>상품 추가</h2>
					</div>
					<p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
					<form class="form-inline" action="addProductForm" method="post" enctype="multipart/form-data">
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>항공</label>
								<div class="container">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#flight">항공편 추가</button>
									<span class="result"></span>
									<!-- <select class="form-control" id="sel1">
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
  					</select> -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>호텔</label>
								<div class="container">
									<div class="dropdown">
										<button type="button" class="btn btn-primary">호텔 추가</button>
										<span class="result"></span>
										<!-- <select class="form-control" id="sel1">
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
  							</select> -->
									</div>
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>현지 투어</label>
								<div class="container">
									<button type="button" class="btn btn-primary">현지투어 추가</button>
									<span class="result"></span>
									<!-- <select class="form-control" id="sel1">
							    <option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							    <option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							  	<option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							   	<option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
  							</select> -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>렌트카</label>
								<div class="container">
									<button type="button" class="btn btn-primary">렌트카 추가</button>
									<span class="result"></span>
									<!-- <select class="form-control" id="sel1">
								    <option>경차 4/1-4/3</option>
								     <option>경차 4/1-4/3</option>
								  	 <option>경차 4/1-4/3</option>
								   <option>경차 4/1-4/3</option>
	  							</select>  -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label>상품 번호</label> <input type="text" class="form-control">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 이름</label> <input
									type="text" class="form-control">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 설명</label>
								<div class="container">
									<button type="button" class="btn btn-primary">상품설명 추가</button>
									<span class="result"></span>
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 가격</label> <input
									type="text" class="form-control">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 유효기간</label> <input
									type="text" class="form-control" id="datepicker">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 사진</label> <input
									type="file" class="form-control">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<button type="submit" class="btn btn-default">추가</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="flight" class="modal fade" role="dialog">
	  	<div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">항공편 추가</h4>
		      </div>
		      <div class="modal-body">
		        <div class="box box-primary">      
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option value="n">-----</option>
						<option value="no">번호</option>
						<option value="ano">항공기 번호</option>
						<option value="dloca">출발 지역</option>
						<option value="rloca">도착 지역</option>
						<option value="ddate">출발 일시</option>
						<option value="rdate">도착 일시</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered" id="table">
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
						<c:forEach items="${flightList}" var="f">   
							<tr class="flightList" data-no="${f.no}">
								<td>${f.no }</td>
								<td>${f.ano }</td>
								<td>${f.dlocation }</td>
								<td>${f.rlocation }</td>
								<td><fmt:formatDate value="${f.ddate }" pattern ="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${f.rdate }" pattern ="yyyy-MM-dd"/></td>
								<td>${f.ldiv }</td>
								<td>${f.capacity }</td>
								<td>${f.seat }</td>
								<td>${f.price }</td>
							</tr>
						</c:forEach>   
					</table>      
					</div>  
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev == true }">
									<li><a href="#" id="prev">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li class="${pageMaker.cri.page == idx ?'active':''}"><a href="#" class="index" data-index="${idx }">${idx }</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next == true }">
									<li><a href="#" id="next">&raquo;</a></li>
								</c:if>
							</ul>
						</div>  
					</div>
				</div> 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
  		</div>
	</div>
</body>
</html>
<%@ include file="../../include/footer.jsp"%>