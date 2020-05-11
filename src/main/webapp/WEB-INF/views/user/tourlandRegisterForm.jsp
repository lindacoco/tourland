<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	/* 본문 */
	
	section div#editProfile { width:1000px; height: 100%; 
							  margin-left: 300px;
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
	section div#editProfile p { height: 80px; }
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
	 label {
    float: left;
    width: 150px;
    margin-left:20px;
  }
  span.errorMsg{
     color: tomato;
     margin-left:140px;
     font-size: smaller;
     display: none;
  }					  				  		
</style>

<body>
	<%@ include file="../include/userHeader.jsp"%>		
	<script>
 
	var userno = ${userVO.userno };

    var didUcheckId = false;
    var validId = true;
    

	$(function(){

		$("#regForm input").change(function(){
			$(".errorMsg").css("display", "none");
		})
		
		$("form").submit(function(e){
			$(this).attr("onsubmit","");
			$(".errorMsg").css("display", "none");
		    var username = $("input[name='username']").val();
			var userbirth = $("input[name='userbirth']").val();
			var usertel = $("input[name='usertel']").val();
			var useraddr = $("input[name='useraddr']").val();
			var userauth = $("input[name='userauth']").val();
			var userid = $("input[name='userid']").val();
			var userpass = $("input[name='userpass']").val();
			var userpass2 = $("input[name='userpass2']").val();
			var forCheckId = $("#forCheckId").val(); 
			//이름 정규표현식
			var nameReg = /^[가-힣]{2,5}$/; //네임은 2-5 한글
			if (nameReg.test(username) == false) {
				$("input[name='username']").next().next().css("display", "inline");
				  return false;
			  }
			//생년월일정규표현식
			var birthReg = /^(1|2)[0-9]{3}-(01|02|03|04|05|06|07|08|09|10|11|12)-(01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)$/; 
			if (birthReg.test(userbirth) == false) {
				$("input[name='userbirth']").next().next().css("display", "inline");
				  return false;
			  }
			//전화번호 정규 표현식
			var phoneReg = /^(010|011|019|018|017)-[0-9]{3,4}-[0-9]{4}$/; 
			if (phoneReg.test(usertel) == false) {
				$("input[name='usertel']").next().next().css("display", "inline");
				  return false;
			  }

			
		    //사원 아이디 정규 표현식, 회원 아이디 규칙과 동일
		    var idReg = /^[a-z0-9]{5,12}$/i; //영어, 숫자 5-15
		    if (idReg.test(userid) == false) {
				$("input[name='userid']").next().next().css("display", "inline");
				  return false;
			  }
		   
		    //사원 비밀번호 정규 표현식, 회원 비밀번호 규칙과 동일함
		    var pwdReg = /^[a-zA-Z0-9!@#%^&*]{4,15}/;
			 if(pwdReg.test(userpass) == false){
				 $("input[name='userpass']").next().css("display","inline");
				 return false;
		     }else if(userpass != userpass2){
		    	 $("input[name='userpass']").next().next().css("display","inline");
		    	 return false;
		     }
			 
			 if(forCheckId =="exist"){
				 return false;
			 }
			 
			 if(didUcheckId == false){
				 alert("아이디 중복 체크 해주세요");
				 return false;
			 }
			 
			 if(validId == false){
				 return false;
			 }

		})
		
		$("#userpassword").change(function(){
			$(".errorMsg").css("display", "none");
			 //사원 비밀번호 정규 표현식, 회원 비밀번호 규칙과 동일함
		    var pwdReg = /^[a-zA-Z0-9!@#%^&*]{4,15}/;
			 if(pwdReg.test($(this).val()) == false){
				 $("input[name='userpass']").next().css("display","inline");
		     }
		})
		
		$("#userpassword2").change(function(){
			$(".errorMsg").css("display", "none");
			var userpass = $("input[name='userpass']").val();
			if(userpass != $(this).val()){
		    	 $("input[name='userpass2']").next().next().next().next().css("display","inline");
			}
		})
		
		$("#userId").change(function(){
			$(".errorMsg").css("display", "none");
			var idReg = /^[a-z0-9]{5,12}$/i; //영어, 숫자 5-15
		    if (idReg.test($(this).val()) == false) {
				$("input[name='userid']").next().next().css("display", "inline");
				  return false;
			  }
		})
		
		$("#btnCheck").click(function(){
			$(".errorMsg").css("display", "none");
			var empid = $("input[name='userid']").val();
			 //아이디 중복 ajax로 처리하기
			 $.ajax({
				url:"idCheck/"+empid,  //이 커맨드에서 유저아이디와 사원 아이디를 모두 호가인하기에 
				type:"get",
				dataType:"text",
				success:function(res){
					console.log(res);
					didUcheckId = true;
					if(res=="exist"){
						$("input[name='userid']").next().next().next().css("display", "inline");
						validId = false;
					}else{
						$("input[name='userid']").next().next().next().next().css("display", "inline");
					}
				}
				 
		    })
			
		})
		
		 //리스트로 버튼 눌렀을 때 리스트로 돌아가기 
		$("#btnReturnToList").click(function(){
			location.href="${pageContext.request.contextPath}/userMngList/0";
		})
		
		//아이디 입력값이 달라질 때 마다 아이디 체크 여부를 초기화 
		$("#userId").change(function(){
			didUcheckId = false;
		    validId = true;
		})
		
		$("#btnRegisterCancel").click(function(){
			location.href="${pageContext.request.contextPath}/tourlandMain";
		})
		
	})
	
</script>
			<section>
				<div id="editProfile">
				<h1>투어랜드 회원가입</h1>
				<span id="info">투어랜드는 고객님의 개인정보가 외부로 노출되지 않도록 항상 노력하고 있습니다.</span>
					<form action="tourlandRegister" method="post" id="regForm">
						<p>
							<input type="hidden" value="${autoNo }" name="userno">
						</p>
						<p>
							<label>고객 아이디</label> 
							<input type="text" name="userid" required="required"  placeholder=" 영문,숫자 포함 5-12자리" id="userId">
							<button id="btnCheck" type="button">중복확인</button>
							<span class="errorMsg">영문, 숫자 포함 5-12자리를 넣어주세요</span>
							<span class="errorMsg">중복되는 아이디 입니다. 다른 아이디를 입력해주세요.</span>
							<span class="errorMsg">사용 가능한 아이디입니다.</span>
						</p>
						<p>
							<label>비밀번호</label>
							<input type="text" name="userpass" placeholder=" 영문, 숫자 포함 5-12자리" required="required" id="userpassword" >
							<span class="errorMsg">영문, 숫자 포함 5-12자리를 넣어주세요</span>
						</p>
						<p>
							<label>비밀번호 확인</label>
							<input type="text" name="userpass2" required="required" id="userpassword2" ><br>
							<span class="errorMsg">영문, 숫자 포함 5-12자리를 넣어주세요</span><br>
							<span class="errorMsg">비밀번호가 일치하지 않습니다.</span>
						</p>
						<p>
							<label>고객 이름</label>
							<input type="text" name="username" required="required" placeholder=" 한글 2-5자리" required="required" ><br>
							<span class="errorMsg">이름을 한글 2자리에서 5자리로 입력해주세요.</span>
						</p>
						<p>
							<label>생년월일</label>
							<input type="text" name="userbirth" required="required"  placeholder=" 2000-02-02" required="required"  ><br>
							<span class="errorMsg">생년월일 형식에 맞게 넣어주세요. 예시: 2000-02-02</span>
						</p>
						<p>
							<label>주소</label>
							<input type="text" name="useraddr" required="required" required="required" >
						</p>
						<p>
							<label>전화번호</label>
							<input type="text" name="usertel" required="required"  placeholder=" 예) 010-4334-4321" required="required" ><br>
							<span class="errorMsg">형식에 맞게 넣어주세요 예시: 010-4334-4321</span>
						</p>
						<!-- <p>	
							<label><span class="red">* </span>여권번호</label>
							<input type="text" name="passport" value="M70689098">
						</p> -->
						<!-- <p id="btns">
							<button  style="cursor:pointer">아이디/비밀번호 변경</button>
							<button id="withdraw"  style="cursor:pointer">투어랜드 탈퇴</button>
						</p> -->
						
						<p id="inputs">
							<input type="submit" id="submit" value="가입하기"  style="cursor:pointer">
							<input type="button" id="btnRegisterCancel" value="취소"  style="cursor:pointer">
						</p>
					</form>
				</div>
			</section>
				<%@ include file="../include/userFooter.jsp"%>