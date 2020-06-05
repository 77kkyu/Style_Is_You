<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<style>
	.Action {
		border:2px solid black;
		background-color:white;
		padding:10px;
		width:250px;
		height:60px;
	}
	.Action2 {
		border:1px solid black;
		width:120px;
		height:40px;
		background-color:#000000;
		color:white;
	}
	.no {
		border:2px solid black;
		background-color:white;
		width:80px;
		height:40px;
	}
</style>

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<h3 align="center" style="font-size:30px;">비밀번호 찾기</h3>
	<br>
	<br>
	<!-- <p align="center">
		<a href="/stu/findPw.do">휴대전화로 찾기</a>
		<a href="/stu/findPw2.do">이메일로 찾기</a>
	</p> -->
	
	<p align="center">
	<button type="button" class="Action" onclick="location.href='/stu/findPw.do'">휴대전화로 찾기</button>
	<button type="button" class="Action" onclick="location.href='/stu/findPw2.do'">이메일로 찾기</button>
	</p>
	
	<br>
	<br>
	
	<form name="frm" method="post" action="/stu/findPw2Action.do">
	<table align="center" width="500" style="margin:auto;">
			<input type="hidden" name="MEMBER_ID" value="${MEMBER.MEMBER_PASSWD }">
		<tr>
			<td>
				<input type="text" name="MEMBER_NAME" placeholder="이름 입력" size="80" style="padding:15px;margin-bottom:5px;">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="MEMBER_EMAIL" placeholder="이메일 입력" size="80" style="padding:15px;">
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
		<p align="center">
		<input type="submit" class="Action2" value="비밀번호 확인"> &nbsp;
		<input type="reset" value="취소" class="no" onclick="history.back();">
		</p>
	</form>
</body>
</html>