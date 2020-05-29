<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<h3 align="center">회원가입</h3>
	<form name="frm" method="post" action="/stu/joinAction.do">
		<table align="center">
				<input type="hidden" name="member_no">
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_ID" placeholder="아이디 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="password" name="MEMBER_PASSWD" placeholder="비밀번호 입력 *" size="41" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_NAME" placeholder="이름 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="date" name="MEMBER_BIRTH" placeholder="생년월일 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_EMAIL" placeholder="이메일 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_PHONE" placeholder="휴대전화 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_ZIPCODE" placeholder="우편번호 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_ADDR1" placeholder="주소 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="MEMBER_ADDR2" placeholder="상세주소 입력 *" size="40" style="padding:10px;"></td>
				</tr>
				<input type="hidden" name="MEMBER_DATE" >
				<input type="hidden" name="MEMBER_GRADE">
				<input type="hidden" name="MEMBER_LOG">
				<input type="hidden" name="MEMBER_DELETE">
			</table>
			<br />
			<br />
			<p align="center">
			<input type="submit" value="회원가입"> &nbsp;
			<input type="button" value="취소" onclick="history.back()">
			</p>
	</form>
		
		
</body>
</html>