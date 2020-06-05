<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후</title>
</head>
<body>
	(메인페이지로 포워딩 할거임)
	
	로그인 완료~ <br />
	회원번호 : ${MEMBER.MEMBER_NO } <br />
	이름 : ${MEMBER.MEMBER_NAME } <br />
	${MEMBER.MEMBER_PHONE }
	<a href="/stu/logout.do">로그아웃</a>
</body>
</html>