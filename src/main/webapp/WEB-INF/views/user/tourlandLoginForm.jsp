<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 본문 */
section {
	width: 800px;
	height: 500px;
	margin: 50px auto;
}

#loginHead {
	height: 80px;
	border-bottom: 2px solid #ff7f00;
}

#loginBox {
	width: 600px;
	height: 300px;
	border: 1px solid gainsboro;
	border-radius: 10px;
	margin: 50px auto; /* background: gray; */
}

#loginBox h2 {
	height: 50px;
	padding: 30px 30px 10px 30px;
}

#loginInnerBox {
	width: 450px;
	height: 100px;
	margin: 0 auto;
	padding-left: 80px;
	position: relative;
}

#inputBox {
	width: 250px;
	height: 100px;
	float: left;
}

#inputBox input {
	border: none;
	border-bottom: 1px solid gray;
	width: 200px;
	height: 30px;
}

#submitBox {
	width: 200px;
	height: 100px;
	float: right;
}

#submitBox input {
	width: 100px;
	height: 63px;
	border: none;
	background: goldenrod;
}

#loginBtns {
	width: 500px;
	height: 50px;
	text-align: center;
	padding-left: 50px;
}

#loginBtns button {
	width: 150px;
	height: 30px;
	border: none;
	background: gray;
	color: #fff;
}

#loginAPI {
	width: 500px;
	height: 50px;
	text-align: center;
	padding-left: 50px;
}

#loginAPI button {
	width: 200px;
	height: 30px;
	border: none;
}

#loginAPI #naver span {
	color: #228b22;
	font-weight: bold;
}

#loginAPI #kakao span {
	color: goldenrod;
	font-weight: bold;
}
.error{
    color: red;
    position: absolute;
    top: 62px;
}
</style>
<body>
	<%@ include file="../include/userHeader.jsp"%>
	<section>
		<div id="loginHead">
			<h1>로그인</h1>
			<p>새로운 세상, 투어랜드</p>
		</div>
		<div id="loginBox">
			<form action="loginForm" method="post">
			<c:if test="${registerSuccess !=null}">
			    <h2>가입 완료 되었습니다. 로그인 수행하여 주십시오.</h2>
			</c:if>
			<c:if test="${registerSuccess ==null}">
			   <h2>투어랜드</h2>
			</c:if>
					<div id="loginInnerBox">
						<div id="inputBox">
						<c:choose>
							<c:when test="${UserStay!=null}">
								<input type="text" name="id" id="id" placeholder="아이디" value="${UserStay.userid}"> 
								<input type="password" name="pass" id="pass" placeholder="비밀번호" value="${UserStay.userpass}">
							</c:when>
							<c:when test="${EmpStay!=null}">
								<input type="text" name="id" id="id" placeholder="아이디" value="${EmpStay.empid }"> 
								<input type="password" name="pass" id="pass" placeholder="비밀번호" value="${EmpStay.emppass}">
							</c:when>
							<c:otherwise>
								<input type="text" name="id" id="id" placeholder="아이디"> 
								<input type="password" name="pass" id="pass" placeholder="비밀번호">
							</c:otherwise>
						</c:choose>
						</div>
						<div id="submitBox">
							<input type="submit" value="로그인" style="cursor: pointer">
						</div>
						<c:if test="${error!=null }">
							<p class="error">${error }</p>
						</c:if>
					</div>
			</form>
			<div id="loginBtns">
				<button id="join" style="cursor: pointer">회원가입</button>
				<button id="findIDPW" style="cursor: pointer">아이디/비밀번호 찾기</button>
			</div>
			<div id="loginAPI">
				<button id="naver" class="api" style="cursor: pointer">
					<span>NAVER</span> 로그인
				</button>
				<button id="kakao" class="api" style="cursor: pointer">
					<span>kakao</span> 로그인
				</button>
			</div>
		</div>
	</section>
	<%@ include file="../include/userFooter.jsp"%>
</body>
</html>