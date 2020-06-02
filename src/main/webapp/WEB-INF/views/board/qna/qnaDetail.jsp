<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
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
				<td>${map.NOTICE_NO }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.MEMBER_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.NOTICE_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.NOTICE_CONTENT }</td>
			</tr>
		</tbody>
	</table>
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
			var idx = "${map.NOTICE_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeUpdate.do' />");
			comSubmit.addParam("NOTICE_NO", idx);
			comSubmit.submit();
		}
		
	</script>
</body>
</html>