<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

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
	<h2>공지사항</h2>
	<br />
	<br />
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="*%" />
			<col width="*%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td align="center">${map.NOTICE_NO }</td>
				<th scope="row">작성시간</th>
				<td align="center">${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td align="left" left-padding="10px">${map.NOTICE_TITLE }</td>
				<th scope="row">작성자</th>
				<td align="center">관리자</td>
			</tr>
			<tr>
				<td colspan="4" align="center">${map.NOTICE_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<br />

	<p>
		<a href="#this" class="btn" id="list">목록으로</a> <a href="#this"
			class="btn" id="update">수정하기</a>
	</p>

	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
				e.preventDefault();
				fn_openNoticeUpdate();
			});

		});

		function fn_openNoticeList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/openNoticeList.do' />");
			comSubmit.submit();
		}

		function fn_openNoticeUpdate() {
			var notice_no = "${map.NOTICE_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/openNoticeUpdate.do' />");
			comSubmit.addParam("NOTICE_NO", notice_no);
			comSubmit.submit();
		}
	</script>
</body>
</html>