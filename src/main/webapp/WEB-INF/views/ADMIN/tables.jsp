<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품관리</title>
<link href="resources/css/styles.css" rel="stylesheet" />

<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" /> -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" /> -->
<!-- <script	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> -->



<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" /> -->
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>





<script type="text/javascript">

	var inputTag = [
		"PRODUCT_CODE","PRODUCT_NAME","PRODUCT_IMG",
		"PRODUCT_CONTEXT","PRODUCT_PRICE","PRODUCT_STOCK",
		"CATEGORY_CODE","PRODUCT_COMPANY","PRODUCT_STATUS",
	];
	
	var validateTag = [
		"상품코드","상품명","상품이미지",
		"상품설명","상품가격","상품재고",
		"상품카테고리","제조사","배송료",
	];
	
	var insertTag = [
		"PUT_PRODUCT_CODE","PUT_PRODUCT_NAME","PUT_PRODUCT_IMG",
		"PUT_PRODUCT_CONTEXT","PUT_PRODUCT_PRICE","PUT_PRODUCT_STOCK",
		"PUT_CATEGORY_CODE","PUT_PRODUCT_COMPANY","PUT_PRODUCT_DELIP",
	];
	
	//화면 진입시 호출하는 이벤트 모음
	$(document).ready(function() {
		productListAdmin();
	}) //end ready
	
	//전체 DB상품리스트
	function productListAdmin(){
		$("#productList").DataTable({
			ajax : {
			url : "adminProductList",
			type : "POST",
// 			dataSrc : '' // 이 부분은 data 말고 다른걸로 할때 쓰는듯?
			},
			columns: [
				
			{ data: 'PRODUCT_CODE', render : function(data){
				var data=data.substr(0,2)+'-'+data.substr(2,4)+'-'+data.substr(6,6)
				return data;
			}},
			
			{ 
				data: 'PRODUCT_NAME', render:function(data){
					if(data.length>27){
						return data.substr(0,27)+'...';
					}
						return data;
			} },
			
			{ 
				data: 'PRODUCT_IMG', render:function(data){
				return data.substr(0,10)+'...';
			} },
			{ 
				data: 'PRODUCT_CONTEXT', render:function(data){
				return data.substr(0,10)+'...';
			} },
			{ 
				data: 'PRODUCT_PRICE', render:function(data){
				return data.toLocaleString();
			} },
			{ 
				data: 'PRODUCT_STOCK', render:function(data){
				return data.toLocaleString();
			} },
			{ data: 'CATEGORY_CODE'},
			
			{ data: 'PRODUCT_COMPANY', render:function(data){
				if(data.length>10) return data.substr(0,10)+'...';
					return data;
			}},
			
			{ data: 'PRODUCT_DELIP'},
			{ data: 'PRODUCT_STATUS'},
			{ 
				data: 'PRODUCT_REGDATE', render:function(data){
				return data.substr(0,10);
			} },
			{ 
				data: 'PRODUCT_UPDATE', render:function(data){
				return data.substr(0,10);
			} },
			{data: 'PRODUCT_CODE', render : function(data,type,row,cnt){
				var productData = JSON.stringify(row);
				var rdata= "<button style='center;' type='button' data-bs-target='#staticBackdrop' onClick='updateProduct("+cnt.row+","+productData+")'>수정</button>";
				rdata+= "<button style='center;' type='button' data-bs-target='#staticBackdrop' onClick='deleteProduct("+cnt.row+","+productData+")'>삭제</button>";
				return rdata;
			}},
			{data: 'CATEGORY_CODE'},
			
			],
			columnDefs: [
			{"targets" : [0], "width" : '7%'}, 
			{"targets" : [1], "width" : '15%'},
			{"targets" : [2], "width" : '5%'},
			{"targets" : [3], "width" : '5%'},
			{"targets" : [4], "width" : '3%'},
			{"targets" : [5], "width" : '3%'},
			{"targets" : [6], "width" : '5%'},
			{"targets" : [7], "width" : '8%'},
			{"targets" : [8], "width" : '4%'},
			{"targets" : [9], "width" : '4%'},
			{"targets" : [10], "width" : '5%'},
			{"targets" : [11], "width" : '5%'},
			{"targets" : [12], "width" : '3%'},
			{"targets" : [13], "width" : '3%'},
			],
			})
	}//end productAdmin

	//상품등록
	function insertProduct(){
		//유효성체크
		for (var i = 0; i < insertTag.length; i++) {
			if($("#"+insertTag[i]).val() == ""){
				alert(validateTag[i]+"을(를) 확인해주세요.");
				$("#"+insertTag[i]).focus();
				return;
			}
		}
		
		if(confirm("상품을 등록하시겠습니까?")){
			var url = "insertProduct";
			var type = "json";
			var param = {};
			for (var i = 0; i < insertTag.length; i++) {
				if(insertTag[i] == "PUT_PRODUCT_DELIP" || insertTag[i] == "PUT_PRODUCT_PRICE" || insertTag[i] == "PUT_PRODUCT_STOCK"){
					param[insertTag[i]] = parseInt($("#"+insertTag[i]).val());
				}else{
					param[insertTag[i]] = $("#"+insertTag[i]).val();
				}
			}
	 		callAjax(url, type, param);
		}
	}
	
	//상품삭제
	function deleteProduct(row, val){
		var url = "deleteProduct";
		var type = "json";
		var param = {};
		if(confirm("상품을 삭제하시겠습니까?")){
			param.proCd = val.PRODUCT_CODE;
	 		callAjax(url, type, param);
		}
	}
	
	//상품수정
	function updateProduct(row, val){
		var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), { keyboard: false });
		myModal.show();
		$("#PRODUCT_CODE").val(val.PRODUCT_CODE);
		$("#PRODUCT_NAME").val(val.PRODUCT_NAME);
		$("#PRODUCT_IMG").val(val.PRODUCT_IMG);
		$("#PRODUCT_CONTEXT").val(val.PRODUCT_CONTEXT);
		$("#PRODUCT_PRICE").val(val.PRODUCT_PRICE.toLocaleString());
		$("#PRODUCT_STOCK").val(val.PRODUCT_STOCK);
		$("#CATEGORY_CODE").val(val.CATEGORY_CODE);
		$("#PRODUCT_COMPANY").val(val.PRODUCT_COMPANY);
		$("#PRODUCT_STATUS").val(val.PRODUCT_STATUS);
		
		for (var i = 0; i < inputTag.length; i++) {
			$("#"+inputTag[i]).attr("disabled",true); 
		}
	}
	
	function checkBtn(){
		var len = $('input:checkbox[name="ckbox"]').length;
		for (var i = 0; i < len; i++) {
			if($('input:checkbox[name="ckbox"]')[i].checked){
				$("#"+inputTag[i]).attr("disabled",false); 
			}else{
				$("#"+inputTag[i]).attr("disabled",true); 
			}
		}
	}
	
	function updateProductFun(){
		var url = "updateProduct";
		var type = "json";
		var param = {};
		var cnt = 0;
		var len = $('input:checkbox[name="ckbox"]').length;
		for (var i = 0; i < len; i++) {
			if($('input:checkbox[name="ckbox"]')[i].checked){
				cnt++;
				param[inputTag[i]] = $("#"+inputTag[i]).val();
			}
		}
		if(Object.keys(param).length == 0){
			alert("변경할 상품정보가 없습니다.");
			return;
		}
		param.proCd = $("#PRODUCT_CODE").val();
		if(param.PRODUCT_PRICE != "" && param.PRODUCT_PRICE != null){
			param.PRODUCT_PRICE = param.PRODUCT_PRICE.replaceAll(",","");
		}
		callAjax(url, type, param);
	}
	
	function formatPrice(param, id){
		var paramVal = "";
		if(param.value == "" ){
			return;
		}
		paramVal = param.value.replaceAll(",","");
		paramVal = paramVal.toLocaleString();
		$("#"+id).val(parseInt(paramVal).toLocaleString());
	}
	
// 	function closeBtn(row){
// 		$("#btn"+row).css("display","none");
// 	}
	
	
	function callAjax(url, type, param){
		$.ajax({
			type : "POST",
			url : url,
			dataType : type,
			data : param,
			success : function(rdata, status, xhr) {
				if(url == "updateProduct"){
					if(rdata.upDate == 1){
						alert("상품정보가 정상적으로 수정되었습니다.");
						$("#closebtn").click();
						$('#productList').DataTable().ajax.reload();
						$('input:checkbox[name="ckbox"]').prop('checked',false);
					}
				}
				else if(url == "deleteProduct"){
					if(rdata.deleteVal == 1){
						alert("상품이 정상적으로 삭제되었습니다.");
						$('#productList').DataTable().ajax.reload();
					}
				}else if(url == "insertProduct"){
					if(rdata.insertVal == 1){
						alert("상품이 정상적으로 등록되었습니다.");
						$("#closebtn2").click();
						$('#productList').DataTable().ajax.reload();
					}
				}
			}, 
			error : function(xhr, status, error) {
			   console.log("error");
			   return false;
			}
		});
	}
	
// 	function over(val) {
//		var target = document.getElementsByName("tooltip-text"+val)[0];
//		target.style='display:block;'
//		target.classList.remove("tooltip-text:before");
//		target.classList.add("tooltip-text");
//	};

//	function leave(val) {
//		var target = document.getElementsByName("tooltip-text"+val)[0];
//		target.style='display:none;'
//		target.classList.add("tooltip-text:before");
//		target.classList.remove("tooltip-text");
//	};	
	
</script>




</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">테이블이다.</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">
							1. 이름 길면 툴팁 <br>
							2. 상품 수정, 등록 버튼 누르면 창 하나 띄워서 <br>
							3. 삭제 버튼 클릭시 해당 라인 진짜 삭제 할건지 물어보는 창 띄우고 ㅇㅇ 누르면 삭제  <br>
							 <a target="_blank" href="https://datatables.net/">official
								DataTables documentation</a> .
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 예시라고한다.<button style=float:right; type="button" data-bs-toggle="modal" data-bs-target='#staticBackdrop2'>상품등록</button>
						</div>
						<div class="card-body" >
						<form>
							<table id="productList" style="table-layout:auto; border:1px solid ; font-size:14px;">
								<thead >
									<tr>
										<th>상품코드</th>
										<th>상품명</th>
										<th>이미지</th>
										<th>상품설명</th>
										<th>가격</th>
										<th>재고</th>
										<th>카테고리</th>
										<th>제조사</th>
										<th>배송료</th>
										<th>상태</th>
										<th>등록일</th>
										<th>수정일</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
							</table>
						</form>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	
		<!--  모달창 써본다.  -->
<!-- *********************************************************************	 -->

	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div><b>상품등록</b></div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
					<form id="inquireForm2" action="#">
						<div class="modal-body"> 
							<span>상품코드</span> 
							<input name="" id="PUT_PRODUCT_CODE" type="text" style="width: 100%;" value="">
							<span>상품명</span> 
							<input name="" id="PUT_PRODUCT_NAME" type="text" style="width: 100%;" value="">
							<span>이미지</span> 
							<input name="" id="PUT_PRODUCT_IMG" type="text" style="width: 100%;" value="">
							<span>상품설명</span> 
							<input name="" id="PUT_PRODUCT_CONTEXT" type="text" style="width: 100%;" value="">
							<span>가격</span> 
							<input name="" id="PUT_PRODUCT_PRICE" type="text" style="width: 100%;" value=""onblur="formatPrice(this,'PUT_PRODUCT_PRICE')"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<span>재고</span> 
							<input name="" id="PUT_PRODUCT_STOCK" type="number" style="width: 100%;" value="">
							<span>카테고리</span> 
							<input name="" id="PUT_CATEGORY_CODE" type="text" style="width: 100%;" value="">
							<span>제조사</span> 
							<input name="" id="PUT_PRODUCT_COMPANY" type="text" style="width: 100%;" value="">
							<span>배송료</span> 
							<input name="" id="PUT_PRODUCT_DELIP" type="number" style="width: 100%;" value="">
<!-- 							<span>상태</span>  -->
<!-- 							<input name="" id="" type="text" style="width: 100%;" value=""> -->
						</div>
					</form>
	
				<div class="modal-footer">
					<button type="button" style="background-color: #6aa338; color: white;" id="inquireBut" class="btn btn-primary" onclick="insertProduct()">저장</button>
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal" onclick="" id="closebtn2">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div><b>상품수정</b></div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
					<form id="inquireForm" action="#">
						<div class="modal-body"> 
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()" style="display:none;"><span>상품코드</span>
							<input name="" id="PRODUCT_CODE" type="number" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>상품명</span>
							<input name="" id="PRODUCT_NAME" type="text" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>이미지</span>
							<input name="" id="PRODUCT_IMG" type="text" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>상품설명</span>
							<input name="" id="PRODUCT_CONTEXT" type="text" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>가격</span>
							<input name="" id="PRODUCT_PRICE" type="text" style="width: 100%;" value="" onblur="formatPrice(this,'PRODUCT_PRICE')"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>재고</span>
							<input name="" id="PRODUCT_STOCK" type="number" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>카테고리</span>
							<input name="" id="CATEGORY_CODE" type="text" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>제조사</span>
							<input name="" id="PRODUCT_COMPANY" type="text" style="width: 100%;" value="">
							
							<input name="ckbox" id="" type="checkbox" onclick="checkBtn()"><span>상태</span>
							<input name="" id="PRODUCT_STATUS" type="text" style="width: 100%;" value="">
						</div>
					</form>
	
				<div class="modal-footer">
					<button type="button" style="background-color: #6aa338; color: white;" id="inquireBut" class="btn btn-primary" onclick="updateProductFun()">수정</button>
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal" onclick="" id="closebtn">닫기</button>
				</div>
			</div>
		</div>
	</div>
<!-- *********************************************************************	 -->
	
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
