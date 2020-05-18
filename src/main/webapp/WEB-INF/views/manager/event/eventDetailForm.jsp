<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  #previewDiv{
    height: 500px;
  }
  .previewImg{
    width: 400px;
    height: 400px;
  }
</style>
<script>
	$(function(){
		CKEDITOR.replace('content',{filebrowserUploadUrl:'${pageContext.request.contextPath}/manager/imageUpload'});
		CKEDITOR.config.width = '77em';
		CKEDITOR.config.height = '50em';
		
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">이벤트 조회</h3>
				</div>
				<form role="form" action="eventUpdate" method="post" enctype="multipart/form-data" id="bannerForm">
					<div class="box-body">
						<div class="form-group">
							<label>이벤트 번호</label>
							<input type="hidden" name ="no" value="${eventVO.no}">
							<input type="hidden" name ="pic" value="${eventVO.pic}">
							<p>${eventVO.no }</p>
						</div>
						<div class="form-group">
							<label>이벤트 타이틀</label>
							<input type="text" name="title" class="form-control" value="${eventVO.title }" style="width:1080px;">
						</div>
						<div class="form-group">
							<label>이벤트 설명(내용)</label>
						    <textarea name="content" rows="80" id="detail">${eventVO.content}</textarea>
						</div>
						<div class="form-group">
							<label>시작 날짜</label>
							<input type="date" name="startdate" class="form-control" style="width:200px;" value="<fmt:formatDate value='${eventVO.startdate}' pattern="yyyy-MM-dd"/>" required="required">
						</div>
						<div class="form-group">
							<label>종료 날짜</label>
							<input type="date" name="enddate" class="form-control" style="width:200px;" required="required" value="<fmt:formatDate value='${eventVO.enddate}' pattern="yyyy-MM-dd"/>">
						</div>
						<div class="form-group">
							<label>저장된 사진</label>
							<div>
							    <img src="displayFile/event?filename=${eventVO.pic }" style= "width:400px; height:400px;">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label>수정할 사진</label>
							<input type="file" name="eventPic" id="file">
						</div>
						<div class="form-group" id="previewDiv">
							
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							 <button type="button" class="btn btn-primary" style="background:red;" id="btnDel">삭제</button><br>
							 <button type="button" class="btn btn-primary" id="btnReturnToList" style="margin-top:10px;">목록으로</button>
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
    	  var file = $(this)[0].files[0]; //files가 배열이라 0을 넣어줌
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
			location.href="${pageContext.request.contextPath}/manager/eventMngList";
		})
		
	   //삭제 누르면 삭제 되기
	   $("button#btnDel").click(function(){
		   var bannerno = ${eventVO.no };
		   var cc = confirm("삭제하시겠습니까?");
		   if(cc){
		   location.href="${pageContext.request.contextPath }/manager/removeEvent?no="+bannerno+"&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		   }
	   })
	   
   
  </script>
<%@ include file="../../include/footer.jsp"%>