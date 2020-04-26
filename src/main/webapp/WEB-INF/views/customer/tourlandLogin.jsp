<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	* { margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
	body { background-image: url("images/flight.jpg");}
	#loginBox { width: 500px; height: 300px;
			    background: rgba(255,255,255, 0.3);
			    margin: 300px auto; 
			    padding-top: 30px;
			    border-radius: 10px; }
	#loginBox form { width: 400px; height: 250px;
					 margin: 0 auto;}
	#loginBox h1 { height: 70px;
				   font-weight: bold;
				   font-family: 'Black Han Sans', sans-serif;
				   font-size: 40px; 
				   color: #cc3700;}
	#loginBox p { height: 60px; }		    
	#loginBox label { width: 120px; float: left;
					  font-weight: bold;}
	#loginBox .fInput { width: 250px; height: 30px;
					    border: none;
					    border-bottom: 1px solid #929292; 
					    background:none;
					      }
	#loginBox #btns { text-align: center;}					      
	#loginBox #btns input { width: 150px;
							height: 30px;  
							border: none;
							background: #a0a0a0;
							margin: 20px; 
							font-weight: bold; }
</style>
<body>
	<div id="loginBox">
		<form>
			<h1>투어랜드</h1>
			<p>
				<label>아이디</label>
				<input type="text" name="id" id="userid" class="fInput" placeholder="아이디를 입력하세요.">
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password" id="pw" class="fInput"  placeholder="비밀번호를 입력하세요.">
			</p>
			<p id="btns">
				<input type="submit" value="로그인">
				<input type="reset" value="취소">
			</p>
		</form>
	</div>
</body>
</html>