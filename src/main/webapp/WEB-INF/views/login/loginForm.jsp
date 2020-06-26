<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#loginform {
	width: 500px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	margin-bottom: 100px
}

.contents {
	font-size : 40px;
}

.logintable>a {
	float: right;
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
	background-color: #ffd014;
	display: block;
	border: none;
	margin-top: 10px;
	font-size: 20px;
}
</style>
<script type="text/javascript">

	 function fn_login() {
		 if($("#MEMBER_ID").val()==""){
			 
			 alert("아이디를 입력해주세요");
			 $("MEMBER_ID").focus();
			 return false;
		 }
		 else if($("#MEMBER_PASSWD").val()==""){
			 
			 alert("비밀번호를 입력해주세요");
			 $("MEMBER_PASSWD").focus();
			 return false;
			 //버튼실행시
	 }
	 return true;
	 }
		
</script>
<form action="/stu/loginAction.do" method="post" id="frm"
	onsubmit="return fn_login();">
	<div id="loginform">
		<h3 class="contents">로그인</h3>
		<div class="logintable">
			<input type="text" class="form-control" name="MEMBER_ID"
				id="MEMBER_ID" placeholder="아이디">
			<input type="password" class="form-control" name="MEMBER_PASSWD"
				id="MEMBER_PASSWD" placeholder="비밀번호">
			<a class="btn btn-link" href="/hotel/passwordResetForm">비밀번호
					재설정</a>
			<a class="btn btn-link" href="/stu/findId.do">아이디
					찾기</a>
			
				<button type="submit" class="btn btn-primary" id="submit">로그인</button>
			
		</div>
		<p>
			아직 회원이 아니신가요? <a class="btn btn-link" href="/stu/joinForm.do">회원가입하기</a>

		</p>
	</div>
</form>
<label></label>
