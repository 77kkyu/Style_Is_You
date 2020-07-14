<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/stu/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#loginform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}

.contents {
	font-size : 40px;
}

.logintable>a {
	float: right;
	padding-left: 24px;
}

.logintable>input {
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

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
</style>

<form action="/stu/loginAction.do" method="POST" id="frm">
	<div id="loginform">
		<h3 class="contents">로그인</h3>
		<div class="logintable">
			<input type="text" class="form-control" name="MEMBER_ID"
				id="MEMBER_ID" placeholder="아이디">
			<input type="password" class="form-control" name="MEMBER_PASSWD"
				id="MEMBER_PASSWD" placeholder="비밀번호">
			<a href="/stu/findPw.do">비밀번호
					재설정</a>
			<a href="/stu/findId.do">아이디
					찾기</a>
			
				<button type="submit" class="defaultBtn loginBtn" id="login">로그인</button>
			
		</div>
		<p>
			아직 회원이 아니신가요? <a href="/stu/joinForm.do">회원가입하기</a>

		</p>
	</div>
</form>

<script type="text/javascript">
if('${message}' != "") {
	alert('${message}');
}
//공란 확인
$(document).ready(function() {
	
	$("#login").unbind("click").click(function(e) {
		e.preventDefault();
		fn_login();
	});

	function fn_login() {
		if($("#MEMBER_ID").val()==""){
			alert("아이디를 입력해주세요");
			$("#MEMBER_ID").focus();
		} else if($("#MEMBER_PASSWD").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#MEMBER_PASSWD").focus();
		} else {
			$("#frm").submit();
		}
	}
});
</script>