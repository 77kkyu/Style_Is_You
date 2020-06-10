<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
<body>

<form method="post">
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>공지사항</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.NOTICE_NO }</td>
				<th scope="row"></th>
				<td></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>관리자</td>
				<th scope="row">작성시간</th>
				<td>${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.NOTICE_TITLE }</td>
			</tr>
			<tr>
				<th scope="row">
				<input type="hidden" name="notice_content" value="notice_content">내용</th>
				<td colspan="4">${map.NOTICE_CONTENT }</td>
			</tr>
		</tbody>
	</table>
</form>
	<br/>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openNoticeUpdate();
			});

		});
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeList.do' />");
			comSubmit.submit();
		}
		
		function fn_openNoticeUpdate(){
			var notice_no = "${map.NOTICE_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeUpdate.do' />");
			comSubmit.addParam("NOTICE_NO", notice_no);
			comSubmit.submit();
		}
		
	</script>
</body>
</html>