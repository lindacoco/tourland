<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/userHeader.jsp"%>
</head>
<style>    
	/* 본문 */
	section#agreeSection { width: 1200px; height: 2000px; margin: 0 auto;}
	section nav { width: 200px; 
				  background: #f4f4f4;
				  height: 100%;
				  float: left; }			  
	section nav ul li { height: 30px; 
						padding: 10px; }							
	section nav ul li a { display: block;
						  text-indent: 10px; 
						  line-height: 30px; }
	section nav ul li:hover { background: #ff7f00; }						  				  	
	
	section div#myreserv { width:1000px; height: 1000px; 
							  margin-left: 200px;
							 }
	div#mapHeaderWrap {   margin-bottom: 50px; }							 							 	
	section div#myreserv h1 { width: 200px;
								 height: 30px;  
							     padding: 20px;
							     border-bottom: 1px solid #929292; }							  
	#info { font-size: 13px; color: #929292;   
			margin-left: 10px;  }	  
	div#mapImgBox { width: 400px; height: 600px; float: left; margin-left: 40px;  }
	div#mapImgBox img { width: 100%; height: 400px;  }	
	div#mapInfoBox { width: 500px; height: 500px; overflow: hidden; float: left; }
	div#mapInfoBox p {  height: 60px;}			    
	#mapTitle { font-size: 30px; font-weight: bold;text-indent: 20px;}
	#mapAddr { font-size: 17px; text-indent: 50px;}
	#mapBtnBox {  }	
	#mapBtnBox a { text-decoration:none;
				   display:block;
				   width: 150px; height: 30px;
				    border: none; background: #ededed;
				     text-align: center; 
				     margin-left: 50px; }	
	.red { color: maroon; }
	.blue { color: steelblue; }
	.green { color: forestgreen; }
	.yel { color: goldenrod; }	
	
	
	section nav ul li:nth-child(3) {
	 background: mistyrose;
   }	    
    #agreementBox{
      margin-left:40px;
      width:100%;
      height: 100%;
    }
    #agreementBox ul{
      margin-bottom: 20px;
    } 
   #agreementBox ul li{
      margin-left:35px;
      display: list-item;
   }
   span.needBlank{
      margin-left:15px;
   }
</style>
<body>   
	
		<section id="agreeSection">
		<%@ include file="../../include/userFooterMenu.jsp"%>   
				<div id="myreserv">
					<div id="mapHeaderWrap">
						<h1>이용약관</h1>
						<span id="info">상세항목을 확인해주세요</span>
					</div>
					<div id="agreementBox">
					  <p style="display: none">땡처리 닷컴의 이용약관을 참조하였습니다.</p>
					<ul><h4>제1조 (목적)</h4>
					  <li> 이 약관은 (주)투어랜드가 운영하는 인터넷쇼핑몰(이하 "회사"라 한다)에서 제공하는 인터넷관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.</li>
					</ul>
					<ul><h4>제2조(정의)</h4>
					    <li>①"회사" 란 투어랜드가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터등정보통신 설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 인터넷쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.</li>
					    <li>②"이용자"란 "회사"에 접속하여 이 약관에 따라 "회사"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
					    <li>③'회원'이라 함은 "회사"에 개인정보를 제공하여 회원등록을 한 자로서, "회사"의 정보를 지속적으로 제공받으며, "회사" 이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
					    <li>④'비회원'이라 함은 회원에 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.</li>
					</ul>
					<ul><h4>제3조 (약관 등의 명시와 설명 및 개정)</h4>
					     <li>①"회사"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호,팩스번호,전자우편 주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 인터넷쇼핑몰의 초기 서비스화면(전면)에 게시합니다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
					    <li>② "회사"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회,배송책임,환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li>
					    <li>③ "회사"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
					    <li>④ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 인터넷쇼핑몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "회사"는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li>
					</ul>
					<ul><h4>제4조(서비스의 제공 및 변경)</h4>
					     <li> ① "회사"는 다음과 같은 업무를 수행합니다.<br>
                            <span class="needBlank"></span> 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 <br>
                            <span class="needBlank"></span>2. 구매계약이 체결된 재화 또는 용역의 배송<br>
                            <span class="needBlank"></span>3. 기타 "회사"가 정하는 업무</li>
					    <li>②"회사"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
					    <li>③ "회사"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</li>
					    <li>④ 전항의 경우 "회사"는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "회사"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
					</ul>
					<ul><h4>제5조(서비스의 중단)</h4>
					     <li>① "회사"는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
					    <li>② "회사"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "회사"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
					    <li>③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "회사"는 제8조에 정한 방법으로 이용자에게 통지하고 당초 "회사"에서 제시한 조건에 따라 소비자에게 보상합니다.</li>
					</ul>
					<ul><h4>제6조(회원가입)</h4>
					     <li>① 이용자는 "회사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li>
					    <li>② "회사"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<br>
							<span class="needBlank"></span>1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "회사"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
							<span class="needBlank"></span>2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
							<span class="needBlank"></span>3. 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우</li>
					    <li>③ 회원가입계약의 성립시기는 "회사"의 승낙이 회원에게 도달한 시점으로 합니다.</li>
					    <li>④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.</li>
					</ul>
					<ul><h4>제7조(회원에 대한 통지)</h4>
					      <li>① 회원은 "회사"에 언제든지 탈퇴를 요청할 수 있으며 "회사"는 즉시 회원탈퇴를 처리합니다.</li>
					    <li>② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.<br>
				<span class="needBlank"></span>1. 가입 신청시에 허위 내용을 등록한 경우<br>
				<span class="needBlank"></span>2. "회사"를 이용하여 구입한 재화등의 대금, 기타 "회사"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
				<span class="needBlank"></span>3. 다른 사람의 "회사" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>
				<span class="needBlank"></span>4. "회사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
					    <li>③ "회사"가 회원 자격을 제한,정지시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 "회사"는 회원자격을 상실시킬 수 있습니다.</li>
					    <li>④ "회사"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li>
					</ul>
					<ul><h4>제8조 (계약의 성립)</h4>
					      <li>① "회사"는 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.</li>
					    <li>② "회사"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 후 계약금이 입금된 시점에 계약이 성립한 것으로 봅니다.</li>
					    <li>③ "회사"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
		               
					</div>
				</div>
		     
		</section>
		
		<%@ include file="../../include/userFooter.jsp"%>
</body>
</html>