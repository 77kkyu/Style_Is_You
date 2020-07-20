<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	String sessionId = (String) session.getAttribute("SESSION_NAME");
	String sessionName = (String) session.getAttribute("SESSION_ID");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/uii.css'/>" />

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
	<h2>문의보기</h2>
	<br />
	<br />

	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td align="center">${map.RNUM}</td>
				<th scope="row">문의내용</th>
				<td id="qna_gubunaa" align="center"></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td align="center">${map.QNA_NAME}</td>
				<th scope="row">작성시간</th>
				<td align="center">${map.QNA_DATE}</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3" align="left">${map.QNA_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="4" align="left">${map.QNA_CONTENT}</td>
			</tr>
		</tbody>
		<tr rows="10" cols="140" title="답변">
			<th scope="row">답변</th>
			<td colspan="4" align="left" id="qna_an"><font color="blue"
				size="5px">${map.QNA_AN}</font></td>
		</tr>
	</table>
	<br />

	<p>
		<a href="#this" class="btn" id="list">목록으로</a> <a href="#this"
			style="display: none;" class="btn" id="update">수정/답변하기</a>
	</p>

	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openQnaList();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
				e.preventDefault();
				fn_openQnaUpdate();
			});
	<%
	if (sessionId.trim().equals("admin")) {
	%>
		$("#update").show();
	<%
	} else {
		
	}
	%>
		});

		function fn_openQnaList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/openQnaList.do' />");
			comSubmit.submit();
		}

		function fn_openQnaUpdate() {
			var idx = "${map.QNA_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/openQnaUpdate.do' />");
			comSubmit.addParam("QNA_NO", idx);
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