<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 리뷰 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	//파일 추가
	function addFile() {
		var str = "<div class='file-group'><input type='file' name='files'><a href='#this' name='file-delete'>삭제</a></div>";
		$("#file-list").append(str);
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
	}
	//파일선택 삭제
	function deleteFile(obj) {
		console.log("이건가2")
		obj.parent().remove();
	}
</script>
</head>
<body>
	<h2>리뷰 작성</h2>
	<form id="reviewForm" action="reviewAdd" enctype="multipart/form-data"
		method="post">
		<h3>제목</h3>
		<textarea style="width: 500px; height: 40" name="reviewTitle"></textarea>
		<input type="hidden" value="${pCode}" name="pCode">
		<h3>내용 ${pCode}</h3>
		<textarea id="REVIEW_CONTENT" name="reviewtext"
			style="height: 200px; width: 500px;"></textarea>
		<br>
		<h3>이미지 첨부</h3>
		<div class="form-group" id="file-list">
			<a href="#this" onclick="addFile()">파일추가</a>
			<div class="file-group">
				<input type="file" name="files"><a href='#this'
					name='file-delete'>삭제</a>
			</div>
		</div>
		<br>
		<button type="submit">등록</button>
	</form>

</body>
</html>