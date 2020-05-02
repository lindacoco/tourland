<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
#btnRegister{
	margin-left: 40px;
}
#n, #s, #d{
	font-weight: bold;
}
</style>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">호텔 관리</h3>
				</div>
				<div class="box-body">
					<select name="searchType" id="searchType">
						<option>전체</option>
						<option>호텔이름</option>
						<option>호텔주소</option>
						<option>체크인날짜</option>
						<option>장소구분</option>
						<option>객실체크여부</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="${cri.keyword}">
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
							<c:forEach var="hotel" items="${list}">
								<tr>
									<td>${hotel.no }</td>
									<td>${hotel.hname }</td>
									<td>${hotel.haddr }</td>
									<td><fmt:formatDate value="${hotel.checkin}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${hotel.checkout}" pattern="yyyy-MM-dd"/></td>
									<td>${hotel.capacity }<span>인</span></td>
									<td>${hotel.price }</td>
									<td>${hotel.roomcapacity }<span>실</span></td>

									<c:choose>
										<c:when test="${hotel.roomtype == 'N'}">
											<td style="color:#5D5D5D;" id="n">노말</td>
										</c:when>
										<c:when test="${hotel.roomtype == 'D'}">
											<td style="color:#F29661;" id="d">디럭스</td>
										</c:when>
										<c:otherwise>
											<td style="color:#D941C5;" id="s">스위트</td>
										</c:otherwise>
									</c:choose>
									
									<c:if test="${hotel.ldiv==1}">
										<td>해외</td>
									</c:if>
									<c:if test="${hotel.ldiv == 0}">
										<td>국내</td>
									</c:if>
									<c:if test="${hotel.bookedup == 0}">
										<td><span class="badge bg-red">예약가능</span><td>
									</c:if>
									<c:if test="${hotel.bookedup == 1}">
										<td><span class="badge bg-blue">예약불가능</span><td>
									</c:if>
								</tr>
							</c:forEach>
					</table>
				</div>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev ==true }">
							<li><a href="hotelMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
							<li class="${pageMaker.cri.page == idx? 'active':'' }"><a href="hotelMngList?page=${idx }&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next == true }">
							<li><a href="hotelMngList?page=${pageMaker.endPage+1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
		$("#btnRegister").click(function(){
			location.href = "hotelRegister";
		})	
	})
</script>

<%@ include file="../../include/footer.jsp"%>