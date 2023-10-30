<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카테고리</title>
	<link rel="stylesheet" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" data-n-g />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/cart.css">
	<link href="https://www.flaticon.com/free-icons/tool-tips" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="resources/css/changeUser.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">	<!-- 폰트어썸 불러오기 -->
<!-- 	<meta name="viewport" content="width=device-width, user-scalable=no" />										반응형 필수 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>					<!-- 제이쿼리 불러오기 -->
</head>
	<!-- 사이트 박스 시작 -->
	<section class="site-box min-height-100vh flex flex-column">
	  <!-- 메인 컨텐츠 박스 시작 -->
	  <main class="main-box flex-grow-1 visible-md-up">
	    <section class="main-box-section con">
	      <!-- 회원정보 페이지 시작 -->
	      <div class="section-MyPage min-height-50vh flex flex-jc-c flex-ai-c ">
	        <form name="form" onsubmit="check(this); return false;" action="doModifyInfo" method="POST">
	          <input type="hidden" name="id" value="">
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
<!-- 	                <span>Password</span> -->
<!-- 	                <div class=MyPage_cell__body> -->
<!-- 	                  <input type="password" name="loginPw" maxlength="50" placeholder="PW 입력" id="password1"> -->
<!-- 	                </div> -->
	              </div>
	
	              <div class=MyPage_cell__title>
<!-- 	                <span>Password Check</span> -->
<!-- 	                <div class=MyPage_cell__body> -->
<!-- 	                  <input type="password" name="loginPwConfirm" maxlength="50" placeholder="PW 확인" id="password2"> -->
<!-- 	                </div> -->
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
	              <div class=MyPage_cell__title>
<!-- 	                <span>e-mail</span> -->
<!-- 	                <div class=MyPage_cell__body> -->
<!-- 	                  <input type="email" name="email" value="" id="userEmail"> -->
<!-- 	                </div> -->
					<span>주소 <input type="button" class="submitModifyBtn btn btn-go" style="margin-bottom:13px;" value="우편번호 찾기"> </span>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress1" style="width:250px;">
	                </div>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress2" style="width:250px;">
	                </div>
					<div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress3" style="width:250px;">
	                </div>
	                <div class=MyPage_cell__body style="width:250px;">
	                  <input type="text" name="address" value="" id="userAddress4" style="width:250px;">
	                </div>
	                <span id="guide" style="color:#999"></span>
    				<span id="address_message" style="color:red"></span>
	              </div>
	
	              <div class=MyPage_cell__title>
	                <span>연락처</span>
	                <div class=MyPage_cell__body>
	                  <input type="text" name="cellphoneNo" value="" id="userPhone" >
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
	                <button class="submitModifyBtn btn btn-go" type="button" style="margin-right: 100px;"><i class="far fa-edit"></i> 변경</button>
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

<script type="text/javascript">
	
	   
</script>
