<%@page import="com.example.dto.UserDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.example.dto.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="resources/css/comments.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/commu.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		var replybt = 0;
		$(".butten").on("click", function() {
			if (replybt % 2 === 0) {
				replybt++;
				var data = $(this).attr("data-xxx");
				$("#com" + data).css("display", "block");
			} else {
				replybt++;
				var data = $(this).attr("data-xxx");
				$("#com" + data).css("display", "none");

			}
		})
		$(".butten2").on("click", function() {
			var repdata0 = $(this).attr("data-xxx"); //태그된 유저 넘버
			console.log(repdata0)
			var repp = $(this).val();
			console.log(repp) //srereply${comment.COMMENTS_NO}
			$("#rereply" + repdata0).val(repp);
			$("#srereply" + repdata0).text(repp + "/"); //태그된 유저 +/
			$("#TAGGED_USER").val(repp);

		})

		$(".commentsdel").on("click", function() {
			var commentsNO = $(this).attr("data-xxx");
			console.log("넘길값" + commentsNO);
			$.ajax({
				url : 'commentsdel',
				type : 'post',
				dataType : 'text',
				data : {
					commentsNO : $(this).attr("data-xxx")
				},
				success : function(data, status, xhr) {
					$(".replycss" + commentsNO).val("삭제된 댓글입니다");
				},
				error : function(xhr, status, error) {
					console.log("에러");
				}
			})//end commentsdel

		})
		//대댓글 삭제
		$(".replydel").on("click", function() {
			var replyNO = $(this).attr("data-xxx");
			console.log("넘길값" + replyNO);
			$.ajax({
				url : 'replydel',
				type : 'post',
				dataType : 'text',
				data : {
					replyNO : $(this).attr("data-xxx")
				},
				success : function(data, status, xhr) {
					$("#tagreply"+replyNO).text("");
					$("#replycon"+replyNO).text("삭제된 댓글입니다");
				},
				error : function(xhr, status, error) {
					console.log("에러");
				}
			})//end replydel

		})

	})
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true" />

	<br>
	<div class="commucss">
		<div class="md-2">
			<div class="commumenu md-8">
				<div class="commuTi">
					<!-- 				제목,이름 날짜 -->
					<div class="commuT2">${onecommu.COMMU_TITLE}</div>
					<div style="font-weight: bold; margin-bottom: 2px;">작성자:
						${onecommu.USER_ID}</div>${onecommu.COMMU_REGISTRATION}
				</div>
				<hr>
				<div>${onecommu.COMMU_SUMMER}</div>
				<hr>
				<form action="commentsadd">
					<!-- 				<div class="commentcss"> -->
					<input type="hidden" name="commuNo" id="commuNo"
						value="${onecommu.COMMU_NO}"> <input type="text"
						class="commentcss" style="border: 0;" placeholder="댓글을 입력하세요."
						name="commentsCon">
					<!-- 				</div> -->
					<button type="submit" class="commentbtcss">등록</button>
				</form>

				<div class="ALlreply">
					<table>
						<c:forEach var="comment" items="${comments}">
							<tr>
								<td class="oneteply1">
									<hr
										style="border: solid 0.5px Gainsboro; transform: scaleY(0.1);">
									<div class="commentsUser">${comment.USER_ID}</div> <c:if
										test="${comment.COMMENTS_STATUS eq 'N'}">
										<input class="replycss replycss" value="삭제된 댓글입니다.">
									</c:if> <c:if test="${comment.COMMENTS_STATUS eq 'Y'}">
										<input class="replycss replycss${comment.COMMENTS_NO}"
											value="${comment.COMMENTS_CONTENT}">
									</c:if> <br> <span style="font-size: 13px;">${comment.COMMENTS_REGISTRATION}</span>
									<button type="button" class="butten"
										data-xxx="${comment.COMMENTS_NO}">&nbsp; 답글</button> <c:if
										test="${comment.USER_ID eq userId}">
										<a href="#" data-toggle="modal"
											data-target="#myModal${comment.COMMENTS_NO}">삭제</a>
										<!-- 모댓글 삭제 -->
										<form action="#">
											<div class="modal fade" id="myModal${comment.COMMENTS_NO}"
												data-bs-backdrop="static" data-bs-keyboard="false"
												tabindex="-1" aria-labelledby="staticBackdropLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div
															style="font-size: 16px; text-align: center; font-weight: bold;">삭제하시겠습니까?</div>
														<div class="modal-footer" style="border-top: clear;">

															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">닫기</button>

															<button type="button" data-xxx="${comment.COMMENTS_NO}"
																style="background-color: #6aa338; color: white;"
																data-dismiss="modal" class="btn btn-primary commentsdel">삭제</button>
														</div>
													</div>
												</div>
											</div>
										</form>
									</c:if>

									<div class="comment_form" id="com${comment.COMMENTS_NO}">
										<!-- 대댓글 리스트 보여주기 -->
										<div>
											<c:if test="${!empty replys}">

												<c:forEach var="reply" items="${replys}">
													<c:forEach var="repl" items="${reply}">

														<c:if test="${comment.COMMENTS_NO eq repl.COMMENTS_NO}">
															<div class="replycss">
																<div class="replyUser">${repl.USER_ID}</div>

																<c:if test="${repl.COMMENTS_STATUS eq 'N'}">
																	<input class="replycss replycss" value="삭제된 댓글입니다.">
																</c:if>
																<c:if test="${repl.COMMENTS_STATUS eq 'Y'}">
																	<span id="tagreply${repl.REPLY_NO}"style="color: blue;">${repl.TAGGED_USER}</span>
																<span id="replycon${repl.REPLY_NO}">${repl.COMMENTS_CONTENT}</span><br>
																	<span style="font-size: 13px;">
																		${repl.COMMENTS_REGISTRATION}</span>
																	<button type="button" class="butten2"
																		value="${repl.USER_ID}"
																		data-xxx="${comment.COMMENTS_NO}">답글작성</button>
																</c:if>
																<c:if test="${repl.USER_ID eq userId}">
																		<a href="#" data-toggle="modal" data-target="#myModa2${repl.REPLY_NO}">삭제</a>
																	<div class="modal fade" id="myModa2${repl.REPLY_NO}"
																		data-bs-backdrop="static" data-bs-keyboard="false"
																		tabindex="-1" aria-labelledby="staticBackdropLabel"
																		aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div
																					style="font-size: 16px; text-align: center; font-weight: bold;">삭제하시겠습니까?</div>
																				<div class="modal-footer" style="border-top: clear;">

																					<button type="button" class="btn btn-secondary"
																						data-dismiss="modal">닫기</button>
																					<button type="button"
																						data-xxx="${repl.REPLY_NO}"
																						style="background-color: #6aa338; color: white;"
																						data-dismiss="modal"
																						class="btn btn-primary replydel">삭제</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</c:if>
															</div>
														</c:if>
													</c:forEach>
												</c:forEach>
											</c:if>
											<form action="replyadd" method="post" id="replyaddForm">
												<!-- 모댓글 번호 -->
												<input type="hidden" name="TAGGED_USER" id="TAGGED_USER"
													value=""> <input type="hidden" name="COMMENTS_NO"
													id="ccc" value="${comment.COMMENTS_NO}">
												<!-- 태그된 유저 -->
												<input type="hidden" name="rereply"
													id="rereply${comment.COMMENTS_NO}" value="" />
												<!-- 커뮤니티 번호 -->

												<!-- 답글 작성 눌렀을 때 나오게 -->
												<c:if test="${comment.COMMENTS_STATUS eq 'Y'}">
													<span id="srereply${comment.COMMENTS_NO}"></span>
												</c:if>
												<input type="hidden" name="COMMU_NO"
													value="${onecommu.COMMU_NO}" />
												<c:if test="${comment.COMMENTS_STATUS eq 'Y'}">
													<input type="text"
														class="replybutt${comment.COMMENTS_NO} rereply"
														style="border: 0; width: 600px; background-color: #f5f6fa;"
														placeholder="답글을 입력하세요." name="REPLY_CON" value="">
													<button id="recommentbtcss${comment.COMMENTS_NO}">등록</button>
												</c:if>
											</form>
										</div>
									</div>
								</td>

							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="md-2"></div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/bottom.jsp" flush="true" />
	<br>
</body>
</html>





