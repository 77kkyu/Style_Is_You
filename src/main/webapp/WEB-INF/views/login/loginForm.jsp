<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>로그인 폼</title>

<script type="text/javascript">
	if('${message}' != "") {
			alert('${message}');
		}
</script>

<style>
	a {
		text-decoration:none;
	}
	
	.Action {
		border:1px solid #bebebe;
		font-size:20px;
		width:410px;
		height:50px;
		background-color:salmon;
		color:white;
	}
</style>



</head>
<body>
<br><br><br>
	<h3 align="center" style="font-size:40px;">로그인</h3>
	<form name="frm" method="POST" action="/stu/loginAction.do">
	<table align="center" cellspacing="15" width="300" style="margin:auto;">
			<input type="hidden" name="MEMBER_NO">
			<input type="hidden" name="MEMBER_NAME">
			<input type="hidden" name="MEMBER_PHONE">
			<input type="hidden" name="MEMBER_EMAIL">
			<input type="hidden" name="MEMBER_ZIPCODE">
			<input type="hidden" name="MEMBER_ADDR1">
			<input type="hidden" name="MEMBER_ADDR2">
			<input type="hidden" name="MEMBER_BIRTH">
		<tr>
			<td>
				<input type="text" name="MEMBER_ID" placeholder="아이디" size="50" style="padding:15px;" maxlength="20">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="MEMBER_PASSWD" placeholder="비밀번호"size="50" style="padding:15px;" maxlength="15">
			</td>
		</tr>
	</table>
		<p align="center">
			<input type="submit" class="Action" value="로그인">
		</p>
	</form>
	
	<br>
	<br>
	<br>
	
		<p align="center" style="margin-left:7px;font-size:18px;">
			<a href="/stu/joinForm.do">회원가입</a> |
			<a href="/stu/findId.do">아이디 찾기</a> |
			<a href="/stu/findPw.do">비밀번호 찾기</a>
		</p>
</body>
</html>