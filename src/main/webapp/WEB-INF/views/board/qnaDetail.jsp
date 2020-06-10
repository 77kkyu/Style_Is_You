<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
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
				<td>${map.QNA_NO }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.MEMBER_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.QNA_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.QNA_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.QNA_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	
	<table class="board_view">
		<tr>
				<td><br/>
				${map.QNA_DATE } <br/>
				${map.QNA_CONTENT } <br/>
				</td>

		</tr>
	</table>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openQnaList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openQnaUpdate();
			});

		});
		
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openQnaList.do' />");
			comSubmit.submit();
		}
		
		function fn_openQnaUpdate(){
			var idx = "${map.QNA_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openQnaUpdate.do' />");
			comSubmit.addParam("QNA_NO", idx);
			comSubmit.submit();
		}
		
	</script>
</body>
</html>