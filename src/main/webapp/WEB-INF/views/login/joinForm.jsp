<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("joinCode", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/stu/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<!-- 주소검색 API(카카오) -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
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

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
</style>
<body>
	<!-- 로딩중 -->
	<div id="loadingBar" style="display:none;">
        <img id="loading-image" src="img/Spinner.gif" alt="loading..." />
    </div>
    
	<form id="signUp" method="post" action="/stu/joinAction.do">
		<h3 class="contents">회원가입</h3>
		<div class="myForm-group">
			<div class="form-group">
				<label for="MEMBER_ID">아이디 *</label> <input type="text"
					class="form-control" id="MEMBER_ID" name="MEMBER_ID"
					placeholder="아이디를 입력하세요">
					<div id="id_check"></div>
			</div>
			<input type="hidden" id="isCheck" value="0">
			<div class="form-group">
				<label for="MEMBER_NAME">이름 *</label> <input type="text"
					class="form-control" id="MEMBER_NAME" name="MEMBER_NAME"
					placeholder="이름을 입력하세요">
					<div id="name_check"></div>
			</div>
			
			<div class="form-group">
				<label for="pwd1">비밀번호 *</label> <input type="password"
					class="form-control" id="pwd1" name="MEMBER_PASSWD"
					placeholder="비밀번호(영문,숫자,특수문자 포함 8~20자리 입력)" size="100">
					<div id="pw1_check"></div>
			</div>

			<div class="form-group">
				<label for="pwd2">비밀번호 확인 *</label> <input type="password"
					class="form-control" id="pwd2" name="MEMBER_PASSWD2" 
					placeholder="비밀번호 확인" size="100">
				<div id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="member_zipcode">배송지 주소 *</label>
				<div class="form-inline">
					<input type="text" class="form-control" style="width: 100px;"
					name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" placeholder="우편번호" onfocus="this.blur()">
					<button class="btn btn-default" type="button" id="findAddrBtn" onclick="findAddr()">우편번호 찾기</button>
				</div>
				<input type="text" class="form-control" style="margin-top: 5px;"
					name="MEMBER_ADDR1" id="MEMBER_ADDR1" placeholder="주소 입력" onfocus="this.blur()">
				<input type="text" class="form-control" style="margin-top: 5px;"
					name="MEMBER_ADDR2" id="MEMBER_ADDR2" placeholder="상세 주소 입력">
				<div id="addr_check"></div>
			</div>
			<div class="form-group">
				<label for="MEMBER_BIRTH">생년월일 *</label>
				<div class="form-inline">
					<select class="form-control" style="width:150px;"name="MEMBER_BIRTH" id="MEMBER_BIRTH">
						<option value="">출생년도</option>
						<c:forEach var="i" begin="1950" end="2005">
							<option value="${i }">${i }년</option>
						</c:forEach>
					</select>
					<select class="form-control" style="width:120px;" name="MEMBER_BIRTH2" id="MEMBER_BIRTH2">
						<option value="">월</option>
						<c:forEach var="i" begin="1" end="12">
								<option value="<c:if test="${i < 10}">0</c:if>${i }"><c:if test="${i < 10}">0</c:if>${i }월</option>
						</c:forEach>
					</select>
					<select class="form-control" style="width:120px;" name="MEMBER_BIRTH3" id="MEMBER_BIRTH3">
						<option value="">일</option>
						<c:forEach var="i" begin="1" end="31">
							<option value="<c:if test="${i < 10}">0</c:if>${i }"><c:if test="${i < 10}">0</c:if>${i }일</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="MEMBER_PHONE">전화번호 *</label> <input type="text"
					class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE"
					placeholder="전화번호를 입력하세요">
				<div id="phone_check"></div>
				<input type="checkbox" id="SMS_AGREE" name="SMS_AGREE" value="0">
				<font size="3"> SMS 수신에 동의합니다.</font>
			</div>
			<div class="form-group">
				<label for="MEMBER_EMAIL">이메일 주소 *</label>
				<div class="form-inline">
					<input type="email" class="form-control" id="MEMBER_EMAIL" style="width:200px;"
						name="MEMBER_EMAIL" placeholder="이메일을 입력하세요">
					<select class="form-control" name="MEMBER_EMAIL2" id="MEMBER_EMAIL2">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select>
					<button type="button" class="btn btn-default" id="isCheck_Email">인증</button>
					<input type="hidden" id="isEmailCheck" value="0">
				</div>
				<div id="email_check"></div>
				<input type="checkbox" id="EMAIL_AGREE" name="EMAIL_AGREE" value="0">
				<font size="3"> 이메일 수신에 동의합니다.</font>
			</div>
			<div id="isCheck_EmailForm" class="form-group">
				<label for="user_email">인증번호 확인 *</label>
				<div class="form-inline">
					<input type="email" class="form-control" id="emailAuth"
						name="emailAuth" placeholder="인증번호를 입력하세요">
					<button type="button" class="btn btn-default" id="isAuth">확인</button>
					<input type="hidden" id="isEmailAuth" value="0">
				</div>
			</div>
			<div class="form-group" id="checkboxes">
				<div>
					<input type="checkbox" name="check1" id="check1"> <b>서비스 이용약관 동의</b><font color="red">(필수)</font>
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1">내용보기</button>
				</div>
				<div>
					<input type="checkbox" name="check2" id="check2"> <b>개인정보 수집 및 이용 동의</b><font color="red">(필수)</font>
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2">내용보기</button>
				</div>
				<div>
					<input type="checkbox" name="check3" id="check3"> <b>만 14세 이상입니다.</b><font color="red">(필수)</font>
				</div>
			</div>
			<div class="chk_allAgree">
				<input type="checkbox" name="chk_allAgree" id="chk_allAgree">
				<b>내용 확인 및 전체 동의</b>
			</div>
			<button type="submit" class="defaultBtn loginBtn"
				id="signUpBtn">가입하기</button>
			<button type="button" class="defaultBtn cancelBtn"
				id="cancelBtn" onclick="history.back()">취소</button>
		</div>
	</form>

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">서비스 이용약관 동의</h4>
      </div>
      <div class="modal-body">
        <%@ include file="/WEB-INF/views/popUps/pop1.jsp"%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="check1_agree" class="btn btn-primary" disabled>동의 하기</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">개인정보 수집 및 동의</h4>
      </div>
      <div class="modal-body">
        <%@ include file="/WEB-INF/views/popUps/pop2.jsp"%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="check2_agree" class="btn btn-primary" disabled>동의 하기</button>
      </div>
    </div>
  </div>
</div>
<script>

	  	  //아이디 공백 확인
	      if($("#MEMBER_ID").val() == ""){
	          alert("아이디를 입력해주세요.");
	          $("#MEMBER_ID").focus();
	          return false;
	        } else {
					return true;
		        }
	     /*  //이름의 유효성 검사
	      if(!getCheck.test($("#MEMBER_ID").val())){
	        alert("아이디를 형식에 맞게 입력해주세요");
	        $("#MEMBER_ID").val("");
	        $("#MEMBER_ID").focus();
	        return false;
	      }



$(function() {
	
	$(document).ready(function() {
		$("#isCheck_EmailForm").hide();
	});

	$("#MEMBER_ID").keyup(function() {
		var mem_userid = $('#MEMBER_ID').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/selectIdCheck.do?mem_userid='+ mem_userid,
				type : 'get',
				success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);
				if (data > 0) {
						$("#id_check").text(
								"사용중인 아이디입니다.");
						$("#id_check").css("color",
								"red");
						$("#isCheck").val("0");
					} else if (mem_userid == "") {
						// 입력하지 않을 경우
						$('#id_check').text(
								'필수 항목 입니다.');
						$('#id_check').css('color',
								'red');
						$("#isCheck").val("0");
					} else if (data == 0) {
						// 0 : 사용가능
						$("#id_check").text(
								"사용가능한 아이디입니다.");
						$("#id_check").css("color",
								"blue");
						$("#isCheck").val("1");
					}
				}
			});
	});
	
	//아이디 특수문자 입력 제한
	$("#MEMBER_ID").bind("keyup", function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi;
		var temp = $("#MEMBER_ID").val();
		if (re.test(temp)) {
			$("#MEMBER_ID").val(temp.replace(re, ""));
		}
	});
	
	//이름입력
	$("#MEMBER_NAME").keyup(function() {
		var mem_name = $("#MEMBER_NAME").val();
		if (mem_name == "") {
			$("#name_check").text('필수 항목 입니다.');
			$("#name_check").css('color', 'red');
		} else {
			$("#name_check").text('');
		}
	});

	//이름 특수문자 입력 제한
	$("#MEMBER_NAME").bind("keyup", function() {
		re = /[~!@\#$%^&*\()\-=+_']/gi;
		var temp = $("#MEMBER_NAME").val();
		if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
			$("#MEMBER_NAME").val(temp.replace(re, ""));
		}
	});

	//비밀번호 입력 (유효성, 일치여부)
	$("#pwd1").keyup(function() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		var num = pwd1.search(/[0-9]/g);
		var eng = pwd1.search(/[a-z]/ig);
		var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if (pwd1 == "") {
			$("#pw1_check").text('필수 항목 입니다.');
			$("#pw1_check").css('color', 'red');
			$("#pw2_check").val('0');
		} else {
			if(pwd1.length < 8 || pwd1.length > 20){
				$("#pw1_check").text('8자리 ~ 20자리 이내로 입력해주세요.');
				$("#pw1_check").css('color', 'red');
				$("#pw2_check").val('0');
			} else if(pwd1.search(/\s/) != -1){
				$("#pw1_check").text('비밀번호는 공백 없이 입력해주세요.');
				$("#pw1_check").css('color', 'red');
				$("#pw2_check").val('0');
			} else if(num < 0 || eng < 0 || spe < 0 ){
				$("#pw1_check").text('영문,숫자,특수문자를 혼합하여 입력해주세요.');
				$("#pw1_check").css('color', 'red');
				$("#pw2_check").val('0');
			} else {
				$("#pw1_check").text('');
			}
		}
		if (pwd1 != "") {
			if (pwd2 != "") {
				if (pwd1 == pwd2) {
					if(pwd1.length < 8 || pwd1.length > 20 || pwd1.search(/\s/) != -1 || num < 0 || eng < 0 || spe < 0){
						$("#pw2_check").text('비밀번호를 확인해주세요.');
						$("#pw2_check").css('color', 'red');
						$("#pw2_check").val('0');
					} else {
						$("#pw2_check").text('비밀번호가 일치 합니다.');
						$("#pw2_check").css('color', 'blue');
						$("#pw2_check").val('1');
					}
				} else {
					$("#pw2_check").text('비밀번호가 일치 하지 않습니다.');
					$("#pw2_check").css('color', 'red');
					$("#pw2_check").val('0');
				}
			}
		}
	});
	$("#pwd2").keyup(function() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		var num = pwd1.search(/[0-9]/g);
		var eng = pwd1.search(/[a-z]/ig);
		var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if (pwd2 == "") {
			$("#pw2_check").text('필수 항목 입니다.');
			$("#pw2_check").css('color', 'red');
			$("#pw2_check").val('0');
		} else {
			$("#pw2_check").text('');
		}
		if (pwd1 != "") {
			if (pwd2 != "") {
				if (pwd1 == pwd2) {
					if(pwd1.length < 8 || pwd1.length > 20 || pwd1.search(/\s/) != -1 || num < 0 || eng < 0 || spe < 0){
						$("#pw2_check").text('비밀번호를 확인해주세요.');
						$("#pw2_check").css('color', 'red');
						$("#pw2_check").val('0');
					} else {
						$("#pw2_check").text('비밀번호가 일치 합니다.');
						$("#pw2_check").css('color', 'blue');
						$("#pw2_check").val('1');
					}
				} else {
					$("#pw2_check").text('비밀번호가 일치 하지 않습니다.');
					$("#pw2_check").css('color', 'red');
					$("#pw2_check").val('0');
				}
			}
		}
	});

	//전화번호 입력
	$("#MEMBER_PHONE").keyup(function() {
		var mem_phone = $("#MEMBER_PHONE").val();
		if (mem_phone == "") {
			$("#phone_check").text('필수 항목 입니다.');
			$("#phone_check").css('color', 'red');
		} else {
			$("#phone_check").text('');
		}
	});
	
	//전화번호 특수문자 입력 제한
	$("#MEMBER_PHONE").bind("keyup", function() {
		re = /[~!@\#$%^&*\()\-=+_']/gi;
		var temp = $("#MEMBER_PHONE").val();
		if (re.test(temp)) {
			$("#MEMBER_PHONE").val(temp.replace(re, ""));
		}
	});

	//배송지 주소 입력
	$("#MEMBER_ADDR2").keyup(function() {
		var member_addr2 = $("#MEMBER_ADDR2").val();
		if (member_addr2 == "") {
			$("#addr_check").text('필수 항목 입니다.');
			$("#addr_check").css('color', 'red');
		} else {
			$("#addr_check").text('');
		}
	});
	
	//이메일 중복,유효성 체크
	$("#MEMBER_EMAIL").on('keyup', function() {
		var user_email = $("#MEMBER_EMAIL").val();
		var user_email2 = $("#MEMBER_EMAIL2").val();
		if(user_email2 != "") user_email = user_email + "@" + user_email2;
		$.ajax({
			url : '${pageContext.request.contextPath}/selectEmailCheck.do?user_email='+ user_email,
			type : 'get',
			success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : " + data);
			if (data > 0) {
				$("#email_check").text(
						"사용중인 이메일입니다.");
				$("#email_check").css("color",
						"red");
				$("#isEmailCheck").val("0");
			} else if (user_email == "") {
				// 입력하지 않을 경우
				$('#email_check').text(
						'필수 항목 입니다.');
				$('#email_check').css('color',
						'red');
				$("#isEmailCheck").val("0");
			} else if (data == 0) {
				//이메일 유형
				var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$/;
				//특수문자
				var re2 = /[~!@\#$%^&*\()\-=+_']/gi;
				// 0 : 사용가능
				if ($("#MEMBER_EMAIL2 option:selected").val().length < 1) { //직접입력일 경우
					if (!re.test($("#MEMBER_EMAIL").val())) { //이메일 유형이 아닌경우
						$("#email_check").text("올바른 이메일을 입력해주세요.");
						$("#email_check").css("color", "red");
						$("#isEmailCheck").val("0");
					} else {								//이메일 유형일 경우
						$("#email_check").text("사용가능한 이메일입니다.");
						$("#email_check").css("color","blue");
						$("#isEmailCheck").val("1");
					}
				} else if ($("#MEMBER_EMAIL2 option:selected").val().length > 0) //직접입력이 아닐경우
					if (!re2.test($("#MEMBER_EMAIL").val())) {		//특수문자가 입력된경우
						$("#email_check").text("사용가능한 이메일입니다.");
						$("#email_check").css("color","blue");
						$("#isEmailCheck").val("1");
					} else {										//특수문자가 없을경우
						$("#email_check").text("올바른 이메일을 입력해주세요.");
						$("#email_check").css("color", "red");
						$("#isEmailCheck").val("0");
					}
				}
			}
		});
	});
	$("#MEMBER_EMAIL2").on('change', function() {
		var user_email = $("#MEMBER_EMAIL").val();
		var user_email2 = $("#MEMBER_EMAIL2").val();
		if(user_email2 != "") user_email = user_email + "@" + user_email2;
		$.ajax({
			url : '${pageContext.request.contextPath}/selectEmailCheck.do?user_email='+ user_email,
			type : 'get',
			success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : " + data);
			if (data > 0) {
				$("#email_check").text(
						"사용중인 이메일입니다.");
				$("#email_check").css("color",
						"red");
				$("#isEmailCheck").val("0");
			} else if (user_email == "") {
				// 입력하지 않을 경우
				$('#email_check').text(
						'필수 항목 입니다.');
				$('#email_check').css('color',
						'red');
				$("#isEmailCheck").val("0");
			} else if (data == 0) {
				//이메일 유형
				var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$/;
				//특수문자
				var re2 = /[~!@\#$%^&*\()\-=+_']/gi;
				// 0 : 사용가능
				if ($("#MEMBER_EMAIL2 option:selected").val().length < 1) { //직접입력일 경우
					if (!re.test($("#MEMBER_EMAIL").val())) { //이메일 유형이 아닌경우
						$("#email_check").text("올바른 이메일을 입력해주세요.");
						$("#email_check").css("color", "red");
						$("#isEmailCheck").val("0");
					} else {								//이메일 유형일 경우
						$("#email_check").text("사용가능한 이메일입니다.");
						$("#email_check").css("color","blue");
						$("#isEmailCheck").val("1");
					}
				} else if ($("#MEMBER_EMAIL2 option:selected").val().length > 0) //직접입력이 아닐경우
					if (!re2.test($("#MEMBER_EMAIL").val())) {		//특수문자가 입력된경우
						$("#email_check").text("사용가능한 이메일입니다.");
						$("#email_check").css("color","blue");
						$("#isEmailCheck").val("1");
					} else {										//특수문자가 없을경우
						$("#email_check").text("올바른 이메일을 입력해주세요.");
						$("#email_check").css("color", "red");
						$("#isEmailCheck").val("0");
					}
				}
			}
		});
	});

	//이용약관 체크박스 클릭시
	$("#check1").click(function(){
		if ($("#check1").prop("checked")) {
			$("#check1").attr("checked", false);
			$("#check1").attr('data-toggle', 'modal').attr('data-target','#myModal1');
		} else {
			$("#check1").removeAttr("data-toggle").removeAttr("data-target");
		}
	});
	$("#check2").click(function(){
		if ($("#check2").prop("checked")) {
			$("#check2").attr("checked", false);
			$("#check2").attr('data-toggle', 'modal').attr('data-target','#myModal2');
		} else {
			$("#check2").removeAttr("data-toggle").removeAttr("data-target");
		}
	});

	//이메일 수신동의 여부
	$("#EMAIL_AGREE").click(function(){
		email_agree();
	});
	function email_agree() {
		if($("#EMAIL_AGREE").prop("checked")) {
			$("#EMAIL_AGREE").val(1);
		} else {
			$("#EMAIL_AGREE").val(0);
		}
	}
		
	//SMS 수신동의 여부
	$("#SMS_AGREE").click(function(){
		sms_agree();
	});
	function sms_agree() {
		if($("#SMS_AGREE").prop("checked")) {
			$("#SMS_AGREE").val(1);
		} else {
			$("#SMS_AGREE").val(0);
		}	
	}
	
	//공란 확인
	$(document).ready(function() {
		$("#signUpBtn").unbind("click").click(function(e) {
			e.preventDefault();
			fn_signUp();
		});
	});

	function fn_signUp() {
		if ($("#MEMBER_ID").val().length < 1) {
			alert("아이디를 입력해주세요.");
			$("#MEMBER_ID").focus();
		} else if ($("#MEMBER_NAME").val().length < 1) {
			alert("이름을 입력해주세요.");
			$("#MEMBER_NAME").focus();
		} else if ($("#pwd1").val().length < 1) {
			alert("사용하실 비밀번호를 입력해주세요.");
			$("#pwd1").focus();
		} else if ($("#pwd2").val().length < 1) {
			alert("사용하실 비밀번호를 입력해주세요.");
			$("#pwd2").focus();
		} else if ($("#pw2_check").val() != '1') {
			alert("비밀번호를 확인해주세요.");
			$("#pwd2").focus();
		} else if ($("#MEMBER_ZIPCODE").val().length < 1) {
			alert("우편번호를 입력해주세요.");
			$("#MEMBER_ZIPCODE").focus();
		} else if (($("#MEMBER_ADDR1").val().length < 1)
				|| ($("#MEMBER_ADDR2").val().length < 1)) {
			alert("주소를 입력해주세요.");
			$("#MEMBER_ADDR2").focus();
		} else if (($("#MEMBER_BIRTH option:selected").val().length < 1)
				|| ($("#MEMBER_BIRTH2 option:selected").val().length < 1)
				|| ($("#MEMBER_BIRTH3 option:selected").val().length < 1)) {
			alert("출생년도를 확인해주세요.");
			$("#MEMBER_BIRTH").focus();
		} else if ($("#MEMBER_PHONE").val().length < 1) {
			alert("전화번호를 입력해주세요.");
			$("#MEMBER_PHONE").focus();
		} else if ($("#MEMBER_EMAIL").val().length < 1) {
			alert("이메일을 입력해주세요.");
			$("#MEMBER_EMAIL").focus();
		} else if ($("#isCheck").val() != '1') {
			alert("사용 불가능한 아이디 입니다.");
			$("#MEMBER_ID").focus();
		} else if ($("#isEmailAuth").val() != '1') {
			alert("이메일 인증을 해주세요.");
			$("#isCheck_Email").focus();
		} else if (!$("#check1").is(":checked")) {
			alert("서비스 이용약관에 동의 해주세요.");
			$("#check1").focus();
		} else if (!$("#check2").is(":checked")) {
			alert("개인정보 수집에 동의 해주세요.");
			$("#check2").focus();
		} else if (!$("#check3").is(":checked")) {
			alert("만 14세 이상 여부에 동의 해주세요.");
			$("#check3").focus();
		} else {
			$('#signUp').submit();
		}
	}


	//   이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click","#isCheck_Email",function(e) {

		var user_email;
		
		if ($("#MEMBER_EMAIL2").val().length < 1) {
			user_email = $("#MEMBER_EMAIL").val();
		} else {
			user_email = $("#MEMBER_EMAIL").val() + "@" + $("#MEMBER_EMAIL2").val();
		}

		if ($("#isEmailCheck").val() != '1') {
			alert("이메일을 확인해주세요.");
			return false;
		} else {
			e.preventDefault();
			$("#loadingBar").show();
			// 이메일 중복 체크 후 메일 발송 비동기 처리 
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/emailAuth.do",
					data : "user_email="+ user_email,
					
					success : function(data) {
					$("#loadingBar").hide();
					alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
					$("#isCheck_EmailForm").show();
				},
				error : function(data) {
					alert("에러가 발생했습니다.");
					return false;
				}
			});
		}
	});

	// 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	$(document).on("click","#isAuth",function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/emailAuthCheck.do",
			data : "joinCode="
					+ $('#emailAuth').val()
					+ "&ran=" + $("#ran").val(),
			success : function(data) {
				console.log(data.result);
				if (data.result == "complete") {
					$("#isAuth").contents().unwrap().wrap('<div id="isAuth"></div>');
					$("#isAuth").text("인증완료");
					$("#isAuth").css('color','blue').css('display','inline');
					$("#emailAuth").attr('disabled', true);
					$("#isEmailAuth").val("1");
				} else if (data.result == "fail") {
					alert("인증번호가 올바르지 않습니다.")
				}
			},
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	});
	// modal의 동의하기 버튼 클릭 시 체크박스에 checked 속성 활성화
	$("#check1_agree").click(function() {
		$("#check1").prop("checked", true);
		$('#myModal1').modal('hide');
	});

	$("#check2_agree").click(function() {
		$("#check2").prop("checked", true);
		$('#myModal2').modal('hide');
	});

	$("#chk_allAgree").click(function() {
		var chk = $(this).is(":checked");
		if (chk)
			$("#checkboxes input").prop('checked', true);
		else
			$("#checkboxes input").prop('checked', false);
	});
	// modal의 스크롤바 이동에 따른 동의하기 버튼 활성화/비활성화
	$(".guide_wrap").scroll(function() {
		var scrollTop = $(this).scrollTop();
		var innerHeight = $(this).innerHeight();
		var scrollHeight = $(this).prop('scrollHeight');

		if (scrollTop + innerHeight >= scrollHeight) {
			$("#check1_agree").attr('disabled', false);
		} else {
			$("#check1_agree").attr('disabled', true);
		}
	});

	$(".guide_wrap2").scroll(function() {
		var scrollTop = $(this).scrollTop();
		var innerHeight = $(this).innerHeight();
		var scrollHeight = $(this).prop('scrollHeight');

		if (scrollTop + innerHeight >= scrollHeight) {
			$("#check2_agree").attr('disabled', false);
		} else {
			$("#check2_agree").attr('disabled', true);
		}
	});
});

//주소 찾기
function findAddr() {
	new daum.Postcode( {
		oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            document.getElementById('MEMBER_ZIPCODE').value = data.zonecode;
            document.getElementById("MEMBER_ADDR1").value = addr + extraAddr;
            document.getElementById("MEMBER_ADDR2").focus();
        }
	}).open();
}
</script>
</body>
</html>