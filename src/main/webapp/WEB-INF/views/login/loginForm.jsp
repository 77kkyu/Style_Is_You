<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>


<script type="text/javascript">
	if('${message}' != "") {
			alert('${message}');
		}
</script>


</head>
<body>
	<h3 align="center">로그인</h3>
	<form name="frm" method="POST" action="/stu/loginAction.do">
	<table align="center">
			<input type="hidden" name="MEMBER_NO">
			<input type="hidden" name="MEMBER_NAME">
		<tr>
			<td>
				<input type="text" name="MEMBER_ID" placeholder="아이디" size="39" style="padding:10px;">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="MEMBER_PASSWD" placeholder="비밀번호" size="40" style="padding:10px;">
			</td>
		</tr>
	</table>
		<p align="center">
			<input type="submit" value="로그인" style="padding:10px;">
		</p>
	</form>
		<p align="center">
			<a href="/stu/joinForm.do">회원가입</a> |
			<a href="/stu/findId.do">아이디 찾기</a> |
			<a href="/stu/findPw.do">비밀번호 찾기</a>
		</p>
</body>
</html>