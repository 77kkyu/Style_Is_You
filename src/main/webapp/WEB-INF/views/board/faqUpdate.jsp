<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />
<body>

	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.NOTICE_NO }
						<input type="hidden" id="NOTICE_NO" name="NOTICE_NO" value="${map.NOTICE_NO }">
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.MEMBER_NO }</td>
					<th scope="row">작성시간</th>
					<td>${map.NOTICE_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" class="wdp_90" value="${map.NOTICE_TITLE }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateNotice();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteNotice();
			});
			
		});
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateNotice(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/updateNotice.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteNotice(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/deleteNotice.do' />");
			comSubmit.addParam("NOTICE_NO", $("#NOTICE_NO").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>