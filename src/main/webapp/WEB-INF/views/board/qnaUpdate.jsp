<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	String sessionName = (String) session.getAttribute("MEMBER_NAME");
	String sessionId = (String) session.getAttribute("MEMBER_ID");
%>
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
	<br>
	<br>
	<h2>QNA상세</h2>
	<br>
	<form id="frm" name="frm" enctype="multipart/form-data">
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
					<td align="center">${map.QNA_NO } <input type="hidden"
						id="QNA_NO" name="QNA_NO" value="${map.QNA_NO }">
					</td>
					<th scope="row">문의유형</th>
					<td id="qna_gubunaa" colspan="2" align="center"></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td align="center"><%=sessionId%></td>
					<th scope="row">작성시간</th>
					<td align="center">${map.QNA_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3" align="left">${map.QNA_TITLE }</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text" align="left">${map.QNA_CONTENT }</td>
				</tr>
			</tbody>
			<tr>
				<td colspan="4" class="view_an"><textarea rows="10" cols="140"
						title="답변" id="qna_an" name="QNA_AN"></textarea></td>
			</tr>
		</table>
	</form>

	<p>
		<a href="#this" class="btn" id="list">목록으로</a> <a href="#this"
			class="btn" id="update">저장하기</a>
	</p>

	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openQnaList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateQna();
			});
		});

		function fn_openQnaList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/openQnaList.do' />");
			comSubmit.submit();
		}

		function fn_updateQna() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/qna/updateQna.do' />");
			comSubmit.submit();
		}

		function fn_deleteQna() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/deleteQna.do' />");
			comSubmit.addParam("QNA_NO", $("#QNA_NO").val());
			comSubmit.submit();
		}

		function init() {
			fn_QNA_GUBUN();
		}

		function fn_QNA_GUBUN() {
			var gubn = "${map.QNA_CATEGORY}";
			html = ''
			if (gubn == "61") {
				html += '<span>상품문의 드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			} else if (gubn == "62") {
				html += '<span>배송문의 드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			} else if (gubn == "63") {
				html += '<span>배송전 변경, 취소 문의드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			} else if (gubn == "64") {
				html += '<span>교환, 반품 문의드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			} else if (gubn == "65") {
				html += '<span>입금결제 문의드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			} else if (gubn == "66") {
				html += '<span>기타문의드려요~♥</span>';
				$("#qna_gubunaa").append(html);
			}
		}

		init();
	</script>
</body>
</html>