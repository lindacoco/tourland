<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var div;
	var page;
	var searchType;
	var keyword;
	var price = 0;
	var airAdd = [false,false];
	var calExpireDate = function(date) {
		var objDate = new Date(date);
		var dateDiff = new Date(objDate.getFullYear(),objDate.getMonth(),(objDate.getDate() -3));
		var month = (dateDiff.getMonth() + 1) < 10 ? "0" + (dateDiff.getMonth() + 1) : (dateDiff.getMonth() + 1);
		var day = dateDiff.getDate() < 10 ? "0" + dateDiff.getDate() : dateDiff.getDate();
		var dateStr = dateDiff.getFullYear() + "-" + month + "-" + day;
		return dateStr;
	}
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
	var getAirData = function(res) {
		var no = $("<input type='hidden' name='airNo'>").val(res.vo.no);
		var td1 = $("<td>").html(res.vo.no).append(no);
		var td2 = $("<td>").html(res.vo.ano);
		var td3 = $("<td>").html(res.vo.dlocation);
		var td4 = $("<td>").html(res.vo.rlocation);
		var ddateStr = makeDateStr(res.vo.ddate);
		var rdateStr = makeDateStr(res.vo.rdate);
		var td5 = $("<td>").html(ddateStr);
		var td6 = $("<td>").html(rdateStr);
		var ldiv = res.vo.ldiv==0?'해외':'국내';
		var td7 = $("<td>").html(ldiv);
		var td8 = $("<td>").html(res.vo.capacity);
		var td9 = res.vo.seat=='F'?
				$("<td id='first'>").html('First-Class') :
					res.vo.seat=='B'?
				$("<td id='bus'>").html('Business-Class') :
					$("<td id='eco'>").html('economy');
		var td10 = $("<td>").html(res.vo.price);
		var tr = $("<tr class='flightList'>")
					.append(td1).append(td2)
					.append(td3).append(td4)
					.append(td5).append(td6)
					.append(td7).append(td8)
					.append(td9).append(td10);
		$("#airTable").append(tr);
		price += Number(res.vo.price);
		$("#price").val(price);
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
		$("#hotelTable").append(tr);
		var iDate = new Date(res.vo.checkin);
		var oDate = new Date(res.vo.checkout);
		var dateDiff = oDate.getDate() - iDate.getDate();
		price += Number(res.vo.price * dateDiff);
		$("#price").val(price);
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
		$("#tourTable").append(tr);
		price += Number(res.vo.tprice);
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
		$("#rentTable").append(tr);
		price += Number(res.vo.price);
		$("#price").val(price);
	}
	var clickAir = function(no, div) {
		$.ajax({
			url : "flightList/" + no,
			type : "get",
			dataType : "json",
			success : function(res) {
				if (div == 'Depature') {
					var expireDate = calExpireDate(res.vo.ddate);
					$("#pexpire").val(expireDate);
					getAirData(res);
					airAdd[0] = true;
					$("#flightDepature").modal("hide");
					$('#flightDepature .modal-backdrop').remove();
					$("#flightRending").modal("show");
				} else {
					getAirData(res);
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
						$(res.list).each(function(i, obj) {
							var td1 = $("<td>").html(obj.no);
							var td2 = $("<td>").html(obj.ano);
							var td3 = $("<td>").html(obj.dlocation);
							var td4 = $("<td>").html(obj.rlocation);
							var ddateStr = makeDateStr(obj.ddate);
							var rdateStr = makeDateStr(obj.rdate);
							var td5 = $("<td>").html(ddateStr);
							var td6 = $("<td>").html(rdateStr);
							var ldiv = obj.ldiv==0?'해외':'국내';
							var td7 = $("<td>").html(ldiv);
							var td8 = $("<td>").html(obj.capacity);
							var td9 = obj.seat=='F'?
									$("<td id='first'>").html('First-Class') :
										obj.seat=='B'?
									$("<td id='bus'>").html('Business-Class') :
										$("<td id='eco'>").html('economy');
							var td10 = $("<td>").html(obj.price);
							var tr = $("<tr class='flightList' data-no='"+obj.no+"'>")
										.append(td1).append(td2)
										.append(td3).append(td4)
										.append(td5).append(td6)
										.append(td7).append(td8)
										.append(td9).append(td10);
							div == "Depature" ? $("#flightDepature #table").append(tr) 
												: $("#flightRending #table").append(tr);
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
					var td10 = obj.ldiv==0?$("<td>").html("해외"):$("<td>").html("국내");
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
		$("#file").change(function() {
			var files = $(this)[0].files;
			console.log(files);
			$("#preview").empty();
			$(files).each(function(i, obj) {
				var reader = new FileReader();
				reader.readAsDataURL(obj);
				reader.onload = function(e) {
					var img = $("<img>").attr("src",e.target.result);
					$("#preview").append(img);			
				}
			})
		})
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
		$("#addHotel").click(function() {
			$("#hotel").modal("show");
		})
		$("#addTour").click(function() {
			$("#tour").modal("show");
		})
		$("#addRent").click(function() {
			$("#rent").modal("show");
		})
		$("#addDetail").click(function(){
			$("#detail").modal("show");
		}) 
		//ckeditor
		CKEDITOR.replace( 'ckeditor', {
			filebrowserImageUploadUrl: '/'    
		});
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
			$("#pcontent").val($("#detail").html());
			alert("저장되었습니다");
		})
	})
</script>