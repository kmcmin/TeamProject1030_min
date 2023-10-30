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
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   <link rel="stylesheet" href="resources/css/cart.css">
   <link href="https://www.flaticon.com/free-icons/tool-tips" rel="stylesheet" type="text/css">
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
   <link rel="stylesheet" href="resources/css/toast.css">
<!-- <body> -->
   <div class="css-1pz4b76 er0tf675">
      <h2 class="css-1n2hipb er0tf674"><button onclick="rand(1,45)" id="titleId">신상품</button></h2>

      <div class="css-a6t9xs er0tf673">
<!--          <div class="css-8wfj4z er0tf672"> -->
         <div class="">
            <div class="css-20o6z0 e149z643">
               <div class="css-zbxehx e149z642">
                  <label class="css-1vf8o8s e1dcessg3"> 
                     <input type="checkbox" class="css-agvwxo e1dcessg2">
                     <span style="color:rgb(51, 51, 51); ">필터</span>
                  </label>
                  <span class="css-454d5e e149z641"></span>
                  <button class="css-0 e149z640">초기화</button>
               </div>
               
               <div class="css-zbxehx e149z642" style="margin-right: 50px;">
                  <button class="css-0 e149z640" id="newProduct" onclick="reloadProduct(this.id)">신상품순</button>
                  <span class="css-454d5e e149z641"></span>
                  <button class="css-0 e149z640" id="manyProduct" onclick="reloadProduct(this.id)">판매량</button>
                  <span class="css-454d5e e149z641"></span>
                  <button class="css-0 e149z640" id="lowSalProduct" onclick="reloadProduct(this.id)">낮은가격순</button>
                  <span class="css-454d5e e149z641"></span>
                  <button class="css-0 e149z640" id="highSalProduct" onclick="reloadProduct(this.id)">높은가격순</button>
               </div>
            </div>
            
            <div id="productListData"> </div>
            
         </div>
         <div class="css-1dta0ch er0tf671">
            <div class="css-50ad8x er0tf670" id="pet">
               <div class="css-1t6so8j em21elb0">
                  <div class="css-8jmoub ea1mry77">
                     <span class="css-vmo0an ea1mry76">상품금액</span>
                     <span class="css-iinokh ea1mry74" id="salVal"> 0
                      <span class="css-hfgifi ea1mry72">원</span>
                     </span>
                  </div>
                  <div class="css-t4mc5m ea1mry77">
                  	<div id="tempSave">담긴상품</div>
<!--                      <span class="css-vmo0an ea1mry76">상품할인금액</span>  -->
<!--                      <span class="css-iinokh ea1mry74"> 0 -->
<!--                      <span class="css-hfgifi ea1mry72">원</span> -->
<!--                      </span> -->
                  </div>
                  <div class="css-7ygxxm eepcpbj4">
                     <span class="css-vmo0an eepcpbj3">결제예정금액</span>

                     <span class="css-da7gr8 eepcpbj2">
                         <strong class="css-xmbce4 eepcpbj0">0</strong>
                         <span class="css-aro4zf eepcpbj1">원</span>
                     </span>
                  </div>
               </div>

               <div class="css-8qz8ia e1mybczi1">
                  <button class="css-fwelhw e4nu7ef3" type="button" onclick="go()" height="56">
                     <span class="css-13budib e4nu7ef1">구매하기</span>
                  </button>
<!--                   <ul class="css-19kxq7d"> -->
<!--                      <li class="css-1741abm ejr204i0">[주문완료] 상태일 경우에만 주문 취소 가능합니다.</li> -->
<!--                      <li class="css-1741abm ejr204i0">[파머스 &gt;주문내역 상세페이지] 에서 직접 취소하실 수 있습니다.</li> -->
<!--                   </ul> -->
               </div>
            </div>
         </div>
      </div>
   </div>
   <%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script type="text/javascript">
  alert("저리가요.");
  document.location.href="main";
 </script>
<%
  return;
 }
%> 

<script type="text/javascript">
	var productList = [];
	var cartList = [];
	var salMoney = 0;
	var cntData = 0;
  
	//화면 진입시 호출하는 이벤트 모음
	$(document).ready(function() {
// 		debugger;
		var urlParams = new URL(location.href).searchParams;
		var param = urlParams.get('param');
		if(param == "a"){
			$("#titleId").text("전체상품");
		}else if(param == "g"){
			$("#titleId").text("고기");
		}else if(param == "s"){
			$("#titleId").text("쌀");
		}else if(param == "f"){
			$("#titleId").text("과일");
		}else if(param == "b"){
			$("#titleId").text("판매순");
		}
		getProductList(param);
	});
  
	function over(val) {
		var target = document.getElementsByName("tooltip-text"+val)[0];
		target.style='display:block;'
		target.classList.remove("tooltip-text:before");
		target.classList.add("tooltip-text");
	};
  
	function leave(val) {
		var target = document.getElementsByName("tooltip-text"+val)[0];
		target.style='display:none;'
		target.classList.add("tooltip-text:before");
		target.classList.remove("tooltip-text");
// 		target.classList.remove("tooltip-text:before");
// 		target.classList.add("tooltip-text");
	};
	function go(){
		location.href='cart';
	}
  
	//********************************************** 상품리스트 출력 *****************************************************************//
	function getProductList(val, param){
		var setParam = {};
		if(val != null){
			setParam.filter = val; 
			if(param != null){
				setParam.param = param; 
			}
		}
		//리스트 
		$.ajax({
			type : "POST",
			url : "getProductList",
			dataType : "json",
			data : setParam,
			success : function(rdata, status, xhr) {
				productList = rdata.productList;
				if(rdata.cartList != null){
					cartList = rdata.cartList;
				}
				rdata = rdata.productList;
   
				console.log("리스트받아와지나? : "+rdata);

				//전체 DIV태그를 만드는 변수
				var productDiv = "";

				//상품 스타일
				var productStyle = "border-radius:5px; width:23%; height:380px; float: left; margin-right: 5px; margin-left: 5px;";
				
				//상품 담기 스타일
				var productSaveStyle = "text-align: center; border-radius:5px; width:100%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
				var productSaveStyle2 = "text-align: center; border-radius:5px; width:27%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
				var productSaveStyle3 = "text-align: center; border-radius:5px; width:25%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
				
				var bool = true;

				//전체 상품에 대한 루프
				for (var i = 0; i < rdata.length; i++) {
					productDiv += "<div class='css-1t6so8j em21elb0' style='"+productStyle+"'>";
					if(rdata[i].PRODUCT_NAME.length >= 13){
						productDiv += "<div class='tooltip-container'>";
						productDiv += "<p class='tooltip-text' name='tooltip-text"+i+"' style='display:none;'>"+rdata[i].PRODUCT_NAME+"</p>";
						productDiv += "<p name='tooltip-button"+i+"' onmouseleave='leave("+i+")' onmouseover='over("+i+")'>"+rdata[i].PRODUCT_NAME.substr(0,13)+"..."+"</p>";
						productDiv += "</div>";
					}else{
						productDiv += rdata[i].PRODUCT_NAME;
					}
					var productCd = "'"+rdata[i].PRODUCT_CODE+"'";
				
					productDiv += '<div style=height:200px;>';
					productDiv += '<img src="'+rdata[i].PRODUCT_IMG+'" border="0" align="center" onclick="productDetail('+productCd+')" style=height:100%;>';
					productDiv += '</div>';
				
					if(cartList.length != 0){
						for (var j = 0; j < cartList.length; j++) {
							if(rdata[i].PRODUCT_CODE == cartList[j].PRODUCT_CODE){
								productDiv += '<div id=div'+i+'>';
								productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle2+"'>";
								var productPrice = "'"+rdata[i].PRODUCT_PRICE+"'";
								productDiv += '<button id=btn'+i+' style="center;" onclick="productSave('+productPrice+','+i+','+productCd+','+1+')"><img src="resources/img/icon-plus.svg"></button>';
								productDiv += "</div>";
								
								productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle3+"'>";
								productDiv += cartList[j].CART_COUNT;
								productDiv += "</div>";
								
								productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle2+"'>";
								productDiv += '<button id=btn2'+i+' style="center;" onclick="productMinus('+productPrice+','+productCd+','+cartList[j].CART_NO+','+cartList[j].CART_COUNT+')" ><img src="resources/img/icon-minus.svg"></button>';
								productDiv += "</div>";
								bool = false;
								break;
							}else{
							   bool = true;
							}
						}
					}
				
					if(bool){
						productDiv += '<div id=div'+i+'>';
						productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle+"'>";
						productDiv += "<img src='resources/img/cha.png' style='width:10%;' >";
						var productPrice = "'"+rdata[i].PRODUCT_PRICE+"'";
						productDiv += '<button id=btn'+i+' style="center;" onclick="productSave('+productPrice+','+i+','+productCd+','+1+')">담기</button>';
						productDiv += "</div>";
						bool = true;
					}
					
					productDiv += '<div id="toast" name="toastNm'+i+'"> '+rdata[i].PRODUCT_NAME+'을 담았습니다.</div>';
					productDiv += "</div>";
					var price = rdata[i].PRODUCT_PRICE;
					productDiv += "<span><p>"+price.toLocaleString()+"원</p></span>";
					productDiv += "</div>";
				}
				$("#productListData").html(productDiv);

				var sumData = 0;
				for (var i = 0; i < rdata.length; i++) {
					for (var j = 0; j < cartList.length; j++) {
						if(rdata[i].PRODUCT_CODE == cartList[j].PRODUCT_CODE){
							sumData += rdata[i].PRODUCT_PRICE * cartList[j].CART_COUNT;
							cntData += cartList[j].CART_COUNT;
						}
					}
				}
				$("#salVal").text(sumData.toLocaleString());
				salMoney = sumData;
				
				parent.$("#carticon").text(cntData);
			}, 
			error : function(xhr, status, error) {
			   console.log("error");
			   return false;
			}
		});
	}
	//********************************************** 상품리스트 출력 *****************************************************************//

	//********************************************** 카트담기 *****************************************************************//
	function productSave(val, numVal, proCd) {
		var setParam = {}
		setParam.product_code = proCd;          //상품코드
		setParam.cart_count = 1;                //숫자무조건 한개씩넘김 갯수를 조절하는 부분이 없기때문임
		
		<%if (session.getAttribute("login")==null){%>
			alert("로그인이 필요합니다");
			location.href='login/UI';
			return false;
		<%}%>
// 		debugger;
         var status=status;
		//장바구니에 담는 순간
		$.ajax({
			type : "POST",
			url : "cartAdd",
			dataType : "text",
			data : setParam,
			success : function(rdata, status, xhr) {
				val = parseInt(val);
				salMoney += val;
				$("#salVal").text(salMoney.toLocaleString());
				
				$.ajax({
					type : "POST",
					url : "getCartList",
					dataType : "json",
					data : {},
					success : function(rdata, status, xhr) {
						var productSaveStyle = "text-align: center; border-radius:5px; width:30%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
						var productSaveStyle2 = "text-align: center; border-radius:5px; width:25%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
						var len = productList.length;
						cntData = 0;
						for (var i = 0; i < rdata.length; i++) {
							var pdCd = rdata[i].PRODUCT_CODE;
							var productDiv = "";
							chk : for (var j = 0; j < len; j++) {
								if(productList[j].PRODUCT_CODE == pdCd){
									cntData += rdata[i].CART_COUNT;
									productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle+"'>";
									var productCd = "'"+rdata[i].PRODUCT_CODE+"'";
									var productPrice = "'"+productList[j].PRODUCT_PRICE+"'";
									productDiv += '<button id=btn'+j+' style="center;" onclick="productSave('+productPrice+','+j+','+productCd+','+1+')"><img src="resources/img/icon-plus.svg"></button>';
									productDiv += "</div>";
									
									productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle2+"'>";
									productDiv += rdata[i].CART_COUNT;
									productDiv += "</div>";
									  
									productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle+"'>";
									productDiv += '<button id=btn2'+j+' style="center;" onclick="productMinus('+productPrice+','+productCd+','+rdata[i].CART_NO+','+rdata[i].CART_COUNT+')"><img src="resources/img/icon-minus.svg"></button>';
									productDiv += "</div>";
									
									productDiv += '<div id="toast" name="toastNm'+j+'"> '+productList[j].PRODUCT_NAME+'을 담았습니다.</div>';
									productDiv += "</div>";
									$("#div"+j).html(productDiv);
									productDiv = "";
									break chk;
								}
							}
						}
						
						parent.$("#carticon").text(cntData);
						
						var showId = "toastNm"+numVal;
						// 아래 테스트중 상품담으면 토스트 메세지 on
						const toast = document.getElementsByName(showId);
						let isToastShown = false;
						if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면 함수를 끝냄
						isToastShown = true;
						var addClass = toast[0];
						addClass.classList.add('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
						setTimeout(function () {
							// 2700ms 후에 show 클래스를 제거함
							addClass.classList.remove('show'); 
							isToastShown = false;
						}, 2700);
					}, 
					error : function(xhr, status, error) {
						console.log("error");
						return false;
					}
				});
			}, 
		error : function(xhr, status, error) {
			console.log("error");
			return false;
		}
		});
	};
    //********************************************** 카트담기 *****************************************************************//
      
    //********************************************** 카트빼기 *****************************************************************//
	function productMinus(productPrice, pdcd, cartNo, cartCount) {
		if(cartCount>=1){
			$.ajax({
				url : "cartUpdate",
				type : "get",
				dataType : "text",
				data : {
					CART_NO : cartNo, 
					CART_COUNT : cartCount-1
				},
				success : function(rdata, status, xhr) {
					val = parseInt(productPrice);
					salMoney -= val;
					$("#salVal").text(salMoney.toLocaleString());
					
					$.ajax({
						type : "POST",
						url : "getCartList",
						dataType : "json",
						data : {},
						success : function(rdata, status, xhr) {
							var productSaveStyle0 = "text-align: center; border-radius:5px; width:100%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
							var productSaveStyle = "text-align: center; border-radius:5px; width:30%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
							var productSaveStyle2 = "text-align: center; border-radius:5px; width:25%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
							var len = productList.length;
							var productDiv = "";
							if(rdata.length == 0){
								cntData = 0;
								for (var j = 0; j < len; j++) {
									productDiv += '<div id=div'+j+'>';
									productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle0+"'>";
									productDiv += "<img src='resources/img/cha.png' style='width:10%;' >";
									var productPrice = "'"+productList[j].PRODUCT_PRICE+"'";
									var productCd = "'"+productList[j].PRODUCT_CODE+"'";
									productDiv += '<button id=btn'+j+' style="center;" onclick="productSave('+productPrice+','+j+','+productCd+','+1+')">담기</button>';
									productDiv += "</div>";
									$("#div"+j).html(productDiv);
									productDiv = "";
								}
							}else{
								cntData = 0;
								for (var i = 0; i < rdata.length; i++) {
									chk : for (var j = 0; j < len; j++) {
										if(productList[j].PRODUCT_CODE == rdata[i].PRODUCT_CODE){
											cntData += rdata[i].CART_COUNT;
											productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle+"'>";
											var productCd = "'"+rdata[i].PRODUCT_CODE+"'";
											var productPrice = "'"+productList[j].PRODUCT_PRICE+"'";
											productDiv += '<button id=btn'+j+' style="center;" onclick="productSave('+productPrice+','+j+','+productCd+','+1+')"><img src="resources/img/icon-plus.svg"></button>';
											productDiv += "</div>";
											
											productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle2+"'>";
											productDiv += rdata[i].CART_COUNT;
											productDiv += "</div>";
											  
											productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle+"'>";
											productDiv += '<button id=btn2'+j+' style="center;" onclick="productMinus('+productPrice+','+productCd+','+rdata[i].CART_NO+','+rdata[i].CART_COUNT+')"><img src="resources/img/icon-minus.svg"></button>';
											productDiv += "</div>";
											
											productDiv += '<div id="toast" name="toastNm'+j+'"> '+productList[j].PRODUCT_NAME+'을 담았습니다.</div>';
											productDiv += "</div>";
											$("#div"+j).html(productDiv);
											productDiv = "";
											break chk;
										}
									}
								}
								if(cartCount == 1){
									var productDiv = "";
									var productSaveStyle0 = "text-align: center; border-radius:5px; width:100%; height:12%; float: left; margin:5px; padding: 10px 15px 15px 5px;";
									for (var k = 0; k < len; k++) {
										var proPdcd = productList[k].PRODUCT_CODE;
										if(proPdcd == pdcd){
											productDiv += '<div id=div'+k+'>';
											productDiv += "<div class='css-1t6so8j em21elb0' style='"+productSaveStyle0+"'>";
											productDiv += "<img src='resources/img/cha.png' style='width:10%;' >";
											var productPrice = "'"+productList[k].PRODUCT_PRICE+"'";
											var productCd = "'"+productList[k].PRODUCT_CODE+"'";
											productDiv += '<button id=btn'+k+' style="center;" onclick="productSave('+productPrice+','+k+','+productCd+','+1+')">담기</button>';
											productDiv += "</div>";
											$("#div"+k).html(productDiv);
											productDiv = "";
											break;
										}
									}
								}
							}
							parent.$("#carticon").text(cntData);
						}, 
						error : function(xhr, status, error) {
							console.log("error");
							return false;
						}
					});
				}, 
				error : function(xhr, status, error) {
					console.log("error");
					return false;
				}
			})
		};
    };
    //********************************************** 카트빼기 *****************************************************************//
         
      // 필터값 new/many/high/low, 중에 하나 받아서 리스트 출력
      function reloadProduct(id){
    	 var urlParams = new URL(location.href).searchParams;
  		 var param = urlParams.get('param');
  		
         var param2 = "";
         if(id == "manyProduct"){
            param2 = "many";
         }else if(id == "lowSalProduct"){
            param2 = "low";
         }else if(id == "highSalProduct"){
            param2 = "high";
         }
         getProductList(param, param2);
      }
      
      function productDetail(val) { 
         var param = val;
         location.href="productDetails?product_code="+param;
      };
      
      
      function rand(min, max) {
         var ns=[];
         var luk=  Math.floor(Math.random() * (max - min + 1)) + min;
         ns.push(luk);
         for(var i=0;i<6;i++){
         	var luk=  Math.floor(Math.random() * (max - min + 1)) + min;
	         if(ns.indexOf(luk) == -1){
	        	 ns.push(luk);
	         }
	         if(ns.length==6)
	        	 break;
         }
         ns.sort((a,b)=>a-b); 
         alert(ns); 
      };
      
   </script>
</html>