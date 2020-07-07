<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="/stu/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#findMemform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}

.contents {
	font-size : 40px;
}

.findpwd>a {
	float: right;
	padding-left: 24px;
}

.findpwd>input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	margin-bottom: 20px
}

button {
	width: 100%;
	height: 50px;
	display: block;
	border: none;
	margin-top: 10px;
	font-size: 20px;
}
/* 전체 화면을 덮는 layer, 로딩중일때 다른 이벤트를 방지하기 위함 */
#loadingBar {
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    position: fixed;
    display: block;
    opacity: 0.7;
    background-color: #fff;
    z-index: 99;
    text-align: center;
}
/* 로딩중 이미지 위치 및 출력 순서 */
#loading-image {
    position: absolute;
    top: calc(50% - 200px/ 2);
    left: calc(50% - 200px/ 2);
    z-index: 100;
}
</style>

</head>
<body>
<!-- 로딩중 -->
	<div id="loadingBar" style="display:none;">
        <img id="loading-image" src="img/Spinner.gif" alt="loading..." />
    </div>
	<input type="hidden" name="alert" value="${resultMsg}"/>
	<input type="hidden" name="isResult" value="${isResult}" />
	<form action="/stu/findPwAction.do" method="post">
		<div id="findMemform">
			<h3 class="contents">비밀번호 재설정</h3>
			
			<div class="findpwd">
				<input type="text" class="form-control" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디">
				<input type="email" class="form-control" name="MEMBER_EMAIL" id="MEMBER_EMAIL" placeholder="이메일주소">
				<a href="/stu/findPw.do">비밀번호 재설정</a>
				<a href="/stu/findId.do">아이디 찾기</a>
				<button class="defaultBtn loginBtn" type="submit" id="pwResetBtn">비밀번호 재설정</button>
			</div>		
			
			
			<p>아직 회원이 아니신가요? <a href="/stu/joinForm.do">회원가입하기</a></p>
			
		</div>
	</form>
<script>
$(document).ready(function() {
	$("#pwResetBtn").click(function(){
		//이메일 유형
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!re.test($("#MEMBER_EMAIL").val())){ //이메일 유형이 아닐경우
			alert("올바른 이메일을 입력해주세요.");
			return false;
		}
		$("#loadingBar").show();
	});
	
	if ($("input[name='alert']").val() != null && $("input[name='alert']").val() != "") {
		$("#loadingBar").hide();
		alert($("input[name='alert']").val());

		if ($("input[name='isResult']").val() == '1') {
			location.href = "<c:url value='/loginForm.do'/>";
		}
	}
});
</script>
</body>
</html>