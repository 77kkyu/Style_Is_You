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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<style>
.contents {
	width: 100%;
	float: left;
	text-align: center;
	font-size: 40px;
	color: #444;
	margin-bottom: 50px;
}

.myForm-group {
	position: relative;
	left: calc(50% - 400px/ 2);
}

.form-control {
	width: 400px;
}

#user_email {
	width: 325px;
}

#email_check {
	display: block;
}

#isCheck_Email {
	width: 70px;
}
</style>
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
					placeholder="비밀번호를 입력하세요" size="100">
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
					<button class="btn btn-default" type="button" id="findAddrBtn" onclick="findAddr()">우편번호
						찾기</button>
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
				<input type="checkbox"> <font size="3"> SMS 수신에
					동의합니다.</font>
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
				<input type="checkbox">
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
				<div style="width:400px; margin-bottom:15px;">
					<input type="checkbox" name="check1" id="check1"> <b>서비스
						이용약관 동의</b><font color="red">(필수)</font>
					<button type="button" class="btn btn-default" style="float:right; height:30px; font-size:12px;" data-toggle="modal" data-target="#myModal1">내용보기</button>
				</div>
				<div style="width:400px; margin-bottom:15px;">
					<input type="checkbox" name="check2" id="check2"> <b>개인정보
						수집 및 이용 동의</b><font color="red">(필수)</font>
					<button type="button" class="btn btn-default" style="float:right; height:30px; font-size:12px;" data-toggle="modal" data-target="#myModal2">내용보기</button>
				</div>
				<div style="width:400px; margin-bottom:15px;">
					<input type="checkbox" name="check3" id="check3"> <b>만
						14세 이상입니다.</b><font color="red">(필수)</font>
				</div>
			</div>
			<div>
				<input type="checkbox" name="chk_allAgree" id="chk_allAgree">
				<b>내용 확인 및 전체 동의</b>
			</div>
			<button type="button" class="btn btn-primary" style="width:200px;"
				id="signUpBtn">가입하기</button>
			<button type="button" class="btn btn-default" style="width:200px;"
				id="cancelBtn">취소</button>
				
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
		$(function() {
			$(document).ready(function() {
				$("#isCheck_EmailForm").hide();
			});

			// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
			$("#MEMBER_ID").blur(function() {
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
			$("#MEMBER_ID").bind("keyup", function() {
				re = /[~!@\#$%^&*\()\-=+_']/gi;
				var temp = $("#MEMBER_ID").val();
				if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$("#MEMBER_ID").val(temp.replace(re, ""));
				}
			});
			
			//이름입력
			$("#MEMBER_NAME").blur(function() {
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
			
			//비밀번호 입력
			$("#pwd1").blur(function() {
				var pw1 = $("#pwd1").val();
				if (pw1 == "") {
					$("#pw1_check").text('필수 항목 입니다.');
					$("#pw1_check").css('color', 'red');
				} else {
					$("#pw1_check").text('');
				}
			});
			
			//전화번호 입력
			$("#MEMBER_PHONE").blur(function() {
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
			$("#MEMBER_ADDR2").blur(function() {
				var member_addr2 = $("#MEMBER_ADDR2").val();
				if (member_addr2 == "") {
					$("#addr_check").text('필수 항목 입니다.');
					$("#addr_check").css('color', 'red');
				} else {
					$("#addr_check").text('');
				}
			});
			//이메일 중복,유효성 체크
			$("#MEMBER_EMAIL").blur(function() {
				var user_email = $("#MEMBER_EMAIL").val();
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
							// 0 : 사용가능
							if ($("#MEMBER_EMAIL2 option:selected").val().length < 1) { //직접입력일 경우
								if ($("#MEMBER_EMAIL").val().indexOf("@") < 0) { //@를 찾고 없으면
									$("#email_check").text("올바른 이메일을 입력해주세요.");
									$("#email_check").css("color", "red");
									$("#isEmailCheck").val("0");
								} else {
									$("#email_check").text("사용가능한 이메일입니다.");
									$("#email_check").css("color","blue");
									$("#isEmailCheck").val("1");
								}
							} else if ($("#MEMBER_EMAIL2 option:selected").val().length > 0) { //직접입력이 아닐경우
								if ($("#MEMBER_EMAIL").val().indexOf("@") > 0) { //@를 찾고 있으면
									$("#email_check").text("올바른 이메일을 입력해주세요.");
									$("#email_check").css("color", "red");
									$("#isEmailCheck").val("0");
								} else {
									$("#email_check").text("사용가능한 이메일입니다.");
									$("#email_check").css("color","blue");
									$("#isEmailCheck").val("1");
								}
							}
						}
					}
				});


			});
			//비번일치
			$("#pwd2").blur(function() {
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#pw2_check").text('비밀번호가 일치 합니다.');
						$("#pw2_check").css('color', 'blue');
					} else {
						$("#pw2_check").text('비밀번호가 일치 하지 않습니다.');
						$("#pw2_check").css('color', 'red');
					}
				}

				else if (pwd2 == "") {
					$("#pw2_check").text('필수 항목 입니다.');
					$("#pw2_check").css('color', 'red');
				}
			});
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
				} else if ($("#MEMBER_NAME").val().length < 1) {
					alert("이름을 입력해주세요.");
				} else if ($("#pwd1").val().length < 1) {
					alert("사용하실 비밀번호를 입력해주세요.");
				} else if ($("#pwd2").val().length < 1) {
					alert("사용하실 비밀번호를 입력해주세요.");
				} else if ($("#MEMBER_ZIPCODE").val().length < 1) {
					alert("우편번호를 입력해주세요.");
				} else if (($("#MEMBER_ADDR1").val().length < 1)
						|| ($("#MEMBER_ADDR2").val().length < 1)) {
					alert("주소를 입력해주세요.")
				} else if (($("#MEMBER_BIRTH option:selected").val().length < 1)
						|| ($("#MEMBER_BIRTH2 option:selected").val().length < 1)
						|| ($("#MEMBER_BIRTH3 option:selected").val().length < 1)) {
					alert("출생년도를 확인해주세요.");
				} else if ($("#MEMBER_PHONE").val().length < 1) {
					alert("전화번호를 입력해주세요.");
				} else if ($("#MEMBER_EMAIL").val().length < 1) {
					alert("이메일을 입력해주세요.");
				} else if ($("#isCheck").val() != '1') {
					alert("아이디를 확인해주세요.");
				} else if ($("#isEmailAuth").val() != '1') {
					alert("이메일 인증을 해주세요.");
				} else if (!$("#check1").is(":checked")) {
					alert("서비스 이용약관에 동의 해주세요.");
				} else if (!$("#check2").is(":checked")) {
					alert("개인정보 수집에 동의 해주세요.");
				} else if (!$("#check3").is(":checked")) {
					alert("만 14세 이상 여부에 동의 해주세요.");
				} else {
					$('#signUp').submit();
				}
			}

			//이메일 인증 		
			//   이메일 인증 버튼 클릭시 발생하는 이벤트
			$(document).on("click","#isCheck_Email",function() {
				var user_email;
				
				if ($("#MEMBER_EMAIL2").val().length < 1) {
					user_email = $("#MEMBER_EMAIL").val();
				} else {
					user_email = $("#MEMBER_EMAIL").val() + "@"
							+ $("#MEMBER_EMAIL2").val();
				}

				if ($("#isEmailCheck").val() != '1') {
					alert("이메일을 확인해주세요.");
					return false;
				} else {
					
					// 이메일 중복 체크 후 메일 발송 비동기 처리 
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/emailAuth.do",
							data : "user_email="+ user_email,
							
							success : function(data) {
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
			$(document)
					.on(
							"click",
							"#isAuth",
							function() {

								$
										.ajax({

											type : "POST",
											url : "${pageContext.request.contextPath}/emailAuthCheck.do",
											data : "joinCode="
													+ $('#emailAuth').val()
													+ "&ran=" + $("#ran").val(),
											success : function(data) {
												console.log(data.result);
												if (data.result == "complete") {
													$("#isAuth")
															.contents()
															.unwrap()
															.wrap(
																	'<div id="isAuth"></div>');
													$("#isAuth").text("인증완료");
													$("#isAuth").css('color',
															'blue')
															.css('display',
																	'inline');
													$("#emailAuth").attr(
															'disabled', true);
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
			new daum.Postcode(
					{
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