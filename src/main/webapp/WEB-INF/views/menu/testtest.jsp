<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<script>	
		 function pwchkfn() {
	   			//모달창 보이게 처리
	   			const pw = $("#chkpw").val();
				 $.ajax({
						type : "POST",
						url : "dlfmaqusrudgkrl",
						dataType : "text",
						data : {
							"chkpw" : pw
						},
						success : function(data, status, xhr) {
							console.log(data);
							data=true;
						}, 
						error : function(xhr, status, error) {
							console.log("error");
							return false;
						}//error
					});//ajax
		 }
	</script>
		
비밀번호 
<input type="password" id="chkpw"><br>
<button id="btn" onclick="pwchkfn()"> 전송</button>
</body>
</html>