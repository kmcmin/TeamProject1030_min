<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@page import="com.example.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="resources/main.css" rel="stylesheet" type="text/css">
    
   <link rel="stylesheet" href="resources/css/changeUser.css">
   
<meta charset="UTF-8">
<title>팀플젝 메인</title>
</head>
<body>
<script>
//세션에 담아둔 경고문구가 있다면 출력 후 해당 메세지 담은 세션 삭제
<%if(session.getAttribute("mesg")!=null){ %>
   alert("<%=session.getAttribute("mesg")%>");
<%   session.removeAttribute("mesg");} %>
</script>

   <jsp:include page="common/top.jsp" flush="true"/> <br>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
   
   
  <div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로-->
        <img class="d-block w-100" src="resources/img/2309.png" alt="First slide">
<!--           <div class="carousel-caption d-none d-md-block"></div> -->
      </div>
         <div class="carousel-item">
           <img class="d-block w-100" src="resources/img/e.png" alt="First slide">
         </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="resources/img/f.png" alt="First slide">
      </div>
    </div>
    <!-- / 슬라이드 쇼 끝 -->
    
    <!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 -->
   <div id="eventPopup1" style="border-radius:20px; position: absolute; display:none; left: 200px; top: 0px; border:2px solid transparent; width:426px; height:473px; border-top-right-radius: 0;">
<!--    <div id="eventPopup1" style="border-radius:20px; display:none; left: 200px; top: 160px; position: fixed; border:2px solid 4390e1; width:450px; height:453px; "> -->
         <div style="padding:10px; background: transparent; webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius :20px; margin:0 auto; overflow:hidden; width:426px; height:473px;">
<!--             <iframe src="https://sahubconn001.blob.core.windows.net/ct-sahubconn001/img/newshop/popup/231002_popup02pc.jpg" width="290px" height="290px"></iframe> -->
<!--             <iframe src="https://sahubconn001.blob.core.windows.net/ct-sahubconn001/img/newshop/popup/231023_popup01pc.jpg" width="100%" height="100%"></iframe> -->
            <img src="resources/img/food/iframImg2.png" style="border-radius: 5px;"></img>
         </div>
         <div style='clear:both; overflow:hidden; background:#fff; padding:15px 30px; border-radius:20px;'>
            <input type="checkbox" id="eventCookie1" value="0"> &nbsp;&nbsp;&nbsp;오늘 그만 보기
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <button onclick='mainlayerPopdel("eventPopup1","eventCookie1")'>닫기</button>
         </div>
     </div>
   <div id="eventPopup2" style="border-radius:20px; position: absolute; display:none; left: 640px; top: 0px; border:2px solid transparent; width:490px; height:610px; border-top-right-radius: 0;">
<!--       <div style="padding:10px; background: transparent; webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius :20px; margin:0 auto; overflow:hidden; width:426px; height:473px;"> -->
<!--          <iframe src="https://img.choroc.com/newshop/popup/230707_popup1pc.jpg" width="100%" height="100%"></iframe> -->
<!--       </div> -->
      <div style='width:480px; height:600px; clear:both; overflow:hidden; background:#fff; padding:10px; border-radius:20px; text-align: center;'>
         <div style='text-align: center;'>
<!--             <iframe src="https://img.choroc.com/newshop/popup/230707_popup1pc.jpg" style="width:90%; height:550px; border-radius:20px;"></iframe> -->
            <img src="resources/img/food/iframImg2.png" style="border-radius: 5px;"></img>
         </div>
         <input type="checkbox" id="eventCookie2" value="0">오늘 그만 보기
          <button onclick='mainlayerPopdel("eventPopup2","eventCookie2")'>닫기</button>
      </div>
     </div>
     
<!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 -->
    
    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" style="margin-top: 380px;" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </a>
    <a class="carousel-control-next" style="margin-top: 380px;" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
<!--       <span style="font:bold; color:green;">Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>
  
      <div class="row featurette">
         <!-- -------------------------템플릿 1------------------------- -->
         <div style="text-align:center; margin-bottom: 100px; font-size:22px;">
            <h2><b>매일 먹는 밥 이건 어때요?</b></h2>
            <p style="margin-bottom: 50px;">몸과 마음을 따듯하고 든든하게 채워주는 건강한 집 밥 제안.</p>
            
            <div style="height: 300px; padding: 1% 15% 0 25%">
               <div style="float: left;">
                  <h4 style="text-align:left; color: green;">맛 좋은 찰진 쌀</h4>
                  <p style="text-align:left;"> 율목영농조합법인, 밥맛 좋은 찰진 쌀</p>
                  <p style="text-align:left;">구수한 백미와 쫀득한 찹쌀을 섞어 찰지어 밥맛이 좋고</p>
                  <p style="text-align:left;">천혜의 땅 서산에서 정성껏 재배한 믿을 수 있는 우리쌀 입니다.</p>
                  <p style="text-align:left;"><a href="http://localhost:8093/app/productDetails?product_code=002001000218">상세 보기 ></a></p>
               </div>
               <div style="border:1px solid transparent; float: right;">
                  <a href="http://localhost:8093/app/productDetails?product_code=002001000218">
                     <img src="resources/img/food/mainFood01.jpg" style="border-radius: 5px; width:350px; height:350px;"></img>
                  </a>
               </div>
            </div>
            
            <div style="height: 270px; padding: 3% 15% 5% 25%">
               <div style="border:1px solid transparent; float: left;">
                  <a href="http://localhost:8093/app/productDetails?product_code=002001000173">   
                     <img src="resources/img/food/mainFood02.jpg" style="border-radius: 5px; width:350px; height:350px;"></img>
                  </a>
               </div>
               <div style="float: right;">
                  <h4 style="text-align:left; color: green;">칠갑산들애 米</h4>
                  <p style="text-align:left;">우렁이로 재배한 쌀</p>
                  <p style="text-align:left;">칠갑쌀은 깨끗한 자연환경에서 우렁이를 살포해 재배하여</p>
                  <p style="text-align:left;">품질이 좋은 쌀만을 선별하여 포장합니다.</p>
                  <p style="text-align:left;"><a href="http://localhost:8093/app/productDetails?product_code=002001000173">상세 보기 ></a></p>
               </div>
            </div>
         </div>
         <!-- -------------------------템플릿 1------------------------- -->
         
         <!-- -------------------------템플릿 2------------------------- -->
<!--          <section class="main-box-section con"> -->
<!--             <div style="text-align:center;"> -->
<!--             <h2><b>ON Sale</b></h2> -->
<!--             <p>매주 달라지는 다양한 혜택을 모아모아!</p> -->
<!--          </div> -->

<!--          <div class=" min-height-50vh flex flex-jc-c flex-ai-c "> -->
<!--             <div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;"> -->
<!--                <div class="section-MyPage-body__cell"> -->
<!--                   <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img> -->
<!--                       </div> -->
<!--                       <p>해당 상품에 대한 설명필요</p> -->
<!--                        <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img> -->
<!--                        </div> -->
<!--                        <p>해당 상품에 대한 설명필요</p> -->
<!--                </div> -->
<!--             </div> -->
<!--             <div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;"> -->
<!--                <div class="section-MyPage-body__cell"> -->
<!--                   <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img> -->
<!--                       </div> -->
<!--                       <p>해당 상품에 대한 설명필요</p> -->
<!--                        <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img> -->
<!--                        </div> -->
<!--                        <p>해당 상품에 대한 설명필요</p> -->
<!--                </div> -->
<!--             </div> -->
<!--             <div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;"> -->
<!--                <div class="section-MyPage-body__cell"> -->
<!--                   <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img> -->
<!--                       </div> -->
<!--                       <p>해당 상품에 대한 설명필요</p> -->
<!--                        <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img> -->
<!--                        </div> -->
<!--                        <p>해당 상품에 대한 설명필요</p> -->
<!--                </div> -->
<!--             </div> -->
<!--             <div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;"> -->
<!--                <div class="section-MyPage-body__cell"> -->
<!--                   <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img> -->
<!--                       </div> -->
<!--                       <p>해당 상품에 대한 설명필요</p> -->
<!--                        <div class="MyPage_cell__title"> -->
<!--                          <img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img> -->
<!--                        </div> -->
<!--                        <p>해당 상품에 대한 설명필요</p> -->
<!--                </div> -->
<!--             </div> -->
<!--          </div> -->
<!--       </section> -->
      <!-- -------------------------템플릿 2------------------------- -->
      <!-- -------------------------템플릿 3------------------------- -->
         <div style="text-align:center;">
         <h2><b>NeW</b></h2>
         <p style="margin-bottom: 50px; font-size:30px; color:green;">매주 추가되는 다양한 상품을 모아모아!</p> 
            <div id=newProduct style="display: flex; padding:10px 100px 50px 100px; font-size:17px;">
<!--              <div style="margin-left:30px;"> -->
<!--                 <img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--              </div> -->
<!--              <div style="margin-left:30px;"> -->
<!--                 <img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--              </div> -->
<!--              <div style="margin-left:30px;"> -->
<!--                 <img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--              </div> -->
<!--              <div style="margin-left:30px;"> -->
<!--                 <img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--                 <p>해당 상품에 대한 설명필요</p> -->
<!--              </div> -->
            </div>
<!--             <div id=saleProduct style="display: flex; padding:10px 100px 50px 100px; font-size:18px;"> -->
<!--             </div> -->
         </div>
         <!-- -------------------------템플릿 3------------------------- -->
         
         
      </div>
  
      <hr class="featurette-divider">
  
  
   
    <!-- quickMenu -->
    <div class="quickMenuWrap"> 
    	<jsp:include page="common/quickMenu.jsp" flush="true"/> <br>
            <div>
               <button type="button" onclick="chat()"><img src="resources/img/cha.png" style="width:50px;" ></button>
            </div>
        <button onclick="gotoScrollTop()"><img src="resources/img/GoTop.png" style="width:50px; hight:50px;" ></button>
        <button onclick='cookiedel()'><img src="resources/img/cookie.png" style="width:50px; hight:50px;" ></button>
    </div>
    <!-- quickMenu -->
    
    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/js-cookie@2.2.0/src/js.cookie.min.js"></script>


<script type="text/javascript">
//화면 진입시 호출 하는 이벤트
$(document).ready(function() {
   layerPopup('eventPopup1');
   layerPopup('eventPopup2');
   newProduct();
//    saleProduct();
});


function newProduct(){
   comAjax('newProduct');
//    $.ajax({
//       url: "newProduct",
//       type: "get",
//       dataType : "json",
//       success: function (data) {
//          for(var i=0;i<data.length;i++){
//             productlist +='<div id=new'+i+' style="margin-left:30px;">';
//             var product_code = "'"+data[i].PRODUCT_CODE+"'";
//             productlist +='<img src='+data[i].PRODUCT_IMG+' onclick="productDetail('+product_code+')" style="border-radius: 5px;" width="300px;" height="300px"></img>';
//             productlist +='<p>'+data[i].PRODUCT_NAME+'</p>';
//             productlist +='</div>';
//          }
//          $("#newProduct").html(productlist);
//       },
//       error : function(err){
//          console.log('error');
//       }
//    });//end ajax
};
function saleProduct(){
	comAjax(sp,'saleProduct');
};

function comAjax(mainProduct){
	var productlist="";
// 	debugger;
	 $.ajax({
	      url: mainProduct,
	      type: "get",
// 	      data: param,
	      dataType : "json",
	      success: function (data) {
	         for(var i=0;i<data.length;i++){
	            productlist +='<div id=new'+i+' style="margin-left:30px;">';
	            var product_code = "'"+data[i].PRODUCT_CODE+"'";
	            productlist +='<img src='+data[i].PRODUCT_IMG+' onclick="productDetail('+product_code+')" style="border-radius: 5px;" width="300px;" height="300px"></img>';
	            productlist +='<p>'+data[i].PRODUCT_NAME+'</p>';
	            productlist +='</div>';
	         }
	         $('#'+mainProduct).html(productlist);
	      },
	      error : function(err){
	         console.log('error');
	      }
	   });//end ajax
};



function productDetail(code) { 
//    debugger;
    var param = code;
    location.href="productDetails?product_code="+param;
 };


// 위로가기
function gotoScrollTop() {
    $('html, body').animate({ scrollTop: '0' }, 0);
}
// 채팅
function chat(){ 
    selectMyRoom();
}

function selectMyRoom(){
   <% if(session.getAttribute("login")==null){ %>
      alert("로그인이 필요");
   <% }else{ %>
      commonAjax('getSelectMyRoom', "", 'post', function(result){
         console.log(result);
         window.open('room', 'window_name', 'width=680, height=690, location=no, status=no, scrollbars=yes');
      });
   <% } %>
}

// function goRoom(number, name){
//    location.href="moveChating?roomName="+name+"&"+"roomNumber="+number;
// }





// 메인 이벤트팝업 쿠키 없으면 보여줌, js쿠키라이브러리 씀
function layerPopup(id) {
    if (!Cookies.get(id)) {
      var popup= document.getElementById(id);
        popup.style.display = 'block';
    } 
};
// 메인 이벤트팝업 닫기 버튼
function mainlayerPopdel(eventPopup,eventCookie){
   var eventCookie=document.getElementById(eventCookie);
   if(eventCookie.checked==true){
      eventCookie.value=1;
   }else{
      eventCookie.value=0;
   }
   var expired  = parseInt(eventCookie.value);
    Cookies.set(eventPopup, 'popup_closed', { expires: expired });
    document.getElementById(eventPopup).style.display = 'none';
};
// 메인이벤트 팝업 쿠키 삭제 ( 테스트 용이라 지워도 무방 )
function cookiedel() {
   Cookies.remove('eventPopup1');
   Cookies.remove('eventPopup2');
   console.log("쿠키 삭제한다 ");
};

function commonAjax(url, parameter, type, calbak, contentType){
   $.ajax({
      url: url,
      data: parameter,
      type: type,
      contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
      success: function (res) {
         calbak(res);
      },
      error : function(err){
         console.log('error');
         calbak(err);
      }
   });
} 

</script>
   
   <jsp:include page="common/bottom.jsp" flush="true"/> <br>
</body>
</html>   