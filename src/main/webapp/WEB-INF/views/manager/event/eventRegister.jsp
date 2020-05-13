<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  #previewDiv{
    height: 350px;
  }
  .previewImg{
    width: 300px;
    height: 300px;
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
		CKEDITOR.replace('content');
		CKEDITOR.config.width = '90em';
		CKEDITOR.config.height = '50em';
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
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">이벤트 등록</h3>
				</div>
				<form role="form" action="eventRegister" method="post" enctype="multipart/form-data" id="popupForm">
					<div class="box-body">
						<div class="form-group">
							<label>이벤트 번호</label>
							<input type="hidden" name="no" class="form-control" value="${autoNo }" readonly="readonly" style="width:200px;">
							 <br><span style="margin-left:10px;">${autoNo }</span>
						</div>
						<div class="form-group">
							<label>이벤트 타이틀</label>
							<input type="text" name="title" class="form-control" style="width:1080px;">
						</div>
							<!-- ckeditor -->
						<div class="form-group">
							<label>이벤트 내용</label>
						    <textarea name="content" rows="80" id="detail"></textarea>
						</div>
						<div class="form-group">
							<label>시작 날짜</label>
							<input type="date" name="startdate" class="form-control" style="width:200px;" required="required">
						</div>
						<div class="form-group">
							<label>종료 날짜</label>
							<input type="date" name="enddate" class="form-control" style="width:200px;" required="required">
						</div>
						<div class="form-group">
							<label>메인 사진</label>
							<input type="file" name="eventPic" id="file" required="required">
						</div>
						<div class="form-group" id="previewDiv">
							
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">등록</button>
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
			location.href="${pageContext.request.contextPath}/eventMngList";
		})
   
  </script>
<%@ include file="../../include/footer.jsp"%>