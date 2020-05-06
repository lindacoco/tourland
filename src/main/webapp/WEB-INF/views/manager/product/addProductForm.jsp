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
	background-color: lightgrey;
}
</style>
<script>
	var div;
	var page;
	var searchType;
	var keyword;
	var makeDateStr = function(pdate) {
		var date = new Date(pdate);
		var month = (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1)
				: (date.getMonth() + 1);
		var day = (date.getDate() + 1) < 10 ? "0" + (date.getDate() + 1)
				: (date.getDate() + 1);
		var dateStr = date.getFullYear() + "-" + month + "-" + day;
		return dateStr;
	}
	var getAirData = function(div, res) {
		var no = $("<input type='hidden' name='air"+div+"No'>").val(res.vo.no);
		var ddateStr = makeDateStr(res.vo.ddate);
		var rdateStr = makeDateStr(res.vo.rdate);
		if (div == 'Depature') {
			$(".result").eq(0).append(
					"출발 : " + res.vo.no + " " + res.vo.ano + " "
							+ res.vo.dlocation + " " + res.vo.rlocation + " "
							+ ddateStr + " " + rdateStr + " " + res.vo.ldiv
							+ " " + res.vo.capacity + " " + res.vo.seat + " "
							+ res.vo.price + " ");
			$("form").append(no);
		} else {
			$(".result").eq(0).append(
					"도착 : " + res.vo.no + " " + res.vo.ano + " "
							+ res.vo.dlocation + " " + res.vo.rlocation + " "
							+ ddateStr + " " + rdateStr + " " + res.vo.ldiv
							+ " " + res.vo.capacity + " " + res.vo.seat + " "
							+ res.vo.price);
			$("form").append(no);
		}
	}
	var clickAir = function(no, div) {
		$.ajax({
			url : "flightList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				if (div == 'Depature') {
					$(".result").eq(0).empty();
					getAirData(div, res);
					$("#flightDepature").modal("hide");
					$('#flightDepature .modal-backdrop').remove();
					$("#flightRending").modal("show");
				} else {
					getAirData(div, res);
					$("#flightRending").modal("hide");
					$('#flightRending .modal-backdrop').remove();
				}

			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var airAjax = function(div, page, searchType, keyword) {
		$
				.ajax({
					url : "flightList",
					type : "get",
					data : {
						div : div,
						page : page,
						searchType : searchType,
						keyword : keyword
					},
					dataType : "json",
					success : function(res) { // 결과 성공 콜백함수
						console.log(res);
						if (div == "Depature") {
							$("#flightDepature .flightList").remove();
							$("#flightDepature .pagination").empty();
						} else {
							$("#flightRending .flightList").remove();
							$("#flightRending .pagination").empty();
						}
						$(res.list)
								.each(
										function(i, obj) {
											var td1 = $("<td>").html(obj.no);
											var td2 = $("<td>").html(obj.ano);
											var td3 = $("<td>").html(
													obj.dlocation);
											var td4 = $("<td>").html(
													obj.rlocation);
											var ddate = new Date(obj.ddate);
											var ddateMonth = (ddate.getMonth() + 1) < 10 ? "0"
													+ (ddate.getMonth() + 1)
													: (ddate.getMonth() + 1);
											var ddatedate = ddate.getDate() < 10 ? "0"
													+ ddate.getDate()
													: ddate.getDate();
											var ddateStr = ddate.getFullYear()
													+ "-" + ddateMonth + "-"
													+ ddatedate;
											var td5 = $("<td>").html(ddateStr);
											var rdate = new Date(obj.rdate);
											var rdateMonth = (rdate.getMonth() + 1) < 10 ? "0"
													+ (rdate.getMonth() + 1)
													: (rdate.getMonth() + 1);
											var rdatedate = rdate.getDate() < 10 ? "0"
													+ rdate.getDate()
													: rdate.getDate();
											var rdateStr = rdate.getFullYear()
													+ "-" + rdateMonth + "-"
													+ rdatedate;
											var td6 = $("<td>").html(rdateStr);
											var td7 = $("<td>").html(obj.ldiv);
											var td8 = $("<td>").html(
													obj.capacity);
											var td9 = $("<td>").html(obj.seat);
											var td10 = $("<td>")
													.html(obj.price);
											var tr = $(
													"<tr class='flightList' data-no='"+obj.no+"'>")
													.append(td1).append(td2)
													.append(td3).append(td4)
													.append(td5).append(td6)
													.append(td7).append(td8)
													.append(td9).append(td10);
											div == "Depature" ? $(
													"#flightDepature #table")
													.append(tr) : $(
													"#flightRending #table")
													.append(tr);

										});
						var preva = $("<a id='prev'>").html("&laquo;");
						var prevli = $("<li>").append(preva);
						var nexta = $("<a id='next'>").html("&raquo;");
						var nextli = $("<li>").append(nexta);
						if (res.pageMaker.prev)
							div == "Depature" ? $("#flightDepature .pagination")
									.append(prevli)
									: $("#flightRending .pagination").append(
											prevli);
						for (var i = res.pageMaker.startPage; i <= res.pageMaker.endPage; i++) {
							var a = $("<a class='index' data-index='"+i+"'>")
									.html(i);
							var li = $("<li>").append(a);
							if (res.pageMaker.cri.page == i) {
								li.addClass("active");
							}
							div == "Depature" ? $("#flightDepature .pagination")
									.append(li)
									: $("#flightRending .pagination")
											.append(li);
						}
						if (res.pageMaker.next)
							div == "Depature" ? $("#flightDepature .pagination")
									.append(nextli)
									: $("#flightRending .pagination").append(
											nextli);
					},
					error : function(request, status, error) { // 결과 에러 콜백함수
						console.log(error)
					}
				});
	}
	$(function() {
		//항공편 출발 다이얼로그
		$(document).on(
				"click",
				"#flightDepature .index",
				function() {
					div = "Depature";
					page = $(this).attr("data-index");
					searchType = $(
							"#flightDepature #searchType option:selected")
							.val();
					keyword = $("#flightDepature #keywordInput").val();
					airAjax(div, page, searchType, keyword);
				})
		$(document).on(
				"click",
				"#flightDepature #prev",
				function() {
					div = "Depature";
					page = Number($("#flightDepature .index").eq(0).attr(
							"data-index")) - 1;
					searchType = $(
							"#flightDepature #searchType option:selected")
							.val();
					keyword = $("#flightDepature #keywordInput").val();
					airAjax(div, page, searchType, keyword);
				})
		$(document).on(
				"click",
				"#flightDepature #next",
				function() {
					div = "Depature";
					page = Number($("#flightDepature .index").eq(9).attr(
							"data-index")) + 1;
					searchType = $(
							"#flightDepature #searchType option:selected")
							.val();
					keyword = $("#flightDepature #keywordInput").val();
					airAjax(div, page, searchType, keyword);
				})
		$(document).on("click", "#flightDepature .flightList", function() {
			var no = $(this).attr("data-no");
			var div = "Depature";
			clickAir(no, div);
		})
		$("#flightDepature #btnSearch").click(
				function() {
					div = "Depature";
					page = $("#flightDepature .pagination").find(".active a")
							.attr("data-index");
					searchType = $(
							"#flightDepature #searchType option:selected")
							.val();
					keyword = $("#flightDepature #keywordInput").val();
					airAjax(div, page, searchType, keyword);
				})
		//항공편 도착 다이얼로그
		$(document).on("click", "#flightRending .index", function() {
			div = "Rending";
			page = $(this).attr("data-index");
			searchType = $("#flightRending #searchType option:selected").val();
			keyword = $("#flightRending #keywordInput").val();
			airAjax(div, page, searchType, keyword);
		})
		$(document)
				.on(
						"click",
						"#flightRending #prev",
						function() {
							div = "Rending";
							page = Number($("#flightRending .index").eq(0)
									.attr("data-index")) - 1;
							searchType = $(
									"#flightRending #searchType option:selected")
									.val();
							keyword = $("#flightRending #keywordInput").val();
							airAjax(div, page, searchType, keyword);
						})
		$(document)
				.on(
						"click",
						"#flightRending #next",
						function() {
							div = "Rending";
							page = Number($("#flightRending .index").eq(9)
									.attr("data-index")) + 1;
							searchType = $(
									"#flightRending #searchType option:selected")
									.val();
							keyword = $("#flightRending #keywordInput").val();
							airAjax(div, page, searchType, keyword);
						})
		$(document).on("click", "#flightRending .flightList", function() {
			var no = $(this).attr("data-no");
			var div = "Rending";
			clickAir(no, div);
		})
		$("#flightRending #btnSearch")
				.click(
						function() {
							div = "Depature";
							page = $("#flightRending .pagination").find(
									".active a").attr("data-index");
							searchType = $(
									"#flightRending #searchType option:selected")
									.val();
							keyword = $("#flightRending #keywordInput").val();
							airAjax(div, page, searchType, keyword);
						})
		$("#showFlight").click(function() {
			$("#flightDepature").modal("show");
		})
		$("#showHotel").click(function() {
			$("#hotel").modal("show");
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
					<form class="form-inline" action="addProductForm" method="post"
						enctype="multipart/form-data">
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>항공</label>
								<div class="container">
									<button type="button" class="btn btn-primary"
										data-toggle="modal" id="showFlight">항공편 추가</button>
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
										<button type="button" class="btn btn-primary" id="showHotel">호텔
											추가</button>
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
	<div id="flightDepature" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">항공편 출발</h4>
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
							</select> <input type="text" name="keyword" id="keywordInput">
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
								<c:forEach items="${flightListDepature}" var="f">
									<tr class="flightList" data-no="${f.no}">
										<td>${f.no }</td>
										<td>${f.ano }</td>
										<td>${f.dlocation }</td>
										<td>${f.rlocation }</td>
										<td><fmt:formatDate value="${f.ddate }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${f.rdate }"
												pattern="yyyy-MM-dd" /></td>
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
									<c:if test="${pageMakerByFlightDepature.prev == true }">
										<li><a id="prev">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMakerByFlightDepature.startPage }"
										end="${pageMakerByFlightDepature.endPage }" var="idx">
										<li
											class="${pageMakerByFlightDepature.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByFlightDepature.next == true }">
										<li><a id="next">&raquo;</a></li>
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
	<div id="flightRending" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">항공편 도착</h4>
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
							</select> <input type="text" name="keyword" id="keywordInput">
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
								<c:forEach items="${flightListRending}" var="f">
									<tr class="flightList" data-no="${f.no}">
										<td>${f.no }</td>
										<td>${f.ano }</td>
										<td>${f.dlocation }</td>
										<td>${f.rlocation }</td>
										<td><fmt:formatDate value="${f.ddate }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${f.rdate }"
												pattern="yyyy-MM-dd" /></td>
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
									<c:if test="${pageMakerByFlightRending.prev == true }">
										<li><a id="prev">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMakerByFlightRending.startPage }"
										end="${pageMakerByFlightRending.endPage }" var="idx">
										<li
											class="${pageMakerByFlightRending.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByFlightRending.next == true }">
										<li><a id="next">&raquo;</a></li>
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
	<div id="hotel" class="modal fade" role="dialog" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">호텔</h4>
				</div>
				<div class="modal-body">
					<div class="box box-primary">
						<div class="box-body">
							<select name="searchType" id="searchType">
								<option>전체</option>
								<option>호텔이름</option>
								<option>호텔주소</option>
								<option>체크인날짜</option>
								<option>장소구분</option>
								<option>객실체크여부</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${cri.keyword}">
							<button id="btnSearch">검색</button>
							<button id="btnRegister">호텔상품 추가</button>
						</div>
						<div class="box-body">

							<table class="table table-bordered">
								<tr>
									<th>번호</th>
									<th>호텔이름</th>
									<th>호텔주소</th>
									<th>체크인날짜</th>
									<th>체크아웃날짜</th>
									<th>허용인원수</th>
									<th>가격(1박)</th>
									<th>객실 수</th>
									<th>객실타입</th>
									<th>장소구분</th>
									<th>예약 가능 여부</th>
								</tr>
								<c:forEach var="hotel" items="${hotelList}">
									<tr>
										<td>${hotel.no }</td>
										<td>${hotel.hname }</td>
										<td>${hotel.haddr }</td>
										<td><fmt:formatDate value="${hotel.checkin}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${hotel.checkout}"
												pattern="yyyy-MM-dd" /></td>
										<td>${hotel.capacity }<span>인</span></td>
										<td>${hotel.price }</td>
										<td>${hotel.roomcapacity }<span>실</span></td>

										<c:choose>
											<c:when test="${hotel.roomtype == 'N'}">
												<td style="color: #5D5D5D;" id="n">노말</td>
											</c:when>
											<c:when test="${hotel.roomtype == 'D'}">
												<td style="color: #F29661;" id="d">디럭스</td>
											</c:when>
											<c:otherwise>
												<td style="color: #D941C5;" id="s">스위트</td>
											</c:otherwise>
										</c:choose>

										<c:if test="${hotel.ldiv==1}">
											<td>해외</td>
										</c:if>
										<c:if test="${hotel.ldiv == 0}">
											<td>국내</td>
										</c:if>
										<c:if test="${hotel.bookedup == 0}">
											<td><span class="badge bg-red">예약가능</span>
											<td>
										</c:if>
										<c:if test="${hotel.bookedup == 1}">
											<td><span class="badge bg-blue">예약불가능</span>
											<td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMakerByHotel.prev == true }">
										<li><a id="prev">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMakerByHotel.startPage }"
										end="${pageMakerByHotel.endPage }" var="idx">
										<li
											class="${pageMakerByHotel.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByHotel.next == true }">
										<li><a id="next">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../../include/footer.jsp"%>