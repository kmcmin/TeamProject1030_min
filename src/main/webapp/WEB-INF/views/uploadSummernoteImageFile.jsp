<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
	<div class="container">
		<h2>게시판 글 수정 및 삭제</h2>
		<form name="form" action="commuAdd">
			<div class="form-group">
				<!-- 제목 -->
				<label for="title">제목</label>
				<!-- required 속성을 설정하면 필수입력 사항이된다. -->
				<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
				<input type="text" class="form-control" id="title"
					placeholder="제목 입력(4-100)" name="commutitle" maxlength="100"
					required="required" pattern=".{4,100}" value="">
			</div>
			<div class="form-group">
				<!-- 내용 -->
				<label for="content">내용</label>
				<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
				<textarea class="form-control" rows="5" id="summernote"
					name="commucontent" placeholder="내용 작성"></textarea>
			</div>

			<button type="submit" class="btn btn-default test">등록</button>
			<button type="submit" class="btn btn-default">삭제</button>
		</form>
	</div>
</body>
<script>

$('#summernote').summernote({
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
			uploadSummernoteImageFile(files[0],this);
		},
		onPaste: function (e) {
			var clipboardData = e.originalEvent.clipboardData;
			if (clipboardData && clipboardData.items && clipboardData.items.length) {
				var item = clipboardData.items[0];
				if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
					e.preventDefault();
				}
			}
		}
	}
});
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
			$("#urldata1").val(data.url);
			console.log($("#urldata1").val())
        	//항상 업로드된 파일의 url이 있어야 한다.
//         	console.log(data.url)
			$(editor).summernote('insertImage', data.url);
		}
	});
}

</script>

</html>