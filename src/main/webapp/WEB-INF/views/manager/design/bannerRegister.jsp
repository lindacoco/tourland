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
		$("#lcate").change(function() {
			$("#mcate").empty();
			var val = $("#lcate option:selected").val();
			switch(val) {
			case "D":
				var option = $("<option value='J'>").html("제주여행");
				$("#mcate").append(option);
				break;
			case "I":
				var option1 = $("<option value='P'>").html("여행상품");
				var option2 = $("<option value='V'>").html("여권 및 비자");
				var option3 = $("<option value='T'>").html("환율");
				var option4 = $("<option value='E'>").html("기타");
				$("#mcate").append(option1).append(option2).append(option3).append(option4);
				break;
			case "R":
				var option1 = $("<option value='B'>").html("예약 및 취소");
				var option2 = $("<option value='R'>").html("결제 및 환불");
				$("#mcate").append(option1).append(option2);
				break;
			case "U":
				var option = $("<option value='C'>").html("쿠폰,이벤트");
				$("#mcate").append(option);
				break;
			}
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">배너 이미지 추가</h3>
				</div>
				<form role="form" action="bannerRegister" method="post" enctype="multipart/form-data" id="bannerForm">
					<div class="box-body">
						<div class="form-group">
							<label>배너 번호</label>
							<input type="text" name="no" class="form-control" value="${autoNo }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>배너 설명(내용)</label>
							<textarea rows="15" cols="30" placeholder="내용을 입력하세요" name="content" class="form-control" required="required"></textarea>
						</div>
						<div class="form-group">
							<label>사진</label>
							<input type="file" name="pic" id="file">
						</div>
						<div class="form-group" id="previewDiv">
							
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">등록</button>
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