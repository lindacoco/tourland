<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	/* 본문 */
	
	section div#editProfile { width:1000px; height: 100%; 
							  margin-left: 200px;
							 }
	section div#editProfile h1 { width: 200px;
								 height: 30px;  
							     padding: 20px;
							     border-bottom: 1px solid #929292; }							  
	section div#editProfile form { width: 500px; 
								   margin: 0 auto;
								   padding-top: 50px; }   
	section div#editProfile label { width: 120px;
								    float: left;
								    font-weight: bold;}
	section div#editProfile p { height: 60px; }
	section div#editProfile input { width: 250px; height: 30px; 
									border: none; border-bottom: 1px solid #929292;}
	.red { color: red;}
	section div#editProfile #btns button { width: 200px; height: 30px; 
										   border: none; }

	section div#editProfile #withdraw { background: maroon; color: #fff; }
	
	section div#editProfile #inputs input { width: 200px; height: 30px; 
										    border: none; }
	#inputs input#submit { background: steelblue; color: #fff; }		
	#info { font-size: 13px; color: #929292; 
			margin-left: 10px;  }							  				  		
</style>
<body>
	<%@ include file="../include/userHeader.jsp"%>		
			<section>
				<%@ include file="../include/userMyPageMenu.jsp"%>  
				<div id="editProfile">
				<h1>내 정보 수정</h1>
				<span id="info">투어랜드는 고객님의 개인정보가 외부로 노출되지 않도록 항상 노력하고 있습니다.</span>
					<form>
						<p>
							<label>회원번호</label>
							<span>USER001</span>
						</p>
						<p>
							<label>이름</label>
							<input type="text" name="name" value="김땡땡">
						</p>
						<p>
							<label>생년월일</label>
							<input type="text" name="birth" value="1992/11/21">
						</p>
						<p>
							<label>주소</label>
							<input type="text" name="addr" value="대구시 서구 123">
						</p>
						<p>
							<label>전화번호</label>
							<input type="text" name="tel" value="010-1111-1111">
						</p>
						<p>	
							<label><span class="red">* </span>여권번호</label>
							<input type="text" name="passport" value="M70689098">
						</p>
						<p id="btns">
							<button  style="cursor:pointer">아이디/비밀번호 변경</button>
							<button id="withdraw"  style="cursor:pointer">투어랜드 탈퇴</button>
						</p>
						
						<p id="inputs">
							<input type="submit" id="submit" value="수정"  style="cursor:pointer">
							<input type="reset" value="취소"  style="cursor:pointer">
						</p>
					</form>
				</div>
			</section>
				<%@ include file="../include/userFooter.jsp"%>