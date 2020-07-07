<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<style>
	.tab {
		padding:1px;
		border:0px;
		border-collapse:collapse;
	}
	.yes {
		border:1px solid;
		background-color:salmon;
		color:white;
		width:300px;
		height:50px;
		font-size:20px;
	}
	



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

#memberModify {
	width : 800px;
	position: relative;
	top : -580px;
	left: 360px;
}
	

</style>

<script>
	function fn_alert() {
			if(confirm("회원정보를 수정하시겠습니까?")) {
					alert("정보가 수정되었습니다.");
					location.href='/stu/my/myMain';
				} else {
						return false;
					}
		}
</script>


</head>
<body>
<div class="container">	
	
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	
	
	<div id="memberModify">
	<div style="text-align: center;">
	<h2>회 원 수 정</h2>  <br />
	</div>
	<form name="frm" method="post" action="/stu/my/memberModifyAction.do">
	<table align="center" class="tab" cellspacing="0" border="1" height="700"
		  color="#e2e2e2" style="width: 700px;">
		 	<input type="hidden" name="MEMBER_NO" value="${MEMBER.MEMBER_NO }">
		<tr>
			<th bgcolor="#e2e2e2" width="200" height="40">아이디</th>
			<td>&nbsp;&nbsp;&nbsp;${MEMBER.MEMBER_ID }</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">새 비밀번호</th>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="password" name="MEMBER_PASSWD"
					 size="40" style="padding:10px;height:10px;" maxlength="15">
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">이름</th>
			<td>&nbsp;&nbsp;&nbsp;${MEMBER.MEMBER_NAME }</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">이메일</th>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_EMAIL" value="${MEMBER.MEMBER_EMAIL }"
					size="35" style="padding:10px;height:10px;">
				&nbsp;
				<select name="MEMBER_EMAIL2" style="width:130px;height:25px;font-size:15px;">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
				</select>	
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">이메일 수신동의</th>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="radio"> 예
				<input type="radio"> 아니오
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">휴대폰</th>
			<td>&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_PHONE" value="${MEMBER.MEMBER_PHONE }"
					size="35" style="padding:10px;height:10px;">				
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">SMS 수신동의</th>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="radio"> 예
				<input type="radio"> 아니오
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2" height="60">주소</th>
			<td style="padding:15px;">&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_ZIPCODE" value="${MEMBER.MEMBER_ZIPCODE }" size="5" style="padding:10px;height:20px;">
				<input type="text" name="MEMBER_ADDR1" value="${MEMBER.MEMBER_ADDR1 }" size="40" style="padding:10px;height:20px;">
				<br>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_ADDR2" value="${MEMBER.MEMBER_ADDR2 }" size="57" style="padding:10px;height:20px;">
			</td>
		</tr>
		<tr>
			<th bgcolor="#e2e2e2">생년월일</th>
			<td>&nbsp;&nbsp;
						<select name="MEMBER_BIRTH" style="width:120px;padding:10px;height:40px;font-size:15px;">
							<option value="">출생년도</option>
							<%
								for(int i=1950; i<=2005; i++) {
							%>
							<option value="<%=i %>"><%=i + "년" %></option>
							<%
								}
							%>
						</select>
						&nbsp;
						<select name="MEMBER_BIRTH2" style="width:120px;padding:10px;height:40px;font-size:15px;">
							<option value="">월</option>
							<%
								for(int i=1; i<=12; i++) {
									if(i < 10) {
							%>	
							<option value="<%="0" + i %>"><%="0" + i + "월" %></option>
							<%
									} else {
							%>
							<option value="<%=i %>"><%=i + "월" %></option>
							<%
									}
								}
							%>
						</select>
						&nbsp;
						<select name="MEMBER_BIRTH3" style="width:120px;padding:10px;height:40px;font-size:15px;">
							<option value="">일</option>
							<%
								for(int i=1; i<=31; i++) {
									if(i < 10) {
							%>	
							<option value="<%="0" + i %>"><%="0" + i + "일" %></option>
							<%
									} else {
							%>
							<option value="<%=i %>"><%=i + "일" %></option>
							<%
									}
								}
							%>
						</select>
					</td>
				</tr>
		</table>
		<br>
		<br>
		<p align="center">
			<input type="submit" id="submit" class="yes" value="회원 정보 수정" onclick="fn_alert()">
		</p>
	</form>
	</div>
</div>	
</body>
</html>