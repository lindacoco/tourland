<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
/* 본문 */
section div#editProfile {
	width: 1000px;
	height: 100%;
	margin-left: 200px;
}

section div#editProfile h1 {
	width: 200px;
	height: 30px;
	padding: 20px;
	border-bottom: 1px solid #929292;
}

section div#editProfile form {
	width: 500px;
    margin: 0 auto;
    padding-top: 81px;
    position: relative;
}

section div#editProfile label {
    width: 75px;
    float: left;
    font-weight: bold;
}

section div#editProfile p {
	height: 60px;
}

section div#editProfile input {
	width: 250px;
	height: 30px;
	border: none;
	border-bottom: 1px solid #929292;
}

section div#editProfile #btns button {
	width: 145px;
    height: 35px;
    border: none;
    position: absolute;
    top: 172px;
    left: 87px;
}

section div#editProfile #withdraw {
	background: maroon;
	color: #fff;
}

#info {
	font-size: 13px;
	color: #929292;
	margin-left: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	<section>
		<%@ include file="../../include/userMyPageMenu.jsp"%>
		<div id="editProfile">
			<h1>내 정보 수정</h1>
			<span id="info">투어랜드는 고객님의 개인정보가 외부로 노출되지 않도록 항상 노력하고 있습니다.</span>
			<form action="editProfile" method="post">

				<p>
					<label>비밀번호</label> <input type="password" name="userpass" placeholder="비밀번호를 재입력해주세요.">
				</p>

				<p id="btns">
					<button type="button" id="withdraw" style="cursor: pointer">입력</button>
				</p>
			</form>
		</div>
	</section>
<%@ include file="../../include/userFooter.jsp"%>