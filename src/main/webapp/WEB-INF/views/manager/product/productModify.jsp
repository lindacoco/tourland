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
#airTable th, #airTable td {
	text-align : center;
}
#hotelTable th, #hotelTable td {
	text-align : center;
}
#tourTable th, #tourTable td {
	text-align : center;
}
#rentTable th, #rentTable td {
	text-align : center;
}
#preview img {
	height : 100px;
}
#first { color: maroon; font-weight: bold;}
#bus { color: steelblue; font-weight: bold;}
#eco { color: goldenrod; font-weight: bold;}
body {
	margin : 0;
}
</style>
<%@include file="productModifyForm_script.jsp" %>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-primary">
					<div class="box-header">
						<h2>상품 수정</h2>
					</div>
					<p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
					<form class="form-inline" action="productModify?page=${cri.page}&searchType=${searchType}&keyword=${keyword}" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="pdiv" value="false">
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>항공</label>
								<div class="container">
									<button type="button" class="btn btn-primary"
										 id="modFlight">항공편 수정</button>
								</div>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" id="airTable" style="width : 100%;">
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
							<c:forEach items="${vo.air}" var="f">     
							<tr class="flightList">
								<td>${f.no }<input type="hidden" name="airNo" value="${f.no}"></td>
								<td>${f.ano}</td>
								<td>${f.dlocation }</td>
								<td>${f.rlocation }</td>
								<td id="ddate" data-ddate="<fmt:formatDate value="${f.ddate }" pattern ="yyyy-MM-dd"/>"><fmt:formatDate value="${f.ddate }" pattern ="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${f.rdate }" pattern ="yyyy-MM-dd"/></td>
								<td>${f.ldiv==1?'국내':'해외'}</td>
								<td id="acapacity" data-capacity="${f.capacity}">${f.capacity }</td>
								<c:if test="${f.seat =='F'}">
									<td id="first">First-Class</td>
								</c:if>
								<c:if test="${f.seat =='B'}">
									<td id="bus">Business-Class</td>
								</c:if>
								<c:if test="${f.seat =='E'}">
									<td id="eco">Economy-Class</td>
								</c:if>
								<td id="aprice" data-price="${f.price}">${f.price }</td>
							</tr>
							</c:forEach> 
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>호텔</label>
								<div class="container">
									<div class="dropdown">
										<button type="button" class="btn btn-primary" id="modHotel">호텔
											수정</button>
									</div>
								</div>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" id="hotelTable">
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
								<c:forEach var="hotel" items="${vo.hotel}">
									<tr class="hotelList">
										<td id="dateDiff">${hotel.no}<input type="hidden" name="hotelNo" value="${hotel.no}"></td>
										<td>${hotel.hname }</td>
										<td>${hotel.haddr }</td>
										<td id="checkin" data-checkin="<fmt:formatDate value="${hotel.checkin}" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${hotel.checkin}" pattern="yyyy-MM-dd"/></td>
										<td id="checkout" data-checkout="<fmt:formatDate value="${hotel.checkout}" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${hotel.checkout}" pattern="yyyy-MM-dd"/></td>
										<td id="hcapacity" data-capacity="${hotel.capacity}">${hotel.capacity }<span>인</span></td>
										<td id="hprice" data-price="${hotel.price}">${hotel.price }</td>
										<td id="hrcapacity" data-roomcapacity="${hotel.roomcapacity}">${hotel.roomcapacity }<span>실</span></td>
	
										<c:choose>
											<c:when test="${hotel.roomtype=='N'}">
												<td style="color:#5D5D5D;" id="n">노말</td>
											</c:when>
											<c:when test="${hotel.roomtype=='D'}">
												<td style="color:#F29661;" id="d">디럭스</td>
											</c:when>
											<c:otherwise>
												<td style="color:#D941C5;" id="s">스위트</td>
											</c:otherwise>
										</c:choose>
										
										<c:if test="${hotel.ldiv==0}">
											<td>해외</td>
										</c:if>
										<c:if test="${hotel.ldiv == 1}">
											<td>국내</td>
										</c:if>
										
										<c:choose>
											<c:when test="${hotel.bookedup == 0}">
												<td><span class="badge bg-orange">예약가능</span></td>
											</c:when>
											<c:when test="${hotel.bookedup == 1}">
												<td><span class="badge bg-blue">예약불가능</span></td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>현지 투어</label>
								<div class="container">
									<button type="button" class="btn btn-primary" id="modTour">현지투어 수정</button>
								</div>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" id="tourTable">
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
								<c:forEach var="tour" items="${vo.tour}">
								<tr class="tourList">
									<td>${tour.no}<input type="hidden" name="tourNo" value="${tour.no}"></td>
									<td>${tour.tname}</td>
									<td>${tour.tlocation}</td>
									<td><fmt:formatDate value="${tour.startDate}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${tour.endDate}" pattern="yyyy-MM-dd"/></td>
									<td>${tour.taddr}</td>
									<td><fmt:formatDate value="${tour.etime}" pattern="HH:mm:ss"/></td>
									<td id="tcapacity" data-capacity="${tour.capacity}">${tour.capacity}</td>
									<td id="tprice" data-price="${tour.tprice}"><fmt:formatNumber value="${tour.tprice}" pattern="###,###"/></td>
									<td>${tour.ldiv?'국내':'해외'}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>렌트카</label>
								<div class="container">
									<button type="button" class="btn btn-primary" id="modRent">렌트카 수정</button>
								</div>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" id="rentTable">
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
								<c:forEach var="rentcarList" items="${vo.rentcar}">
								<tr class="rentcarList">
									<td>${rentcarList.no}<input type="hidden" name="rentcarNo" value="${rentcarList.no}"></td>
									<td>${rentcarList.cdiv}</td>
									<td>${rentcarList.cno}</td>
									<td><fmt:formatDate value="${rentcarList.rentddate}" pattern="yyyy-MM-dd "/></td>
									<td><fmt:formatDate value="${rentcarList.returndate}" pattern="yyyy-MM-dd "/></td>
									<td>${rentcarList.rentaddr}</td>
									<td>${rentcarList.returnaddr}</td>
									<td id="rprice" data-price="${rentcarList.price}">${rentcarList.price}</td>
									<td>${rentcarList.capacity}</td>
									<td>${rentcarList.insurance}</td>
									<td>${rentcarList.ldiv == 0?'해외':'국내'}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 번호</label> 
								<input type="text" class="form-control" readonly="readonly" value="${vo.pno}" name="pno">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 이름</label> <input
									type="text" class="form-control" name="pname" value="${vo.pname}" required="required">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 설명</label>
							</div>
						</div>
						<div>
							<textarea name="pcontent" rows="80" id="detail">${vo.pcontent}</textarea>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 가격</label> <input
									type="text" class="form-control" value="0" id="price" readonly="readonly" name="pprice">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 유효기간</label> <input
									type="text" class="form-control" id="pexpire" name="pexpire" value='<fmt:formatDate value="${vo.pexpire}" pattern="yyyy-MM-dd"/>' readonly="readonly">
							</div>
						</div>
						<div class="group">
							<div class="form-group" style="width : 1000px;">
								<label><span class="red">*</span>상품 사진</label> <input
									type="file" class="form-control" id="file" name="file">
								<div id="preview" style="display : inline;">
									<c:if test="${vo.pic!=null}">
										<img src="displayFile/productSmall?filename=${vo.pic}" style="margin : 10px;">
										<input type="hidden" name="originalPic" value="${vo.pic}">
									</c:if>
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<button type="submit" class="btn btn-default">수정</button>
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
								<option value="n">선택하세요</option>
								<option value="no">번호</option>
								<option value="ano">항공기 번호</option>
								<option value="rloca">도착 지역</option>
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
								<c:forEach items="${flightListDepature }" var="f">   
									<tr class='flightList' data-no="${f.no }">
										<td>${f.no }</td>
										<td>${f.ano }</td>
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
											<td id="first">First-Class</td>
										</c:if>
										<c:if test="${f.seat =='B'}">
											<td id="bus">Business-Class</td>
										</c:if>
										<c:if test="${f.seat =='E'}">
											<td id="eco">Economy-Class</td>
										</c:if>
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
								<c:forEach items="${flightListRending }" var="f">   
									<tr class='flightList' data-no="${f.no }">
										<td>${f.no }</td>
										<td>${f.ano }</td>
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
											<td id="first">First-Class</td>
										</c:if>
										<c:if test="${f.seat =='B'}">
											<td id="bus">Business-Class</td>
										</c:if>
										<c:if test="${f.seat =='E'}">
											<td id="eco">Economy-Class</td>
										</c:if>
										<td>${f.price }</td>
									</tr>
								</c:forEach>   
							</table>
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
								<option value="total" ${cri.searchType == 'total'? 'selected':'' }>전체</option>
								<option value="hname" ${cri.searchType == 'hname'? 'selected':'' }>호텔이름</option>
								<option value="haddr" ${cri.searchType == 'haddr'? 'selected':'' }>호텔주소</option>
								<option value="bookedup" ${cri.searchType == 'bookedup'? 'selected':'' }>객실체크여부</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${cri.keyword}">
							<button id="btnSearch">검색</button>
						</div>
						<div class="box-body">
							<p id="datePick">
								<span><i class="far fa-calendar-alt"></i> 체크인 </span> 
								<span class="picker"><input type="date" class="datepicker" name="checkin" placeholder="날짜를 선택하려면 클릭." style="height:30px;" value="${cri.keyword2}"></span>
								<span><i class="far fa-calendar-alt"></i> ~  체크아웃 </span> 
								<span class="picker"><input type="date" class="datepicker" name="checkout" placeholder="날짜를 선택하려면 클릭." style="height:30px;" value="${cri.keyword3}"></span>
								<span id="pickSearch"><a href="#"><i class="fas fa-search"></i></a></span>
							</p>
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

										<c:if test="${hotel.ldiv==0}">
											<td>해외</td>
										</c:if>
										<c:if test="${hotel.ldiv==1}">
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
										<td>${tour.ldiv?'국내':'해외'}</td>
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
	<div id="rent" class="modal fade" role="dialog" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">렌트카</h4>
				</div>
				<div class="modal-body">
					<div class="box box-primary">
						<div class="box-body">
							<select name="searchType" id="searchType" style="width:200px; height: 25px;">
								<option value="N" ${cri.searchType ==null?'selected':''}>----------</option>
								<option value="rentcarType" ${cri.searchType =='rentcarType'?'selected':''}>차종류</option>
								<option value="rentcarCno" ${cri.searchType =='rentcarCno'?'selected':''}>차번호</option>
								<option value="rentDepartaddr" ${cri.searchType =='rentDepartaddr'?'selected':''}>대여,반납 장소</option>
								<option value="rentLDiv" ${cri.searchType =='rentLDiv'?'selected':''}>장소구분(국내/해외)</option>
							</select>
							<input type="text" name="keyword" id="keywordInput">
							<button id="btnSearch">Search</button>
						</div>
						<div class="box-body">
							<p id="datePick">
								<span><i class="far fa-calendar-alt"></i> 시작 날짜 </span> 
								<span class="picker"><input type="date" class="datepicker" name="rentddate" placeholder="날짜를 선택하려면 클릭." style="height:30px;"></span>
								<span><i class="far fa-calendar-alt"></i> ~  종료 날짜 </span> 
								<span class="picker"><input type="date" class="datepicker" name="returndate" placeholder="날짜를 선택하려면 클릭." style="height:30px;"></span>
								<span id="pickSearch"><a href="#"><i class="fas fa-search"></i></a></span>
							</p>
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
</body>
</html>
<%@ include file="../../include/footer.jsp"%>