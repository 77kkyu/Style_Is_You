<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<h3 align="center">아이디 찾기</h3>
	
	<form name="frm" method="post" action="/stu/findIdAction.do">
	<table align="center">
		<tr>
			<td>
				<input type="text" name="MEMBER_NAME" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="MEMBER_PHONE" placeholder="휴대전화 입력">
			</td>
		</tr>
			<input type="hidden" name="MEMBER_ID">
	</table>
		<p align="center">
		<input type="submit" value="아이디 확인"> &nbsp;
		<input type="reset" value="취소">
		</p>
	</form>
</body>
</html>