<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	

	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertNotice();
			});

		});
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertNotice(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertNotice.do' />");
			comSubmit.submit();
		}

	</script>
</body>
</html>