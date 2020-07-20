<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css"	href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
</head>
<style>

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  
</style>
<body>
	<br />
	<br />
	<br />
	<h2>FAQ</h2>
	<br />
	<br />
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>글수정</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.NOTICE_NO } <input type="hidden" id="NOTICE_NO"
						name="NOTICE_NO" value="${map.NOTICE_NO }">
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.MEMBER_NAME }</td>
					<th scope="row">작성시간</th>
					<td>${map.NOTICE_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="NOTICE_TITLE"
						name="NOTICE_TITLE" class="wdp_90" value="${map.NOTICE_TITLE }" />
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openFaqList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateFaq();
			});

			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_deleteFaq();
			});

		});

		function fn_openFaqList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq/openFaqList.do' />");
			comSubmit.submit();
		}

		function fn_updateFaq() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/faq/updateFaq.do' />");
			comSubmit.submit();
		}

		function fn_deleteFaq() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq/deleteFaq.do' />");
			comSubmit.addParam("NOTICE_NO", $("#NOTICE_NO").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>