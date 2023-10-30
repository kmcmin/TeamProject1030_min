<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/main.css" rel="stylesheet" type="text/css">
<title>주문 목록</title>
</head>
<body>
<div id="divTop">
	<jsp:include page="common/top.jsp" flush="true"/> <br>
</div>
	<jsp:include page="order/orderList.jsp" flush="true"/> <br>
	<div id="divBottom">
		<jsp:include page="common/bottom.jsp" flush="true"/> <br>
	</div>
</body>
</html>