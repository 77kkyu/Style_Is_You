<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>

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
	<input type="hidden" id="member_no" name="MEMBER_NO" value="${SESSION_NO}"> 
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>글쓰기</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="notice_title" name="NOTICE_TITLE"
						class="wdp_90"></input>
					</td>
					
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="notice_content" name="NOTICE_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<p>
		<a href="#this" class="btn" id="write">작성하기</a> <a href="#this"
			class="btn" id="list">목록으로</a>
	</p>

	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
	
		var gfv_count = 1;

		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openFaqList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertFaq();
			});

		});

		function fn_openFaqList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq/openFaqList.do' />");
			comSubmit.submit();
		}

		function fn_insertFaq() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/faq/insertFaq.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>