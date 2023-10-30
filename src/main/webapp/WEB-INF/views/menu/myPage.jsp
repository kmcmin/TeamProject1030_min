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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/cart.css">
	<link href="https://www.flaticon.com/free-icons/tool-tips" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
</head>

	<div class="css-1pz4b762 er0tf675">
		<h3 class="css-1n2hipb er0tf674">마이페이지</h3>

			<div class="css-8wfj4z3 er0tf672" style="float: left;">
				<div class="css-50ad82 er0tf670" id="pet">
					<div class="css-1t6so8j2 em21elb0">
						<div class="css-1t6so8j4">
							마이페이지
						</div>
						<div class="css-1t6so8j3">
							<div class="css-8jmoub ea1mry77">
								<span class="css-vmo0an2 ea1mry76 mp1" id="shopInfo" >주문조회</span>  
							</div>
							<div class="css-8jmoub ea1mry77">
<!-- 								<span class="css-vmo0an2 ea1mry76 mp1" id="memberInfo" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >회원정보수정</span>  -->
								<span class="css-vmo0an2 ea1mry76 mp1" id="memberInfo" data-bs-target="#staticBackdrop" >회원정보수정</span> 
							</div>
							<div class="css-8jmoub ea1mry77">
								<span class="css-vmo0an2 ea1mry76 mp1" id="inquiryInfo" >1:1문의내역</span> 
							</div>
							<div class="css-8jmoub ea1mry77">
								<span class="css-vmo0an2 ea1mry76 mp1">상품문의내역</span> 
							</div>
							<div class="css-8jmoub ea1mry77">
								<span class="css-vmo0an2 ea1mry76 mp1" id="reviewInfo">나의후기</span> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 카테고리 클릭시 아래 적용 -->
			<div style="float: left;">
				<iframe id="main_frame" src="" width="1100px" height="500px"> </iframe>
			</div>
			
	</div>
	    <div class="quickMenuWrap"> 
            <button type="button" onclick="chat()">
               	<img src="resources/img/cha.png" style="width:50px;" >
			</button>
       		<button onclick="gotoScrollTop()">
            	<img src="resources/img/GoTop.png" style="width:50px; hight:50px;" >
        	</button>
    	</div>
    	
	
	<!--  모달창 써본다.  -->
<!-- *********************************************************************	 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
					<form id="inquireForm" action="#">
						<div class="modal-body"> 
							<span>비밀번호를 입력해주세요.</span>
							<input name="passWordNum" id="passWordNum" type="password" style="width: 100%;" value="" placeholder="비밀번호를 입력해주세요.">
						</div>
					</form>
	
				<div class="modal-footer">
					<button type="button" style="background-color: #6aa338; color: white;" id="inquireBut" class="btn btn-primary" onclick="passChkFun()">확인</button>
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal" onclick="setContentLink('orderList2?param=ifm')">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- *********************************************************************	 -->
	
	<script type="text/javascript">
	
		var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), { keyboard: false });
	
		//화면 진입시 호출하는 이벤트 모음
		$(document).ready(function() {
			// 카테고리 이벤트 모음
			$('.mp1').on({
				mouseover: function(){ 
					$(this).css({"color":"red", "font-size":"30px"});
			    },
				mouseout: function(){ 
					$(this).css({"color":"","font-size":""});
				},
				click: function(){ 
					var param="";
					var id=$(this).attr('id');
					
					if(id == "shopInfo"){
		 				param = "orderList2?param=ifm";
					}else if(id == "memberInfo"){
						myModal.show();
					}else if(id == "inquiryInfo"){
						param = "cs/InquiryList?param=ifm";
					}else if(id == "reviewInfo"){
						param = "cart";
					}
					setContentLink(param);
				}
			});
			setContentLink("orderList2?param=ifm");
		});
		
		function setContentLink(param){
			if(param == "menu/changeUser"){
				$("#main_frame").css("height","1000px");
			}else if(param == "cs/InquiryList?param=ifm"){
				$("#main_frame").css("height","600px");
			}else{
				$("#main_frame").css("height","500px");
			}
			document.getElementById("main_frame").src = param;
		}
		
		function passChkFun(){
			var pass = $("#passWordNum").val();
			if(pass != null && pass != ""){
				$.ajax({
					type : "POST",
					url : "dlfmaqusrudgkrl",
					dataType : "text",
					data : { "chkpw" : pass },
					success : function(data, status, xhr) {
						if(data == "true"){
// 							alert("비밀번호가 일치합니다.");
							myModal.hide();
							setContentLink("menu/changeUser");
							$("#passWordNum").val("");
						}else{
							alert("비밀번호가 일치하지 않습니다.")
							return false;
						}
					}, 
					error : function(xhr, status, error) {
						console.log("error");
						return false;
					}
				});
			}else{
				alert("비밀번호를 다시 입력해주세요.");
				return false;
			}
		}
		
		function gotoScrollTop() {
	    	$('html, body').animate({ scrollTop: '0' }, 0);
		};
		function chat(){ 
			 <%if(session.getAttribute("login")==null){%>
			 alert("로그인이 필요");
			 <%}else{
					UserDTO user = (UserDTO)session.getAttribute("login");%>
					window.open('room','window_name', 'width=680, height=690, location=no, status=no, scrollbars=yes');
			<%}%>
		};
		
		
	</script>


</html>