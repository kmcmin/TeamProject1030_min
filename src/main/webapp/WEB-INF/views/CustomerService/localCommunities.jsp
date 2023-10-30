<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--부트 스트랩 css-->
<link type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!--부트 스트랩 js-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/commu.css" />
<script type="text/javascript">
	$(function() {
		$("#commuWrite").on("click", function() {
			location.href="communityForm";
		})
	})
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true" />
	<br>
	<div class="container">
		<div class="row">
			<div class="md-2"></div>
			<div class="commumenu md-8">
				<div align="right">
					<form action="" id="" method="get">
						<select id="" class="" name="type">
							<option value="full" selected>전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="text" name="keyword" placeholder="검색어 입력" class=""
							id="">
						<button type="submit" class="btn btn-light btnCsSearch" id="">검색</button>
					</form>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" style="width: 50px;">유형</th>
							<th scope="col" style="width: 420px;">제목</th>
							<th scope="col" style="width: 100px;">작성자</th>
							<th scope="col" style="width: 80px;">작성일</th>
							<th scope="col" style="width: 50px;">조회</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="commu" items="${commus}">
						<tr>
							<th scope="row">1</th>
							<td><a href="communityRetrieve?COMMU_NO=${commu.COMMU_NO}">${commu.COMMU_TITLE}</a></td>
							<td>${commu.USER_ID}</td>
							<td>${commu.COMMU_REGISTRATION}</td>
							<td>0</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id="commuWrite">작성하기</button>
			</div>
			<div class="md-2"></div>
		</div>
	</div>
	<jsp:include page="../common/bottom.jsp" flush="true" />
	<br>
</body>
</html>