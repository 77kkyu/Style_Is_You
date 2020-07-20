<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("joinCode", "");

	Map<String,Object> MEMBER = (Map<String,Object>)request.getAttribute("MEMBER");
	String member_birth = (String)MEMBER.get("MEMBER_BIRTH");
	String[] birth = member_birth.split("/");
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
<!-- 주소검색 API(카카오) -->2
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
#memberModify {
	position: relative;
	top : -630px;
	left: 130px;
}

#signUpBtn {
	width:400px;
	margin-top:30px;
}
</style>
<body>
<div class="container">
<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	<div id="memberModify">
		<form id="signUp" method="post" action="/stu/my/memberModifyAction.do">
			<h3 class="contents">회원정보수정</h3>
			<div class="myForm-group">
				<div class="form-group">
					<label for="MEMBER_ID">아이디 *</label> <input type="text"
						class="form-control" id="MEMBER_ID" name="MEMBER_ID"
						placeholder="아이디를 입력하세요" value="${MEMBER.MEMBER_ID}" readonly>
				</div>
				<input type="hidden" id="isCheck" value="0">
				<div class="form-group">
					<label for="MEMBER_NAME">이름 *</label> <input type="text"
						class="form-control" id="MEMBER_NAME" name="MEMBER_NAME"
						placeholder="이름을 입력하세요" value="${MEMBER.MEMBER_NAME}">
						<div id="name_check"></div>
				</div>
				
				<div class="form-group">
					<label for="pwd1">새 비밀번호</label> <input type="password"
						class="form-control" id="pwd1" name="MEMBER_NEWPASSWD"
						placeholder="새 비밀번호(영문,숫자,특수문자 포함 8~20자리 입력)" size="100">
						<div id="pw1_check"></div>
				</div>
				<div class="form-group">
					<label for="pwd2">새 비밀번호 확인</label> <input type="password"
						class="form-control" id="pwd2" name="MEMBER_NEWPASSWD2"
						placeholder="새 비밀번호 확인" size="100">
						<div id="pw2_check"></div>
				</div>
				<div class="form-group">
					<label for="member_zipcode">배송지 주소 *</label>
					<div class="form-inline">
						<input type="text" class="form-control" style="width: 100px;"
							name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" placeholder="우편번호" onfocus="this.blur()" value="${MEMBER.MEMBER_ZIPCODE}">
						<button class="btn btn-default" type="button" id="findAddrBtn" onclick="findAddr()">우편번호
							찾기</button>
					</div>
					<input type="text" class="form-control" style="margin-top: 5px;"
						name="MEMBER_ADDR1" id="MEMBER_ADDR1" placeholder="주소 입력" onfocus="this.blur()" value="${MEMBER.MEMBER_ADDR1}">
					<input type="text" class="form-control" style="margin-top: 5px;"
						name="MEMBER_ADDR2" id="MEMBER_ADDR2" placeholder="상세 주소 입력" value="${MEMBER.MEMBER_ADDR2}">
					<div id="addr_check"></div>
				</div>
				<div class="form-group">
					<label for="MEMBER_BIRTH">생년월일 *</label>
					<div class="form-inline">
						<c:set var="birth" value="${MEMBER.MEMBER_BIRTH}" />
						<select class="form-control" style="width:150px;"name="MEMBER_BIRTH" id="MEMBER_BIRTH">
							<option value="">출생년도</option>
							<%
								for(int i=1950; i<=2005; i++) {
							%>
							<option value="<%=i %>" <%if(birth[0].equals(""+i)) out.print("selected");%>><%=i + "년" %></option>
							<%
								}
							%>
						</select>
						<select class="form-control" style="width:120px;" name="MEMBER_BIRTH2" id="MEMBER_BIRTH2">
							<option value="">월</option>
							<%
								for(int i=1; i<=12; i++) {
									if(i < 10) {
							%>	
							<option value="<%="0" + i %>" <%if(birth[1].equals("0"+i)) out.print("selected");%>><%="0" + i + "월" %></option>
							<%
									} else {
							%>
							<option value="<%=i %>" <%if(birth[1].equals(""+i)) out.print("selected");%>><%=i + "월" %></option>
							<%
									}
								}
							%>
						</select>
						<select class="form-control" style="width:120px;" name="MEMBER_BIRTH3" id="MEMBER_BIRTH3">
							<option value="">일</option>
							<%
								for(int i=1; i<=31; i++) {
									if(i < 10) {
							%>	
							<option value="<%="0" + i %>" <%if(birth[2].equals("0"+i)) out.print("selected");%>><%="0" + i + "일" %></option>
							<%
									} else {
							%>
							<option value="<%=i %>" <%if(birth[2].equals(""+i)) out.print("selected");%>><%=i + "일" %></option>
							<%
									}
								}
							%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="MEMBER_PHONE">전화번호 *</label> <input type="text"
						class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE"
						placeholder="전화번호를 입력하세요" value="${MEMBER.MEMBER_PHONE }">
					<div id="phone_check"></div>
					<c:set var="isSmsChk" value="${MEMBER.SMS_AGREE}"/>
					<input type="checkbox" id="SMS_AGREE" name="SMS_AGREE" value="0" <c:if test="${isSmsChk == 1}">checked</c:if>>
					<font size="3"> SMS 수신에 동의합니다.</font>
				</div>
				<div class="form-group">
					<label for="MEMBER_EMAIL">이메일 주소 *</label>
					<div class="form-inline">
						<input type="email" class="form-control" id="MEMBER_EMAIL" style="width:400px;"
							name="MEMBER_EMAIL" placeholder="이메일을 입력하세요" value="${MEMBER.MEMBER_EMAIL }" readonly>
					</div>
					<c:set var="isEmailChk" value="${MEMBER.EMAIL_AGREE}"/>
					<input type="checkbox" id="EMAIL_AGREE" name="EMAIL_AGREE" value="0" <c:if test="${isEmailChk == 1}">checked</c:if>>
					<font size="3"> 이메일 수신에 동의합니다.</font>
				</div>
				<button type="submit" class="defaultBtn loginBtn"
					id="signUpBtn">수정하기</button>
			</div>
		</form>
	</div>
</div>
<script>


$(function() {
	
	$(document).ready(function() {
		$("#pw2_check").val(1);
		email_agree();
		sms_agree();
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
		if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
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
	
	//비번일치
	$("#pwd1").keyup(function() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		var num = pwd1.search(/[0-9]/g);
		var eng = pwd1.search(/[a-z]/ig);
		var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if (pwd1 != "") {
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
				$("#pw1_check").val('1');
				$("#pw1_check").text('');
			}
		} else {
			$("#pw2_check").val('1');
			$("#pw2_check").text('');
			$("#pw1_check").text('');
		}
		if (pwd1 != "" || pwd2 != "") {
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
	});
	$("#pwd2").keyup(function() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		var num = pwd1.search(/[0-9]/g);
		var eng = pwd1.search(/[a-z]/ig);
		var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if (pwd1 != "" || pwd2 != "") {
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
		} else {
		$("#pw2_check").val('1');
		$("#pw2_check").text('');
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
		} else {
			$('#signUp').submit();
		}
	}
});

//주소 찾기
function findAddr() {
	new daum.Postcode( {
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== ''
					&& /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== ''
					&& data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('MEMBER_ZIPCODE').value = data.zonecode;
			document.getElementById("MEMBER_ADDR1").value = roadAddr
					+ data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if (roadAddr !== '') {
				document.getElementById("MEMBER_ADDR2").value = extraRoadAddr;
			} else {
				document.getElementById("MEMBER_ADDR2").value = '';
			}
		}
	}).open();
}
</script>
</body>
</html>