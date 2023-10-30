<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.example.dto.ReviewDTO"%>
<%@page import="com.example.dto.FileDTO"%>
<%@page import="com.example.dto.ReviewDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.example.dto.ProductDTO"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
<link href="resources/css/page.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@400;700&display=swap"
	rel="stylesheet" />
<link rel="icon" type="image/png" sizes="32x32"
	href="./images/favicon-32x32.png" />
<script>

    $(function() {
    var $tabButtonItem = $('#tab-button li'),
    $tabSelect = $('#tab-select'),
    $tabContents = $('.tab-contents'),
    activeClass = 'is-active';

    $tabButtonItem.first().addClass(activeClass);
    $tabContents.not(':first').hide();

    $tabButtonItem.find('a').on('click', function(e) {
    var target = $(this).attr('href');

    $tabButtonItem.removeClass(activeClass);
    $(this).parent().addClass(activeClass);
    $tabSelect.val(target);
    $tabContents.hide();
    $(target).show();
    e.preventDefault();
});
        
    $("#plus").on("click",function(){
		 var amount= parseInt( $(".price-txt").text());
			 amount++
			$(".price-txt").text(amount)

   	})//수량 증가
   	
	$("#minus").on("click",function(){
		 var amount= parseInt( $(".price-txt").text());
			if(amount>1){
			 amount--
				$(".price-txt").text(amount)
			}
	})//수량 감소
	
	//리뷰
	$("#review").on("click", function() {
		var pCode = $("#iqPcode").val();
		location.href = "reviewForm?pCode=" + pCode;
	})
	
	$("#cartAdd").on("click",function(){
		console.log("장바구니");
		<%if (session.getAttribute("login")==null){%>
		alert("로그인이 필요합니다");
		<%}else{%>
		 var gAmount= $(".price-txt").text();	
		 console.log(gAmount);
		 //수량 hidden태그의 value에 amount 설정
		 $("#gAmount").val(gAmount);
		 //form.action
		 //폼 서브밋 이벤트 발생 
		$("#cartForm").attr("action","cartAdd").submit(); //액션은 주소만
	<%}%>
	})//장바구니 담기
	
	//구매하기(주문페이지로 이동)
	$("#orderOne").on("click",function(){
		<%if (session.getAttribute("login")==null){%>
		alert("로그인이 필요합니다");
		<%}else{%>
		 var gAmount= $(".price-txt").text();	
		 console.log(gAmount);
		 //수량 hidden태그의 value에 amount 설정
		 $("#gAmount").val(gAmount);
		 //form.action
		 //폼 서브밋 이벤트 발생 
		$("#cartForm").attr("method","post"); //post방식
		$("#cartForm").attr("action","order").submit(); //액션은 주소만
	<%}%>
	})//장바구니 담기
          
  });//doc

  </script>
<c:if test="${!empty addNum }">
<script>
alert("장바구니에 상품을 담았습니다");
</script>
</c:if>
<% session.removeAttribute("addNum"); %>
</head>

<body>

	<div class="overlay-container">
		<div class="item-overlay">
			<button class="item-overlay__btn">
				<img src="images/icon-close.svg" alt="close image"
					class="item-overlay__btn-img" />
			</button>
			<div class="item-overlay__mainImg">
				<img src="images/image-product-1.jpg" alt=""
					class="item-overlay__img" />
				<button class="item-overlay__btnlft overlay-btn">
					<img src="images/icon-next.svg" alt="next symbol image"
						class="item-overlay__btnlft-img overlay-btn__img" />
				</button>
				<button class="item-overlay__btnrgt overlay-btn">
					<img src="images/icon-next.svg" alt="next symbol image"
						class="item-overlay__btnrgt-img overlay-btn__img" />
				</button>
			</div>
			<div class="overlay-img__btns">
				<button class="overlay-img__btn" data-img="0">
					<img src="images/image-product-1-thumbnail.jpg"
						alt="shoe product image" class="overlay-img__btn-img" />
				</button>
				<button class="overlay-img__btn" data-img="1">
					<img src="images/image-product-2-thumbnail.jpg"
						alt="shoe product image" class="overlay-img__btn-img" />
				</button>
				<button class="overlay-img__btn" data-img="2">
					<img src="images/image-product-3-thumbnail.jpg"
						alt="shoe product image" class="overlay-img__btn-img" />
				</button>
				<button class="overlay-img__btn" data-img="3">
					<img src="images/image-product-4-thumbnail.jpg"
						alt="shoe product image" class="overlay-img__btn-img" />
				</button>
			</div>
		</div>
	</div>
	
	<!-- 메인 -->
	
	<main class="item">
		<section class="img">
			<img src="${product.product_img}" alt=""
				class="img-main" width="450" height="450" />

			<h4 align="center">함께 구매하면 좋은 상품</h4>
			<div class="img-btns">
				<button class="img-btn">
					<img
						src="https://oasisproduct.cdn.ntruss.com/73618/detail/detail_73618_0_58322493-dfc6-4f2b-9104-f199edf6efa4.jpg"
						alt="" class="img-btn__img" />
				</button>
				<button class="img-btn">
					<img
						src="https://oasisproduct.cdn.ntruss.com/66866/detail/detail_66866_0_3f6b3885-a937-47c3-8caf-1ed2b3361927.jpg"
						alt="" class="img-btn__img" />
				</button>
				<button class="img-btn">
					<img
						src="https://oasisproduct.cdn.ntruss.com/73615/detail/detail_73615_0_c29c6fb2-0a7b-44c0-8786-ec1f1a3cf8b8.jpg"
						alt="" class="img-btn__img" />
				</button>
				<button class="img-btn">
					<img
						src="https://oasisproduct.cdn.ntruss.com/77445/detail/detail_77445_0_74778106-0238-4e0e-bcc0-a3ff89a3cffe.jpg"
						alt="" class="img-btn__img" />
				</button>
			</div>
		</section>



		<section class="price">
			<h2 class="price-sub__heading">Farmer's Market Delivery</h2>
			<h1 class="price-main__heading">${product.product_name}</h1>
			<dl>
				<div>
					<dt>보관방법</dt>
					<dd>냉장</dd>
				</div>
				<div>
					<dt>판매단위</dt>
					<dd>1팩</dd>
				</div>
				<dt>중량/용량</dt>
				<dd>200g내외</dd>
				<div>
					<dt>원산지</dt>
					<dd>상품설명/상세정보 참조</dd>
				</div>
				<div>
					<dt>유통기한</dt>
					<dd>농산물은 별도의 유통기한이 없으므로 빠른 시일내 섭취를 권장드립니다.</dd>
				</div>
				<div>
					<dt>배송</dt>
					<dd>무료배송</dd>
				</div>
			</dl>

			<div class="price-box">
				<div class="price-box__main">
					<span class="price-box__main-new">가격 ${product.product_price}원
					</span> <span class="price-box__main-discount"> 할인%</span>
				</div>
				<span class="price-box__old">할인금액 원</span>
			</div>

			<div class="price-btnbox">
				<div class="price-btns">

					<button id="minus">
						<img src="resources/img/icon-minus.svg" />
					</button>
				    <span class="price-txt" id="amount">1</span>
						<button id="plus">
						<img src="resources/img/icon-plus.svg" />
					</button>

				</div>

				<button id="cartAdd" class="price-cart__btn btn--orange">
					<img src="resources/img/icon-cart.svg" alt="cart image"
						class="price-cart__btn-img" /> 장바구니 담기
				</button>
				<button class="heart_btn" type="button">
					<img src="resources/img/heart.png" alt="heart image" width="45"
						height="45" />
				</button>
				<!-- 바로 구매하는 경우 -->
				<button id="orderOne" class="price-cart__btn btn--orange">구매하기</button>
			</div>

		</section>
	</main>
	<form action="" id="cartForm">
		<input type="hidden" name="product_img"  value="${product.product_img}"> 
	    <input type="hidden" name="product_code"  value="${product.product_code}">
<%-- 	    <input type="hidden" name="product_price" value="${product.product_price}"> --%>
	  	<input type="hidden" name="cart_count" value="" id="gAmount">
	    <input type="hidden" name="product_name"  value="${product.product_name}">
	    <input type="hidden" name="product_context"  value="${product.product_context}">
<%-- 	    <input type="hidden" name="cart_no"  value="${cart_no}"> --%>
	</form>
<!--css가 깨져서 폼을 main 밖에 만들었음 -->
	<hr>

	<div class="tabs">
		<div class="tab-button-outer">
			<ul id="tab-button">
				<li><a href="#tab01">상품설명</a></li>
				<li><a href="#tab02">상품상세정보</a></li>
				<li><a href="#tab03">후기</a></li>
				<li><a href="#tab04">문의</a></li>
			</ul>
		</div>


		<div id="tab01" class="tab-contents" align="center">
			<img src="">
		</div>

		<div id="tab02" class="tab-contents"></div>

		<div id="tab03" class="tab-contents">
			<h2 class="productReview">상품후기</h2>
			<input type="button" value="후기작성" id="review">
			<table>
				<%
					List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviewlist");

					for (int i = 0; i < reviews.size(); i++) {
				%>
				<tbody>
					<tr>
						<td colspan="4">
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header"
										id="heading<%=reviews.get(i).getREVIEW_NO()%>">
										<button class="accordion-button " type="button"
											data-bs-toggle="collapse"
											data-bs-target="#collapse<%=reviews.get(i).getREVIEW_NO()%>"
											aria-expanded="true"
											aria-controls="collapse<%=reviews.get(i).getREVIEW_NO()%>">
											<div style="font-size: 17px;" class="acodifont"
												style="display: flex; justify-content: space-between;">
												<div class="acodifont1" style="order: 3;"><%=reviews.get(i).getREVIEW_TITLE()%></div>
												<div class="acodifont2" style="order: 2;"></div>
												<div class="acodifont3" style="order: 1;">
													작성자<%=reviews.get(i).getUSER_ID()%>님
												</div>
											</div>
										</button>

									</h2>
									<div id="collapse<%=reviews.get(i).getREVIEW_NO()%>"
										class="accordion-collapse collapse"
										aria-labelledby="headingOne"
										data-bs-parent="#accordionExample">

										<%
											List<FileDTO> filedto = reviews.get(i).getFiledto();
												for (int j = 0; j < filedto.size(); j++) {
										%>
										<div class="accordion-body">
											<!-- 										이중포문 -->
											<img
												src="/app/upload2<%=filedto.get(j).getSaveFileName()%><%=filedto.get(j).getSaveFilePath()%>"
												style="width: 220px; height: 200px;">
											<!-- 										이중포문 끝 -->
											<%
												}
											%>
											<br> <br>
											<div style="font-size: 16px; font-weight: bold;"><%=reviews.get(i).getREVIEW_CONTENT()%></div>
										</div>
										

										<%
											}
										%>

									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>

			</table>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade" id="tab1default">상품정보</div>
					<div class="tab-pane fade" id="tab2default">상품상세정보</div>
					<div class="tab-pane fade" id="tab3default">후기</div>
					<div class="tab-pane fade" id="tab4default">문의</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form id="inquireForm" action="#">
						<input type="hidden" name="PRODUCT_CODE"
							value="${product.product_code}" id="iqPcode">
						<div class="modal-body">
							제목<input name="REVIEW_TITLE" id="REVIEW_TITLE1" type="text"
								style="width: 100%;" value="" placeholder="제목을 입력해 주세요">
							<div style="height: 15px;"></div>
							내용
							<textarea name="REVIEW_CONTENT" id="REVIEW_CONTENT1"
								inputmode="text"
								style="width: 100%; height: 300%; padding: 15px 15px 32px;"
								placeholder="문의하실 내용을 입력해 주세요"></textarea>
						</div>
					</form>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button"
							style="background-color: #6aa338; color: white;" id="inquireBut"
							class="btn btn-primary">작성</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal end -->
		<!-- 로그인이 안 되었을 때 Modal -->
		<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div
						style="font-size: 16px; text-align: center; font-weight: bold;">로그인이
						필요합니다.</div>
					<div class="modal-footer" style="border-top: clear;">
						<button type="button" class="btn btn-secondary"
							style="background-color: #6aa338; color: white;"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<!-- Button trigger modal -->
		<div id="tab04" class="tab-contents">
		
		
			<div style="height: 1.3em;"></div>
			상품문의
			<button type="button"
				style="float: right; background-color: #6aa338; color: white;"
				class="btn" data-bs-toggle="modal"
				<%if (session.getAttribute("login") != null) {%>
				data-bs-target="#staticBackdrop" <%}%>
				<%if (session.getAttribute("login") == null) {%>
				data-bs-target="#staticBackdrop2" <%}%>>상품 문의</button>
			<div style="height: 17px;"></div>
			<div style="color: #999;">
				<ul>
					<li>상업성 홍보글, 미풍양속을 해치는 글, 특정병명의 노출 등 상품 문의 외 취지에 어긋나는 글은 삭제될 수
						있으므로 양해바랍니다.</li>
					<li>&nbsp;</li>
					<li>파머스마켓의 상세한 답변이 필요한 배송, 교환 / 반품, A/S, 주소지변경, 추가 요구 사항 등은
						파머스마켓 고객센터(1:1문의)를 이용 하시면 답변을 받으실 수 있습니다.</li>
				</ul>
				<div style="height: 30px;"></div>
				<table class="table table-striped" style="text-align: center;">
					<thead class="css-inquiry">
						<tr class="css-inquiry2">
							<th class="title">제목</th>
							<th class="author">작성자</th>
							<th class="title">작성일</th>
							<th class="title">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- for문 시작-->
						<tr class="inquiry2">

						</tr>
						<!-- for문 끝 -->
					</tbody>

				</table>
				페이징처리
				<!-- 				<div class="text-center"> -->
				<!-- 					<ul class="pagination"> -->
				<!-- 						<li><a href="#">1</a></li> -->
				<!-- 						<li><a href="#">2</a></li> -->
				<!-- 						<li><a href="#">3</a></li> -->
				<!-- 						<li><a href="#">4</a></li> -->
				<!-- 						<li><a href="#">5</a></li> -->
				<!-- 					</ul> -->
				<!-- 				</div> -->
				<!-- 			</div> -->

			</div>

		</div>