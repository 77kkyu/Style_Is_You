<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트 코딩페이지</title>
</head>
<body>
<table>
	<tr>
		<td>#{NOTICE_NO}</td>
		<td class='notice_title'><a href='#this' name='notice_title'>
				+ value.NOTICE_TITLE + </a> <input type='hidden' name='notice_title'
			value=" + value.NOTICE_NO + "></td>
		<td>+ value.NOTICE_DATE +</td>
	</tr>
</table>
</body>
</html>