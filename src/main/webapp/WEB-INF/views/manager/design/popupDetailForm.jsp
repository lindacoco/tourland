<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  #previewDiv{
    height: 500px;
  }
  .previewImg{
    width: 500px;
    height: 500px;
  }
  #checkPicImg{
     width: 500px;
    height: 500px;
  
  }
  
  
    [type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
	}
  	[type="date"]::-webkit-inner-spin-button {
		display: none;
	}

	[type="date"]::-webkit-calendar-picker-indicator {
		opacity: 0;
	}
</style>
<script>
	$(function(){

	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">팝업 상세조회</h3>
				</div>
				<form role="form" action="popupUpdate" method="post" enctype="multipart/form-data" id="popupForm">
					<div class="box-body">
						<div class="form-group">
							<label>팝업 번호</label>
							<input type="hidden" name="no" class="form-control" value="${popupVO.no }" readonly="readonly" style="width:200px;">
							 <br><span style="margin-left:10px;">${popupVO.no}</span>
						</div>
						<div class="form-group">
							<label>팝업 타이틀</label>
							<input type="text" name="title" class="form-control" style="width:70%;" value="${popupVO.title}">
						</div>
						<div class="form-group">
							<label>팝업 내용</label>
							<textarea rows="15" cols="30" placeholder="내용을 입력하세요" name="content" class="form-control" required="required" style="width:70%;">${popupVO.content }</textarea>
						</div>
						<div class="form-group">
							<label>시작 날짜</label>
							<input type="date" name="startdate" class="form-control" style="width:200px;" value="<fmt:formatDate value='${popupVO.startdate }' pattern='YYYY-MM-dd'/>">
						</div>
						<div class="form-group">
							<label>종료 날짜</label>
							<input type="date" name="enddate" class="form-control" style="width:200px;" value="<fmt:formatDate value='${popupVO.enddate }' pattern='YYYY-MM-dd'/>">
						</div>
						
						 <p>기존사진</p>
						<div class="form-group" id="checkPic">
						    <input type="hidden" value="${popupVO.pic }" name="pic">
							<img src="displayFile/popup?filename=${popupVO.pic }" id="checkPicImg">
						</div>
						<div class="form-group">
							<label>사진</label>
							<input type="file" name="popupPic" id="file" required="required">
						</div>
						<p>수정될 사진</p>
						<div class="form-group" id="previewDiv">
						    
                            
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-primary" style="background:red;" id="btnDel">삭제</button>
						    <button type="button" class="btn btn-primary" id="btnReturnToList">목록으로</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
      $("#file").change(function(){
    	 // var file = $(this)[0]; //$(this)[0] : javascript객체를 의미  제이쿼리의 0번째 정보는 자바스크립트가 가지고 있음
    	 
  
    	  console.log(file); 
    	  //파일 정보를 끄집어 내자 
    	  var file = $(this)[0].files[0]; //files가 배열이라 0을 넣어줌 배너 등록 페이지에서 필요한 건 단일 파일이기 때문 
    	  console.log(file); 
    	
    	  var reader = new FileReader();
    	  reader.readAsDataURL(file);
    	  reader.onload = function(e){ //.addEventListener("load",function(){}) - 여러개 이벤트를 넣을 수 있음 
    		  var $img = $("<img class='previewImg'>").attr("src",e.target.result); // == reader.result 같은 값이 넘어온다 
    		  $("#previewDiv").html($img);
    	  }
      })
      
        //리스트로 버튼 눌렀을 때 리스트로 돌아가기 
		$("#btnReturnToList").click(function(){
			location.href="${pageContext.request.contextPath}/popupMngList";
		})
		
		 //삭제 누르면 삭제 되기
	   $("button#btnDel").click(function(){
		   var popupno = ${popupVO.no };
		   var cc = confirm("삭제하시겠습니까?");
		   if(cc){
		   location.href="${pageContext.request.contextPath }/removePopup?no="+popupno+"&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		   }
	   })
   
  </script>
<%@ include file="../../include/footer.jsp"%>