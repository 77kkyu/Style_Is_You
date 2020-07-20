<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/stu/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#mypageform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}

.contents {
	font-size : 40px;
}

.pwdchecktable>input {
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
#pwdCheck {
	position: relative;
	top : -630px;
	left: 130px;
}
</style>
<div class="container">
<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	<div id="pwdCheck">
		<input type="hidden" name="alert" value="${alert}"/>
		<form action="memberModify.do" id="pwdcheckfrm" onsubmit="return passcheck();" method="post">
			<div id="mypageform">
				<h3 class="contents">회원정보수정</h3>
				<!-- 패스워드확인-->
				<div id="pwdcheck">
					<h5>안전한 개인정보변경을 위해서<br> 현재 사용중인 
					비밀번호를 입력해주세요</h5> <br>
					<div class="pwdchecktable">
							<input type="password" class="form-control" name="MEMBER_PASSWD" id="MEMBER_PASSWD"
								placeholder="비밀번호를 입력해주세요.">
							<button class="defaultBtn loginBtn" type="submit">확인</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	if($("input[name='alert']").val() != null && $("input[name='alert']").val() != ""){
		alert($("input[name='alert']").val());
	}
});

function passcheck() {
	if($("#MEMBER_PASSWD").val()==""){
		alert("비밀번호를 입력해주세요");
		$("#MEMBER_PASSWD").focus();
		return false;
	}
	return true;
}
</script>
