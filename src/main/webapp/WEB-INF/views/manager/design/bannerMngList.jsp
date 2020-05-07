<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	/* #opa { width: 100%; height: 100%; background: gray; opacity: 0.2; } */
	
	table .table table-bordered th,td,th{
       text-align: center;
    }
    .bannerList:hover {
    	background-color : lightgrey;
    }
     
    #bannerLeft{
      margin-left:100px;
      float:left;
      text-align:center;
      width:560px;
    }
    
    #bannerRight{
      margin-left:100px;
      float:left;
      text-align:center;
      width:560px;
    }
</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12" style="heigth:800px;">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">배너  관리</h2>
				</div>
				<div class="box-body">
				<!-- 검색 작업에서 유지될 데이터 
					1. 현재 페이지의 번호     
					2. 페이지당 보여지는 데이터의 수
					3. 검색의 종류
					4. 검색의 키워드
				 -->
					<select name="searchType" id="searchType" style="width:200px; height: 25px;">
						<option value="n" ${cri.searchType ==null?'selected':''}>-----</option>
						<option value="bannerTitle" ${cri.searchType =='bannerTitle'?'selected':''}>배너 타이틀</option>
						<option value="bannerContent" ${cri.searchType =='bannerContent'?'selected':''}>배너 설명</option>

					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
					<button id="btnRegister">추가</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width:100px;">배너 번호</th>
							<th>썸네일</th>
							<th style="width:20%">배너명</th>
							<th style="width:40%">배너 설명</th>
					        <th>상세보기</th>
					        <th>배너 미리보기(왼쪽)</th>
					        <th>배너 미리보기(오른쪽)</th>
						</tr>     
						<!-- 반복 돌면서 list가져오기 -->
						<c:forEach var="bannerList" items="${list}">
						    <tr data-click="${bannerList.no }" class="bannerList"> <!-- 전체 줄 클릭했을 때 디테일로 넘어가도록 처리할 data-click 속성 선언 -->
						    <td>${bannerList.no }</td>
						    <td><img src="displayFile?filename=${bannerList.pic }" style="width:100px; height:30px;" ></td>
						    <td>${bannerList.title }</td>
						    <td>${bannerList.content }</td>
						    <td><button style="background:lightskyblue; border:none;" class="toBannerDetail" data-click="${bannerList.no }">상세보기</button></td>
						     <td><input type="checkbox" class="leftBannercheckbox" value="${bannerList.no }" ><button style="margin-left:25px; height: 23px;" class="setLeftBanner" value="${bannerList.no }">설정</button></td>
						     <td><input type="checkbox" class="rightBannercheckbox" value="${bannerList.no }" ><button style="margin-left:25px; height: 23px;" class="setRightBanner" value="${bannerList.no }">설정</button></td>
						    </tr>
						</c:forEach>	
					</table>      
				</div>
		        <div class="box-footer">
	             <%--   --%>
	              <!--  부트 스트랩으로 사용  -->
	              <div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/bannerMngList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/bannerMngList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/bannerMngList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	               </div>
	               <div class="box-body" id="mainBannerPreview" >
	                   <!-- 배너 미리보기 -->
	                    <div id="bannerLeft" style=" margin-left:10%;">
	                        <p>Left side</p>
	                        <img src="displayFile?filename=${leftBanner}" style="width:560px; height:200px;" id="bannerLeftImg">
	                   </div>
	                    <div id="bannerRight">
		                   <p>Right side</p>
		                   <img src="displayFile?filename=${rightBanner}" style="width:560px; height:200px;" id="bannerRightImg">
	            		</div>
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
		location.href = "${pageContext.request.contextPath}/bannerMngList?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 
		
	})
	
	$("#btnRegister").click(function(){
		location.href = "${pageContext.request.contextPath}/bannerRegister";
	})
	
	//각 리스트를 클릭했을 때 디테일로 넘어가는 부분
/* 	$(".bannerList").click(function(){
		var no = $(this).attr("data-click");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "${pageContext.request.contextPath}/bannerDetailForm?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
		
	}) */
	
	$(".toBannerDetail").click(function(){
		var no = $(this).attr("data-click");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "${pageContext.request.contextPath}/bannerDetailForm?no="+no+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
	})
	
	//왼쪽체크박스 체크를 하면 
	$(".leftBannercheckbox").change(function(){
		
	
		if($(this).is(":checked")){
		//	$(".leftBannercheckbox").attr("checked",false);
		//	$(this).attr("checked",true);
		   var bannerno = $(this).val();  //alert(bannerno);	
		 //ajax로 이미지 경로 받아오기 
		 $.ajax({
			url:"getPicPath/"+bannerno,
			type:"get",
			dataType:"text",
			success:function(res){
				console.log(res);
				
				if(res != "fail"){
					$("#bannerLeftImg").attr("src","displayFile?filename="+res);
				}
					
				}
			})
		}
	})
	
	//오른쪽체크박스 체크 시
	$(".rightBannercheckbox").change(function(){
		
	
		if($(this).is(":checked")){
		//	$(".leftBannercheckbox").attr("checked",false);
		//	$(this).attr("checked",true);
		   var bannerno = $(this).val();  //alert(bannerno);	
		 //ajax로 이미지 경로 받아오기 
		 $.ajax({
			url:"getPicPath/"+bannerno,
			type:"get",
			dataType:"text",
			success:function(res){
				console.log(res);
				
				if(res != "fail"){
					$("#bannerRightImg").attr("src","displayFile?filename="+res);
				}
					
				}
			})
		}
	})
	
</script>

<%@ include file="../../include/footer.jsp"%>