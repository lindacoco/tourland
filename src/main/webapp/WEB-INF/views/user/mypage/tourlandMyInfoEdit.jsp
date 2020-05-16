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
	padding-top: 50px;
}

section div#editProfile label {
	width: 120px;
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

.red {
	color: red;
}

section div#editProfile #btns button {
	width: 200px;
	height: 30px;
	border: none;
}

section div#editProfile #withdraw {
	background: maroon;
	color: #fff;
}

section div#editProfile #btns input {
	width: 200px;
	height: 30px;
	border: none;
}

#btns input#submit {
	background: steelblue;
	color: #fff;
}

#info {
	font-size: 13px;
	color: #929292;
	margin-left: 10px;
}
</style>
<script>
	$(function(){
		$("#withdraw").click(function(){
			var userid="${Auth.userid}";
			var empid="${Auth.empid}";
			if(userid!=null && empid==null){
				var id = "${Auth.userid}";
				var res = confirm("정말로 탈퇴하시겠습니까?");
				if(res){
					location.href="${pageContext.request.contextPath}/logoutWithdrawal?id="+id;
					alert("탈퇴되었습니다.");
				}
			}
			
		})
		
		$("#submit").click(function(){
			$("form").submit(function(e){
				
			})
		})
	})
</script>
<body>
	<%@ include file="../../include/userHeader.jsp"%>
	<section>
		<%@ include file="../../include/userMyPageMenu.jsp"%>
		<div id="editProfile">
			<h1>내 정보 수정</h1>
			<span id="info">투어랜드는 고객님의 개인정보가 외부로 노출되지 않도록 항상 노력하고 있습니다.</span>
			<form action="editProfile" method="post">
				<c:choose>
					<c:when test="${Auth.userid!=null }">
						<p>
							<label>아이디</label><input type="text" value="${Auth.userid }" name="userid" readonly="readonly">
						</p>
						<p>
							<label>비밀번호</label> <input type="password" name="userpass" value="${pass}">
						</p>
						<p>
							<label>이름</label> <input type="text" name="username" value="${Auth.username}" readonly="readonly">
						</p>
						<p>
							<label>생년월일</label> <input type="text" name="userbirth" value=<fmt:formatDate value="${Auth.userbirth}" pattern="yyyy-MM-dd"/> >
						</p>
						<p>
							<label>주소</label> <input type="text" name="useraddr" value="${Auth.useraddr }">
						</p>
						<p>
							<label>전화번호</label> <input type="text" name="usertel" value="${Auth.usertel }">
						</p>
						<p>
							<label><span class="red">* </span>여권번호</label> <input type="text" name="userpassport" value="${Auth.userpassport }">
						</p>
						<p id="btns">
							<input type="submit" id="submit" value="수정" style="cursor: pointer">
							<button type="button" id="withdraw" style="cursor: pointer">투어랜드 탈퇴</button>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<label>아이디</label><input type="text" value="${Auth.empid }" name="empid" readonly="readonly">
						</p>
						<p>
							<label>비밀번호</label> <input type="password" name="emppass" value="${pass}">
						</p>
						<p>
							<label>이름</label> <input type="text" name="empname" value="${Auth.empname}" readonly="readonly">
						</p>
						<p>
							<label>생년월일</label> <input type="text" name="empbirth" value=<fmt:formatDate value="${Auth.empbirth}" pattern="yyyy-MM-dd"/> >
						</p>
						<p>
							<label>주소</label> <input type="text" name="empaddr" value="${Auth.empaddr }">
						</p>
						<p>
							<label>전화번호</label> <input type="text" name="emptel" value="${Auth.emptel }">
						</p>
						<p id="btns">
							<input type="submit" id="submit" value="수정" style="cursor: pointer">
						</p>
					</c:otherwise>
				</c:choose>

			</form>
		</div>
	</section>
	<%@ include file="../../include/userFooter.jsp"%>