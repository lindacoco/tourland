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
.hotelList:hover {
	background-color: lightgrey;
}
.tourList:hover {
	background-color: lightgrey;
}
.rentcarList:hover {
	background-color: lightgrey;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/plugins/ckeditor/contents.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/ckeditor/ckeditor.js"></script>
<script>
	var div;
	var page;
	var searchType;
	var keyword;
	var airAdd = [false,false];
	var makeDateStr = function(pdate) {
		var date = new Date(pdate);
		var month = (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1);
		var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		var dateStr = date.getFullYear() + "-" + month + "-" + day;
		return dateStr;
	}
	var makeTimeStr = function(pdate) {
		var date = new Date(pdate);
		var hour = date.getHours() < 10?"0"+date.getHours():date.getHours();
		var minute = date.getMinutes() < 10?"0"+date.getMinutes():date.getMinutes();
		var second = date.getSeconds() < 10?"0"+date.getSeconds():date.getSeconds();
		var dateStr = hour + ":" + minute + ":" + second;
		return dateStr;
	}
	var getAirData = function(div, res) {
		var no = $("<input type='hidden' name='air"+div+"No'>").val(res.vo.no);
		var td1 = $("<td>").html(res.vo.no).append(no);
		var td2 = $("<td>").html(res.vo.ano);
		var td3 = $("<td>").html(res.vo.dlocation);
		var td4 = $("<td>").html(res.vo.rlocation);
		var ddateStr = makeDateStr(res.vo.ddate);
		var rdateStr = makeDateStr(res.vo.rdate);
		var td5 = $("<td>").html(ddateStr);
		var td6 = $("<td>").html(rdateStr);
		var ldiv = 	ldiv==0?"해외":"국내";
		var td7 = $("<td>").html(ldiv);
		var td8 = $("<td>").html(res.vo.capacity);
		var td9 = $("<td>").html(res.vo.seat);
		var td10 = $("<td>").html(res.vo.price);
		var tr = $("<tr class='flightList'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10);
		$("#totalFlight table").append(tr);
	}
	var getHotelData = function(res) {
		var no = $("<input type='hidden' name='hotelNo'>").val(res.vo.no);
		var td1 = $("<td>").html(res.vo.no).append(no);
		var td2 = $("<td>").html(res.vo.hname);
		var td3 = $("<td>").html(res.vo.haddr);
		var checkinStr = makeDateStr(res.vo.checkin);
		var checkoutStr = makeDateStr(res.vo.checkout);
		var td4 = $("<td>").html(checkinStr);
		var td5 = $("<td>").html(checkoutStr);
		var td6 = $("<td>").html(res.vo.capacity + "인");
		var td7 = $("<td>").html(res.vo.price);
		var td8 = $("<td>").html(res.vo.roomcapacity + "실");
		var td9;
		switch(res.vo.roomtype) {
		case "N":
			td9 = $("<td style='color : #5D5D5D;' id='n'>").html("노말");
			break;
		case "D":
			td9 = $("<td style='color : #F29661;' id='d'>").html("디럭스");
			break;
		case "S":
			td9 = $("<td style='color : #D941C5;' id='s'>").html("스위트");
			break;
		}
		var td10 = res.vo.ldiv==1?$("<td>").html("해외"):$("<td>").html("국내");
		var span = res.vo.bookedup==0?$("<span class='badge bg-red'>").html("예약가능"):$("<span class='badge bg-red'>").html("예약불가");
		var td11 = $("<td>").append(span);
		var tr = $("<tr class='hotelList'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11);
		$("#totalHotel #table").append(tr);
	}
	var getTourData = function(res) {
		var no = $("<input type='hidden' name='tourNo'>").val(res.vo.no);
		var td1 = $("<td>").html(res.vo.no).append(no);
		var td2 = $("<td>").html(res.vo.tname);
		var td3 = $("<td>").html(res.vo.tlocation);
		var startDateStr = makeDateStr(res.vo.startDate);
		var endDateStr = makeDateStr(res.vo.endDate);
		var etimeStr = makeTimeStr(res.vo.etime);
		var td4 = $("<td>").html(startDateStr);
		var td5 = $("<td>").html(endDateStr);
		var td6 = $("<td>").html(res.vo.taddr);
		var td7 = $("<td>").html(etimeStr);
		var td8 = $("<td>").html(res.vo.capacity);
		var td9 = $("<td>").html(res.vo.tprice);
		var td10 = res.vo.ldiv==0?$("<td>").html("국내"):$("<td>").html("해외");
		var tr = $("<tr class='tourList'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10);
		$("#totalTour #table").append(tr);
	}
	var getRentData = function(res) {
		var no = $("<input type='hidden' name='rentcarNo'>").val(res.vo.no);
		var td1 = $("<td>").html(res.vo.no).append(no);
		var td2 = $("<td>").html(res.vo.cdiv);
		var td3 = $("<td>").html(res.vo.cno);
		var rentdDate = makeDateStr(res.vo.rentddate);
		var returnDate = makeDateStr(res.vo.returndate);
		var td4 = $("<td>").html(rentdDate);
		var td5 = $("<td>").html(returnDate);
		var td6 = $("<td>").html(res.vo.rentaddr);
		var td7 = $("<td>").html(res.vo.returnaddr);
		var td8 = $("<td>").html(res.vo.price);
		var td9 = $("<td>").html(res.vo.capacity);
		var td10 = $("<td>").html(res.vo.insurance);
		var ldiv = res.vo.ldiv==0?'해외':'국내';
		var td11 = $("<td>").html(ldiv);
		var tr = $("<tr class='rentcarList'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11);
		$("#totalRent #table").append(tr);
	}
	var clickAir = function(no, div) {
		$.ajax({
			url : "flightList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				if (div == 'Depature') {
					getAirData(div, res);
					airAdd[0] = true;
					$("#flightDepature").modal("hide");
					$('#flightDepature .modal-backdrop').remove();
					$("#flightRending").modal("show");
				} else {
					getAirData(div, res);
					airAdd[1] = true;
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
	var hotelAjax = function(page,searchType,keyword) {
		$.ajax({
			url : "hotelList",
			type : "get",
			data : {
				page : page,
				searchType : searchType,
				keyword : keyword
			},
			dataType : "json",
			success : function(res) { // 결과 성공 콜백함수
				console.log(res)
				$("#hotel .hotelList").remove();
				$("#hotel .pagination").empty();
				$(res.list).each(function(i,obj){
					var td1 = $("<td>").html(obj.no);
					var td2 = $("<td>").html(obj.hname);
					var td3 = $("<td>").html(obj.haddr);
					var checkinStr = makeDateStr(obj.checkin);
					var checkoutStr = makeDateStr(obj.checkout);
					var td4 = $("<td>").html(checkinStr);
					var td5 = $("<td>").html(checkoutStr);
					var td6 = $("<td>").html(obj.capacity + "인");
					var td7 = $("<td>").html(obj.price);
					var td8 = $("<td>").html(obj.roomcapacity + "실");
					var td9;
					switch(obj.roomtype) {
					case "N":
						td9 = $("<td style='color : #5D5D5D;' id='n'>").html("노말");
						break;
					case "D":
						td9 = $("<td style='color : #F29661;' id='d'>").html("디럭스");
						break;
					case "S":
						td9 = $("<td style='color : #D941C5;' id='s'>").html("스위트");
						break;
					}
					var td10 = obj.ldiv==1?$("<td>").html("해외"):$("<td>").html("국내");
					var span = obj.bookedup==0?$("<span class='badge bg-red'>").html("예약가능"):$("<span class='badge bg-red'>").html("예약불가");
					var td11 = $("<td>").append(span);
					var tr = $("<tr class='hotelList' data-no='"+obj.no+"'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11);
					$("#hotel #table").append(tr);
				})
				var prev = res.pageMaker.prev;
				var next = res.pageMaker.next;
				var prevA = $("<a id='prev'>").html("&laquo;");
				var nextA = $("<a id='next'>").html("&raquo;");
				var liPrev = $("<li>").append(prevA);
				var liNext = $("<li>").append(nextA);
				if(prev) $("#hotel .pagination").append(liPrev);
				for(var i = res.pageMaker.startPage; i <= res.pageMaker.endPage; i++) {
					var a = $("<a class='index' data-index='"+i+"'>").html(i);
					var li = $("<li>").append(a);
					if (res.pageMaker.cri.page == i) {
						li.addClass("active");
					}
					$("#hotel .pagination").append(li);
				}
				if(next) $("#hotel .pagination").append(liNext);
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var clickHotel = function(no) {
		$.ajax({
			url : "hotelList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				console.log(res);
				getHotelData(res);
				$("#hotel").modal("hide");
				$('#hotel .modal-backdrop').remove();
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var tourAjax = function(page,searchType,keyword) {
		$.ajax({
			url : "tourList",
			type : "get",
			data : {
				page : page,
				searchType : searchType,
				keyword : keyword
			},
			dataType : "json",
			success : function(res) { // 결과 성공 콜백함수
				console.log(res)
				$("#tour .tourList").remove();
				$("#tour .pagination").empty();
				$(res.list).each(function(i,obj){
					var td1 = $("<td>").html(obj.no);
					var td2 = $("<td>").html(obj.tname);
					var td3 = $("<td>").html(obj.tlocation);
					var startDateStr = makeDateStr(obj.startDate);
					var endDateStr = makeDateStr(obj.endDate);
					var etimeStr = makeTimeStr(obj.etime);
					var td4 = $("<td>").html(startDateStr);
					var td5 = $("<td>").html(endDateStr);
					var td6 = $("<td>").html(obj.taddr);
					var td7 = $("<td>").html(etimeStr);
					var td8 = $("<td>").html(obj.capacity);
					var td9 = $("<td>").html(obj.tprice);
					var td10 = obj.ldiv==0?$("<td>").html("국내"):$("<td>").html("해외");
					var tr = $("<tr class='tourList' data-no='"+obj.no+"'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10);
					$("#tour #table").append(tr);
				})
				var prev = res.pageMaker.prev;
				var next = res.pageMaker.next;
				var prevA = $("<a id='prev'>").html("&laquo;");
				var nextA = $("<a id='next'>").html("&raquo;");
				var liPrev = $("<li>").append(prevA);
				var liNext = $("<li>").append(nextA);
				if(prev) $("#tour .pagination").append(liPrev);
				for(var i = res.pageMaker.startPage; i <= res.pageMaker.endPage; i++) {
					var a = $("<a class='index' data-index='"+i+"'>").html(i);
					var li = $("<li>").append(a);
					if (res.pageMaker.cri.page == i) {
						li.addClass("active");
					}
					$("#tour .pagination").append(li);
				}
				if(next) $("#tour .pagination").append(liNext);
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var clickTour = function(no) {
		$.ajax({
			url : "tourList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				console.log(res);
				getTourData(res);
				$("#tour").modal("hide");
				$('#tour .modal-backdrop').remove();
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var rentAjax = function(page,searchType,keyword) {
		$.ajax({
			url : "rentList",
			type : "get",
			data : {
				page : page,
				searchType : searchType,
				keyword : keyword
			},
			dataType : "json",
			success : function(res) { // 결과 성공 콜백함수
				console.log(res)
				$("#rent .rentcarList").remove();
				$("#rent .pagination").empty();
				$(res.list).each(function(i,obj){
					var td1 = $("<td>").html(obj.no);
					var td2 = $("<td>").html(obj.cdiv);
					var td3 = $("<td>").html(obj.cno);
					var rentdDate = makeDateStr(obj.rentddate);
					var returnDate = makeDateStr(obj.returndate);
					var td4 = $("<td>").html(rentdDate);
					var td5 = $("<td>").html(returnDate);
					var td6 = $("<td>").html(obj.rentaddr);
					var td7 = $("<td>").html(obj.returnaddr);
					var td8 = $("<td>").html(obj.price);
					var td9 = $("<td>").html(obj.capacity);
					var td10 = $("<td>").html(obj.insurance);
					var ldiv = obj.ldiv==0?'해외':'국내';
					var td11 = $("<td>").html(ldiv);			
					var tr = $("<tr class='rentcarList' data-no='"+obj.no+"'>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11);
					$("#rent #table").append(tr);
				})
				var prev = res.pageMaker.prev;
				var next = res.pageMaker.next;
				var prevA = $("<a id='prev'>").html("&laquo;");
				var nextA = $("<a id='next'>").html("&raquo;");
				var liPrev = $("<li>").append(prevA);
				var liNext = $("<li>").append(nextA);
				if(prev) $("#rent .pagination").append(liPrev);
				for(var i = res.pageMaker.startPage; i <= res.pageMaker.endPage; i++) {
					var a = $("<a class='index' data-index='"+i+"'>").html(i);
					var li = $("<li>").append(a);
					if (res.pageMaker.cri.page == i) {
						li.addClass("active");
					}
					$("#rent .pagination").append(li);
				}
				if(next) $("#rent .pagination").append(liNext);
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
	}
	var clickRent = function(no) {
		$.ajax({
			url : "rentList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				console.log(res);
				getRentData(res);
				$("#rent").modal("hide");
				$('#rent .modal-backdrop').remove();
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		})
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
		//호텔 다이얼로그
		$(document).on("click", "#hotel .index", function() {
			page = $(this).attr("data-index");
			searchType = $("#hotel #searchType option:selected").val();
			keyword = $("#hotel #keywordInput").val();
			hotelAjax(page, searchType, keyword);
		})
		$(document)
				.on(
						"click",
						"#hotel #prev",
						function() {
							page = Number($("#hotel .index").eq(0)
									.attr("data-index")) - 1;
							searchType = $(
									"#hotel #searchType option:selected")
									.val();
							keyword = $("#hotel #keywordInput").val();
							hotelAjax(page, searchType, keyword);
						})
		$(document)
				.on(
						"click",
						"#hotel #next",
						function() {
							page = Number($("#hotel .index").eq(9)
									.attr("data-index")) + 1;
							searchType = $(
									"#hotel #searchType option:selected")
									.val();
							keyword = $("#hotel #keywordInput").val();
							hotelAjax(page, searchType, keyword);
						})
		$(document).on("click", "#hotel .hotelList", function() {
			var no = $(this).attr("data-no");
			clickHotel(no);
		})
		$("#hotel #btnSearch")
				.click(
						function() {
							page = $("#hotel .pagination").find(
									".active a").attr("data-index");
							searchType = $(
									"#hotel #searchType option:selected")
									.val();
							keyword = $("#hotel #keywordInput").val();
							hotelAjax(page, searchType, keyword);
						})
		//투어 다이얼로그
		$(document).on("click", "#tour .index", function() {
			page = $(this).attr("data-index");
			searchType = $("#tour #searchType option:selected").val();
			keyword = $("#tour #keywordInput").val();
			tourAjax(page, searchType, keyword);
		})
		$(document)
				.on(
						"click",
						"#tour #prev",
						function() {
							page = Number($("#tour .index").eq(0)
									.attr("data-index")) - 1;
							searchType = $(
									"#tour #searchType option:selected")
									.val();
							keyword = $("#tour #keywordInput").val();
							tourAjax(page, searchType, keyword);
						})
		$(document)
				.on(
						"click",
						"#tour #next",
						function() {
							page = Number($("#tour .index").eq(9)
									.attr("data-index")) + 1;
							searchType = $(
									"#tour #searchType option:selected")
									.val();
							keyword = $("#tour #keywordInput").val();
							tourAjax(page, searchType, keyword);
						})
		$(document).on("click", "#tour .tourList", function() {
			var no = $(this).attr("data-no");
			clickTour(no);
		})
		$("#tour #btnSearch")
				.click(
						function() {
							page = $("#tour .pagination").find(
									".active a").attr("data-index");
							searchType = $(
									"#tour #searchType option:selected")
									.val();
							keyword = $("#tour #keywordInput").val();
							tourAjax(page, searchType, keyword);
						})
		//렌터카 다이얼로그
		$(document).on("click", "#rent .index", function() {
			page = $(this).attr("data-index");
			searchType = $("#rent #searchType option:selected").val();
			keyword = $("#rent #keywordInput").val();
			rentAjax(page, searchType, keyword);
		})
		$(document)
				.on(
						"click",
						"#rent #prev",
						function() {
							page = Number($("#rent .index").eq(0)
									.attr("data-index")) - 1;
							searchType = $(
									"#rent #searchType option:selected")
									.val();
							keyword = $("#rent #keywordInput").val();
							rentAjax(page, searchType, keyword);
						})
		$(document)
				.on(
						"click",
						"#rent #next",
						function() {
							page = Number($("#rent .index").eq(9)
									.attr("data-index")) + 1;
							searchType = $(
									"#rent #searchType option:selected")
									.val();
							keyword = $("#rent #keywordInput").val();
							rentAjax(page, searchType, keyword);
						})
		$(document).on("click", "#rent .rentcarList", function() {
			var no = $(this).attr("data-no");
			clickRent(no);
		})
		$("#rent #btnSearch")
				.click(
						function() {
							page = $("#rent .pagination").find(
									".active a").attr("data-index");
							searchType = $(
									"#rent #searchType option:selected")
									.val();
							keyword = $("#rent #keywordInput").val();
							rentAjax(page, searchType, keyword);
						})
		//다이얼로그 호출
		$("#addFlight").click(function() {
			if(airAdd[0]&&airAdd[1]) {
				if(confirm("기존의 출도착 항공편이 추가되어있습니다 다시 추가하시겠습니까?")) {
					airAdd[0] = false;
					airAdd[1] = false;
					$("#totalFlight .flightList").empty();
					$("#flightDepature").modal("show");
				}
			}
			else if(!airAdd[0]&&!airAdd[1]) {
				$("#flightDepature").modal("show");
			}
		})
		$("#showFlight").click(function() {
			$("#totalFlight").modal("show");
		})
		$("#addHotel").click(function() {
			$("#hotel").modal("show");
		})
		$("#showHotel").click(function() {
			$("#totalHotel").modal("show");
		})
		$("#addTour").click(function() {
			$("#tour").modal("show");
		})
		$("#showTour").click(function() {
			$("#totalTour").modal("show");
		})
		$("#addRent").click(function() {
			$("#rent").modal("show");
		})
		$("#showRent").click(function() {
			$("#totalRent").modal("show");
		})
		$("#addDetail").click(function(){
			$("#detail").modal("show");
		})
		$("#showDetail").click(function(){
			$("#totalDetail").modal("show");
		})
		//ckeditor
		CKEDITOR.replace('editor1');
		$.fn.modal.Constructor.prototype.enforceFocus = function () {
		    modal_this = this
		    $(document).on('focusin.modal', function (e) {
		        if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length
		        // add whatever conditions you need here:
		        &&
		        !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
		            modal_this.$element.focus()
		        }
		    })
		};
		CKEDITOR.replace('editor2');
		$.fn.modal.Constructor.prototype.enforceFocus = function () {
		    modal_this = this
		    $(document).on('focusin.modal', function (e) {
		        if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length
		        // add whatever conditions you need here:
		        &&
		        !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
		            modal_this.$element.focus()
		        }
		    })
		};
		$("#saveDetail").click(function(){
			$("#editor2").val($("#editor1").val());
			alert("저장되었습니다");
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
										 id="addFlight">항공편 추가</button>
									<button type="button" class="btn btn-primary"
										 id="showFlight">항공편 보기</button>
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
										<button type="button" class="btn btn-primary" id="addHotel">호텔
											추가</button>
										<button type="button" class="btn btn-primary" id="showHotel">호텔
											보기</button>
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
									<button type="button" class="btn btn-primary" id="addTour">현지투어 추가</button>
									<button type="button" class="btn btn-primary" id="showTour">현지투어 보기</button>
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
									<button type="button" class="btn btn-primary" id="addRent">렌트카 추가</button>
									<button type="button" class="btn btn-primary" id="showRent">렌트카 보기</button>
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
								<label>상품 번호</label> <input type="text" class="form-control" readonly="readonly" value="1">
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
									<button type="button" class="btn btn-primary" id="addDetail">상품설명 추가</button>
									<button type="button" class="btn btn-primary" id="showDetail">상품설명 보기</button>
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
	<div id="totalFlight" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">추가된 항공편</h4>
				</div>
				<div class="modal-body">
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
					</table>
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
								<option value="total"
									${cri.searchType == 'null'? 'selected':'' }>전체</option>
								<option value="n" ${cri.searchType == 'n'? 'selected':'' }>호텔이름</option>
								<option value="a" ${cri.searchType == 'a'? 'selected':'' }>호텔주소</option>
								<option value="b" ${cri.searchType == 'b'? 'selected':'' }>객실체크여부</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${cri.keyword}">
							<button id="btnSearch">검색</button>
						</div>
						<div class="box-body">
							<table class="table table-bordered" id="table">
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
									<tr class="hotelList" data-no="${hotel.no}">
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
											<c:when test="${hotel.roomtype=='N'}">
												<td style="color: #5D5D5D;" id="n">노말</td>
											</c:when>
											<c:when test="${hotel.roomtype=='D'}">
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
										<c:choose>
											<c:when test="${hotel.bookedup == 0}">
												<td><span class="badge bg-red">예약가능</span></td>
											</c:when>
											<c:when test="${hotel.bookedup == 1}">
												<td><span class="badge bg-blue">예약불가능</span></td>
											</c:when>
										</c:choose>
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
										<li class="${pageMakerByHotel.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByHotel.next == true }">
										<li><a id="next">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="totalHotel" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">추가된 호텔 리스트</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered" id="table">
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
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="tour" class="modal fade" role="dialog" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">투어</h4>
				</div>
				<div class="modal-body">
					<div class="box box-primary">
						<div class="box-body">
							<select name="searchType" id="searchType">
								<option value="N">----------</option>
								<option value="name">투어이름</option>
								<option value="location">투어지역</option>
								<option value="date">날짜</option>
								<option value="addr">주소</option>
								<option value="div">장소구분</option>
							</select> <input type="text" name="keyword" id="keywordInput">
							<button id="btnSearch">Search</button>
						</div>
						<div class="box-body">
							<table class="table table-bordered" id="table">
								<tr>
									<th>번호</th>
									<th>투어제목</th>
									<th>투어장소</th>
									<th>시작일자</th>
									<th>종료일자</th>
									<th>주소</th>
									<th>소요시간</th>
									<th>허용인원</th>
									<th>가격</th>
									<th>장소구분</th>
								</tr>
								<c:forEach var="tour" items="${tourList}">
									<tr class="tourList" data-no="${tour.no}">
										<td>${tour.no}</td>
										<td>${tour.tname}</td>
										<td>${tour.tlocation}</td>
										<td><fmt:formatDate value="${tour.startDate}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${tour.endDate}"
												pattern="yyyy-MM-dd" /></td>
										<td>${tour.taddr}</td>
										<td><fmt:formatDate value="${tour.etime}"
												pattern="HH:mm:ss" /></td>
										<td>${tour.capacity}</td>
										<td><fmt:formatNumber value="${tour.tprice}"
												pattern="###,###" /></td>
										<td>${tour.ldiv?'해외':'국내'}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMakerByTour.prev == true }">
										<li><a id="prev">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMakerByTour.startPage }"
										end="${pageMakerByTour.endPage }" var="idx">
										<li class="${pageMakerByTour.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByTour.next == true }">
										<li><a id="next">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="totalTour" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">추가된 투어 리스트</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered" id="table">
						<tr>
							<th>번호</th>
							<th>투어제목</th>
							<th>투어장소</th>
							<th>시작일자</th>
							<th>종료일자</th>
							<th>주소</th>
							<th>소요시간</th>
							<th>허용인원</th>
							<th>가격</th>
							<th>장소구분</th>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="rent" class="modal fade" role="dialog" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">투어</h4>
				</div>
				<div class="modal-body">
					<div class="box box-primary">
						<div class="box-body">
							<select name="searchType" id="searchType" style="width:200px; height: 25px;">
								<option value="N" ${cri.searchType ==null?'selected':''}>----------</option>
								<option value="rentcarType" ${cri.searchType =='rentcarType'?'selected':''}>차종류</option>
								<option value="rentcarCno" ${cri.searchType =='rentcarCno'?'selected':''}>차번호</option>
								<option value="rentDepartDate" ${cri.searchType =='rentDepartDate'?'selected':''}>대여날짜</option>
								<option value="rentDepartaddr" ${cri.searchType =='rentDepartaddr'?'selected':''}>대여,반납 장소</option>
								<option value="rentLDiv" ${cri.searchType =='rentLDiv'?'selected':''}>장소구분(국내/해외)</option>
							</select>
							<input type="text" name="keyword" id="keywordInput">
							<button id="btnSearch">Search</button>
						</div>
						<div class="box-body">
							<table class="table table-bordered" id="table">
								<tr>
									<th>번호</th>
									<th>차 종류</th>
									<th>차 번호</th>
									<th>대여 일자</th>
									<th>반납 일자</th>
									<th>대여 장소</th>
									<th>반납 장소</th>
									<th>가격</th>
									<th>허용인원</th>
									<th>보험여부</th>
									<th>국내/해외</th>		
								</tr>
								<c:forEach var="rentcar" items="${rentcarList}">
								<tr class="rentcarList" data-no="${rentcar.no}">
									<td>${rentcar.no}</td>
									<td>${rentcar.cdiv}</td>
									<td>${rentcar.cno}</td>
									<td><fmt:formatDate value="${rentcar.rentddate}" pattern="yyyy-MM-dd "/></td>
									<td><fmt:formatDate value="${rentcar.returndate}" pattern="yyyy-MM-dd "/></td>
									<td>${rentcar.rentaddr}</td>
									<td>${rentcar.returnaddr}</td>
									<td>${rentcar.price}</td>
									<td>${rentcar.capacity}</td>
									<td>${rentcar.insurance}</td>
									<td>${rentcar.ldiv == 0?'해외':'국내'}</td>
								</tr>
								</c:forEach>     
							</table>      
						</div>
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMakerByRentcar.prev == true }">
										<li><a id="prev">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMakerByRentcar.startPage }"
										end="${pageMakerByRentcar.endPage }" var="idx">
										<li class="${pageMakerByRentcar.cri.page == idx ?'active':''}"><a
											class="index" data-index="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageMakerByRentcar.next == true }">
										<li><a id="next">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="totalRent" class="modal fade" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">추가된 렌트카 리스트</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered" id="table">
						<tr>
							<th>번호</th>
							<th>차 종류</th>
							<th>차 번호</th>
							<th>대여 일자</th>
							<th>반납 일자</th>
							<th>대여 장소</th>
							<th>반납 장소</th>
							<th>가격</th>
							<th>허용인원</th>
							<th>보험여부</th>
							<th>국내/해외</th>		
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalAddBrandLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                 <h4 class="modal-title" id="modalAddBrandLabel">상품 설명 추가</h4>
	
	            </div>
	            <div class="modal-body">
	                <form>
	                    <textarea name="editor1" id="editor1"></textarea>
	                </form>
	            </div>
	            <div class="modal-footer">
	            	<button id="saveDetail" type="button" class="btn btn-primary">저장</button>
	                <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="modal fade" id="totalDetail" tabindex="-1" role="dialog" aria-labelledby="modalAddBrandLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                 <h4 class="modal-title" id="modalAddBrandLabel">상품 설명 보기</h4>
	
	            </div>
	            <div class="modal-body">
	                <form>
	                    <textarea name="editor2" id="editor2"></textarea>
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
<%@ include file="../../include/footer.jsp"%>