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

#editor {
	margin-top: 20px;
	float: right;
}
</style>
<script type="text/javascript" src="plugins/ckeditor/ckeditor.js">
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-primary">
					<div class="box-header">
						<h2>상품 추가</h2>
					</div>
					<p id="guide">아래의 폼을 작성하고 등록 버튼을 클릭하세요.</p>
					<form class="form-inline" action="/action_page.php">
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>항공</label>
								<div class="container">
									<button type="button" class="btn btn-primary">항공편 추가</button>
									<p class="result"></p>
									<!-- <select class="form-control" id="sel1">
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
				    <option>KA301 ICN/CJU 4/1 09:00AM-10:15AM (E)</option>
  					</select> -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>호텔</label>
								<div class="container">
									<div class="dropdown">
										<button type="button" class="btn btn-primary">호텔 추가</button>
										<p class="result"></p>
										<!-- <select class="form-control" id="sel1">
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
						    <option>Hidden Cliff 4/1 - 4/3 Normal</option>
  							</select> -->
									</div>
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>현지 투어</label>
								<div class="container">
									<button type="button" class="btn btn-primary">현지투어 추가</button>
									<p class="result"></p>
									<!-- <select class="form-control" id="sel1">
							    <option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							    <option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							  	<option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
							   	<option>도쿄에서 한적한 공원을 찾고 있다면, 우에노 공원 4/10</option>
  							</select> -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>렌트카</label>
								<div class="container">
									<button type="button" class="btn btn-primary">렌트카 추가</button>
									<p class="result"></p>
									<!-- <select class="form-control" id="sel1">
								    <option>경차 4/1-4/3</option>
								     <option>경차 4/1-4/3</option>
								  	 <option>경차 4/1-4/3</option>
								   <option>경차 4/1-4/3</option>
	  							</select>  -->
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label>상품 번호</label> <input type="text" class="form-control">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 이름</label> <input
									type="text" class="form-control">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 설명</label>
								<div class="container">
									<button type="button" class="btn btn-primary">상품설명 추가</button>
									<p class="result"></p>
								</div>
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<label><span class="red">*</span>상품 가격</label> <input
									type="text" class="form-control">
							</div>
							<div class="form-group">
								<label><span class="red">*</span>상품 유효기간</label> <input
									type="text" class="form-control">
							</div>
						</div>
						<div class="group">
							<div class="form-group">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../../include/footer.jsp"%>