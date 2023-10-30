<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.example.dto.UserDTO"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카테고리</title>
	<link rel="stylesheet" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" data-n-g />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/cart.css">
	<link href="https://www.flaticon.com/free-icons/tool-tips" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="../resources/css/changeUser.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">	<!-- 폰트어썸 불러오기 -->
	<meta name="viewport" content="width=device-width, user-scalable=no" />										<!-- 반응형 필수 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>					<!-- 제이쿼리 불러오기 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- 사이트 박스 시작 -->
	<section class="site-box min-height-100vh flex flex-column">
	  <!-- 메인 컨텐츠 박스 시작 -->
	  <main class="main-box flex-grow-1 visible-md-up">
	    <section class="main-box-section con">
	      <!-- 회원정보 페이지 시작 -->
	      <div class="section-MyPage min-height-50vh flex flex-jc-c flex-ai-c ">
	        <form name="form" onsubmit="check(this); return false;" action="doModifyInfo" method="POST">
	          <input type="hidden" name="id" value="${loginedMember.id}">
	          <input type="hidden" name="loginPwReal">
	
	          <div class="section-MyPage-body flex flex-jc-c flex-ai-c">
	            <div>MY PAGE</div>
	            <div class="section-MyPage-body__cell">
	            	<div class="MyPage_cell__title">
		                <span>회원이름</span>
		                <div class=MyPage_cell__body>
		                  <input type="text" name="name" value="" id="userName">
		                </div>
	                </div>
	              <div class="MyPage_cell__title">
	                <span>회원ID</span>
	                <div class="MyPage_cell__body">
	                  <span id="userId"></span>
	                </div>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>비밀번호</span>
	                <div class=MyPage_cell__body>
	                  <input type="password" name="loginPw" maxlength="50" placeholder="PW 입력" id="password1">
	                </div>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>비밀번호 체크 </span>
	                <div class=MyPage_cell__body>
	                  <input type="password" name="loginPwConfirm" maxlength="50" placeholder="PW 확인" id="password2">
	                  <input type="button" class="submitModifyBtn btn btn-go" style="width:54px;" onclick="passwordChk()" value="확인">
	                </div>
	              </div>
	              <div class="MyPage_cell__title">
<!-- 	                <span>회원번호</span> -->
<!-- 	                <div class="MyPage_cell__body"> -->
<!-- 	                  <span id="userNo"></span> -->
<!-- 	                </div> -->
					<span>닉네임</span>
	                <div class="MyPage_cell__body">
	                  <input type="text" name="nickname" placeholder="" id="userNickname">
	                  <button class="btn btn-check" name="dupNickCheck" onclick="checkDupNick(this);" type="button"><i class="far fa-check-circle"></i> 중복체크</button>
	                </div>
	              </div>
	            </div>
	
	            <div class="section-MyPage-body__cell">
<!-- 	              <div class="MyPage_cell__title"> -->
<!-- 	                <span>닉네임</span> -->
<!-- 	                <div class="MyPage_cell__body"> -->
<!-- 	                  <input type="text" name="nickname" placeholder="" id="userNickname"> -->
<!-- 	                  <button class="btn btn-check" name="dupNickCheck" onclick="checkDupNick(this);" type="button"><i class="far fa-check-circle"></i> 중복체크</button> -->
<!-- 	                </div> -->
<!-- 	              </div> -->
	              <div class=MyPage_cell__title>
<!-- 	                <span>e-mail</span> -->
<!-- 	                <div class=MyPage_cell__body> -->
<!-- 	                  <input type="email" name="email" value="" id="userEmail"> -->
<!-- 	                </div> -->
					<span>주소 <input type="button" class="submitModifyBtn btn btn-go" style="margin-bottom:13px;" onclick="execDaumPostcode()" value="우편번호 찾기"> </span>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress1" style="width:250px;">
	                </div>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress2" style="width:250px;">
	                </div>
					<div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="post" style="width:250px;">
	                </div>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress3" style="width:250px;" >
	                </div>
	                <span id="guide" style="color:#999"></span>
    				<span id="address_message" style="color:red"></span>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>연락처</span>
	                <div class=MyPage_cell__body>
	                  <input type="text" name="cellphoneNo" value="" id="userPhone" onblur="formatFunction()">
	                </div>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>회원타입</span>
	                <div class=MyPage_cell__body>
	                  <span id="userType"></span>
	                </div>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>회원가입일</span>
	                <div class=MyPage_cell__body>
	                  <span id="userRegdate"></span>
	                </div>
	              </div>
	              <div class="section-MyPage-body__option flex flex-jc-fe flex-ai-fe" style="width: 200px;">
	                <button class="submitModifyBtn btn btn-go" type="button" onclick="changeInfo()" style="margin-right: 100px;"><i class="far fa-edit"></i> 변경</button>
<!-- 	                <button class="cleModifyBtn btn btn-back" type="button" onclick=""><i class="fas fa-undo"></i> 초기화</button> -->
	              </div>
	            </div>
	          </div>
	        </form>
	      </div>
	      <!-- 회원정보 페이지 끝 -->
	    </section>
	  </main>
	  <!-- 메인 컨텐츠 박스 끝 -->
	</section>
	<!-- 사이트 박스 끝 -->
</body>

<script type="text/javascript">

	var sussesChk = true;
	var userInfoNick = "";

	//화면 진입시 호출하는 이벤트 모음
	$(document).ready(function() {
		$(".section-MyPage").css("padding-top","10px");
		//본인 회원정보 조회
		selectMyInfo();
	});
	
	//본인 회원정보 조회
	function selectMyInfo(){
		var url = "getUserInfo";
		var type = "json";
		var param = {};
		var svcId = "getUserInfo";
		callAjax(url, type, param, svcId);
	};
	
	//본인 회원정보 변경
	function changeInfo(){
		var url = "changeInfo";
		var type = "json";
		var param = {};
		var svcId = "changeInfo";
		
		//서비스 호출전 유효성 검사 로직필요
		var chk = userInfoChk();
		if(chk){
			if(confirm('정말 변경하시겠습니까?') == false) {
				return false;
			}
			//변경할 파라미터 설정
			param.userNickname = $("#userNickname").val();
			param.userName = $("#userName").val();
			param.password1 = $("#password1").val();
			param.password2 = $("#password2").val();
			param.userAddress1 = $("#userAddress1").val(); 
			param.userAddress2 = $("#userAddress2").val();
			param.post = $("#post").val();
			param.userAddress3 = $("#userAddress3").val();
			var phone = $("#userPhone").val();
			phone = phone.replaceAll("-","");
			param.userPhone = phone;
			
			//서비스 호출
			callAjax(url, type, param, svcId);
		}
	}

	//유저 전체 유효성 검사
	function userInfoChk(){
		//회원 이름 검사
		var namePattern = /^[가-힣]{2,}$/;
		if($("#userName").val().length==0){
			alert("이름을 입력하세요.");
			return false;
		}else{
			if(!namePattern.test($("#userName").val())){
				alert("이름을 확인해주세요.");
				return false;
			}
		}
		
		//회원 패스워드 검사
		var passChk = passwordChk("Y");
		if(passChk){
			//회원 닉네임 검사
			if($("#userNickname").val().length==0){
				alert("닉네임을 입력하세요.");
				return false;
			}else{
				if($("#userNickname").val().length != 0){
					if(userInfoNick != $("#userNickname").val()){
						var nicknamePattern  = /^[가-힣a-zA-Z0-9]+$/;
						var ForbiddenNickPattern = /^user.*/;
						if(nicknamePattern.test($("#userNickname").val()) && !(ForbiddenNickPattern.test($("#userNickname").val()))){
							$.ajax({
								type : "POST",
								url : "/app/register/add_nicknameCheck",
								dataType : "json",
								data : {
									user_nickname : $("#userNickname").val()
								},
								success : function(rdata, status, xhr) {
									if(!rdata.result){
										alert("중복된 별명입니다.");
										sussesChk = false;
										return false;
									}
								}, 
								error : function(xhr, status, error) {
									console.log("error");
									return false;
								}
							});
						}else if(!nicknamePattern.test($("#userNickname"))){
							alert("별명 입력이 잘못되었습니다. 다시 확인해 주세요. (공백 불가)");
							return false;
						}else if(ForbiddenNickPattern.test(nickname.$("#userNickname"))){
							alert("이 별명은 사용할 수 없습니다.");
							return false;
						}
					}
				}
			}
			
			if(sussesChk){
				//회원 주소검사
				var addr1 = $("#userAddress1").val();
				var addr2 = $("#userAddress2").val();
				var addr3 = $("#post").val();
				var addr4 = $("#userAddress3").val();
				if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 ||addr4.length == 0){
					alert("주소를 입력하세요.");
					return false;
				}
				
				//회원 전화번호 검사
				if($("#userPhone").val().length==0){
					alert("휴대폰 번호를 입력하세요.");
					return false;
				}else{
					var phonePattern = /^01\d{8,9}$/;
					if(phonePattern.test($("#userPhone").val().replaceAll("-",""))){
						$.ajax({
							type : "POST",
							url : "/app/register/add_phoneCheck",
							dataType : "json",
							data : {
								user_phone : $("#userPhone").val()
							},
							success : function(rdata, status, xhr) {
								if(!rdata.result){
									alert("중복된 번호입니다.");
									sussesChk = false;
									return false;
								}
							}, 
							error : function(xhr, status, error) {
								console.log("error");
								return false;
							}
						});
					}else{
						alert("번호 입력이 잘못되었습니다. 다시 확인해 주세요.");
						return false;
					}
					
				}
				return true;
			}
		}else{
			return false;
		}
	}
	
	//회원 패스워드 검사
	function passwordChk(val){
		var p1 = $("#password1").val();
		var p2 = $("#password2").val();
		var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{8,}$/;
		
		if(p1.length==0){
			alert("비밀번호는 필수 입력사항입니다.");
			return false;
		}else{
			if(pwPattern.test(p1)){
				if(p1==p2){
					if(val != "Y"){
						alert("사용 가능한 비밀번호 입니다.");
						return true;
					}else{
						return true;
					}
				}else{
					if(p2.length!=0){
						alert("비밀번호가 일치 하지 않습니다. 다시 확인해 주세요.");
						return false;
					}else{
						alert("비밀번호 확인은 필수 입력사항입니다.");
						return false;
					}
				}
			}else{
				alert("8~20자 영문 대소문자, 숫자, 특수문자를 사용하세요.(공백 불가)");
				return false;
			}
		}
	}
	
	//전화번호 포맷팅
	function formatFunction(){
		var getVal = $("#userPhone").val();
		if(getVal.length < 11){
			alert("전화번호를 다시 입력해 주세요.");
			return false;
		}
		getVal = getVal.replaceAll("-","");
		var fVal = getVal.substr(0,3);
		var sVal = getVal.substr(3,4);
		var tVal = getVal.substr(7,4);
		$("#userPhone").val(fVal + "-" + sVal + "-" + tVal);		//회원전화번호
	}
	
	//서비스 호출 함수
	function callAjax(url, type, param, svcId){
		$.ajax({
			type : "POST",
			url : url,
			dataType : type,
			data : param,
			success : function(rdata, status, xhr) {
				if(svcId == "getUserInfo"){
					$("#userId").text(rdata.USER_ID);							//회원아이디
					$("#userName").val(rdata.USER_NAME);						//회원이름
					$("#userNickname").val(rdata.USER_NICKNAME);				//회원닉네임
					userInfoNick = rdata.USER_NICKNAME;
					$("#userAddress1").val(rdata.USER_ADDRESS1);				//회원주소
					$("#userAddress2").val(rdata.USER_ADDRESS2);				//회원주소
					$("#userAddress3").val(rdata.USER_ADDRESS3);				//회원주소
					$("#post").val(rdata.USER_POST);					//회원주소
					var fVal = rdata.USER_PHONE.substr(0,3);
					var sVal = rdata.USER_PHONE.substr(3,4);
					var tVal = rdata.USER_PHONE.substr(7,4);
					$("#userPhone").val(fVal + "-" + sVal + "-" + tVal);		//회원전화번호
					if(rdata.USER_TYPE == "member"){
						$("#userType").text("사용자");							//회원타입
					}else{
						$("#userType").text("관리자");							//회원타입
					}
					$("#userRegdate").text(rdata.USER_REGDATE.substr(0,10));	//회원가입일
				}else if(svcId == "changeInfo"){
					if(rdata.upDate == 1){
						alert("정상적으로 회원정보가 변경되었습니다.");
						selectMyInfo();
					}
				}
			}, 
			error : function(xhr, status, error) {
			   console.log("error");
			   return false;
			}
		});
	}
	
	//주소 우편번호 찾기버튼
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var fullRoadAddr = data.roadAddress;
	            var extraRoadAddr = '';

	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	            document.getElementById('userAddress1').value = fullRoadAddr;
	            document.getElementById('userAddress2').value = data.jibunAddress;
	            document.getElementById('post').value = data.zonecode;

	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            if($("#userAddress1").val().length!=0){
	        		$("#address_message").text("");
	        	}
	        }
	    }).open();
	}
	
</script>
