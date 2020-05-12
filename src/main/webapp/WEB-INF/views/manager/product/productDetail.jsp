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
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-primary">
					<div class="box-header">
						<h2>상품 보기</h2>
					</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>항공</label>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" style="width : 100%;">
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
							<tr>
								<td>${f.no }</td>
								<td>${f.ano}</td>
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
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>호텔</label>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" style="width : 100%;">
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
								<c:forEach var="hotel" items="${vo.hotel}" begin="0" end="0">
									<tr>
										<td>${hotel.no}</td>
										<td>${hotel.hname }</td>
										<td>${hotel.haddr }</td>
										<td><fmt:formatDate value="${hotel.checkin}" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${hotel.checkout}" pattern="yyyy-MM-dd"/></td>
										<td>${hotel.capacity }<span>인</span></td>
										<td>${hotel.price }</td>
										<td>${hotel.roomcapacity }<span>실</span></td>
	
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
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" style="width : 100%;">
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
								<tr>
									<td>${tour.no}</td>
									<td>${tour.tname}</td>
									<td>${tour.tlocation}</td>
									<td><fmt:formatDate value="${tour.startDate}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${tour.endDate}" pattern="yyyy-MM-dd"/></td>
									<td>${tour.taddr}</td>
									<td><fmt:formatDate value="${tour.etime}" pattern="HH:mm:ss"/></td>
									<td>${tour.capacity}</td>
									<td><fmt:formatNumber value="${tour.tprice}" pattern="###,###"/></td>
									<td>${tour.ldiv?'해외':'국내'}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>렌트카</label>
							</div>
						</div>
						<div style="padding:20px;">
							<table class="table table-bordered" style="width : 100%;">
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
								<tr>
									<td>${rentcarList.no}</td>
									<td>${rentcarList.cdiv}</td>
									<td>${rentcarList.cno}</td>
									<td><fmt:formatDate value="${rentcarList.rentddate}" pattern="yyyy-MM-dd "/></td>
									<td><fmt:formatDate value="${rentcarList.returndate}" pattern="yyyy-MM-dd "/></td>
									<td>${rentcarList.rentaddr}</td>
									<td>${rentcarList.returnaddr}</td>
									<td>${rentcarList.price}</td>
									<td>${rentcarList.capacity}</td>
									<td>${rentcarList.insurance}</td>
									<td>${rentcarList.ldiv == 0?'해외':'국내'}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div class="group">
							<div class="form-group">
								<label>상품 번호</label> <input type="text" class="form-control" readonly="readonly" value="${vo.pno}">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 이름</label> <input
									type="text" class="form-control" required="required" value="${vo.pname}" readonly="readonly">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 설명</label>
							</div>
						</div>
						<div class="group">
							<div class="form-group" style="width : 100%;">
								<!-- ${vo.pcontent} -->
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 가격</label> <input
									type="text" class="form-control" value="${vo.pprice}" readonly="readonly">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 유효기간</label> <input
									type="text" class="form-control" value='<fmt:formatDate value="${vo.pexpire}" pattern="yyyy-MM-dd"/>' readonly="readonly">
							</div>
						</div>
						<div class="group">
							<div class="form-group" style="width : 100%">
								<label><span class="red">*</span>상품 사진</label>
							</div>
					   </div>
					   <div style="width : 100%;">
							<img src="displayFile/product?filename=${vo.pic}" style="width : 90%; margin : 10px;"> 
					   </div>
					   <div class="box-footer" style="text-align : center;">
						<button class="btn btn-warning" id="mod">수정</button>
						<button class="btn btn-danger" id="del">삭제</button>
						<button class="btn btn-primary" id="return">돌아가기</button>
					</div>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>
<%@ include file="../../include/footer.jsp"%>