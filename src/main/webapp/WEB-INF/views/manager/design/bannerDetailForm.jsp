<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  #previewDiv{
    height: 250px;
  }
  .previewImg{
    width: 560px;
    height: 200px;
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
					<h3 class="box-title">배너 조회</h3>
				</div>
				<form role="form" action="bannerUpdate/${bannerVO.no }" method="post" enctype="multipart/form-data" id="bannerForm">
					<div class="box-body">
						<div class="form-group">
							<label>배너 번호</label>
							<input type="text" name="no" class="form-control" value="${bannerVO.no }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>배너 타이틀</label>
							<input type="text" name="title" class="form-control" value="${bannerVO.title }">
						</div>
						<div class="form-group">
							<label>배너 설명(내용)</label>
							<textarea rows="15" cols="30" placeholder="내용을 입력하세요" name="content" class="form-control" required="required" value="${bannerVO.content}"></textarea>
						</div>
						<div class="form-group">
							<label>사진</label>
							<input type="file" name="pic" id="file">
						</div>
						<div class="form-group" id="previewDiv">
							<img src="${pageContext.request.contextPath }">
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							 <button type="button" class="btn btn-primary" style="background:red;" id="btnDel">삭제</button>
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
   
  </script>
<%@ include file="../../include/footer.jsp"%>