<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
.yes {
	border: 1px solid #bebebe;
	background-color: salmon;
	color: black;
	width: 300px;
	height: 50px;
	font-size: 20px;
}

.no {
	border: 1px solid #bebebe;
	background-color: white;
	width: 300px;
	height: 50px;
	font-size: 20px;
}
</style>

</head>
<body>
	<br>
	<br>
	<br>
	<h3 align="center" style="font-size: 40px;">
		<b>회원가입</b>
	</h3>
	<p align="center"
		style="font-size: 15px; margin-left: 600px; color: red;">* 필수입력</p>
	<form onsubmit="return checkz()" name="frm" id="frm" method="post"
		action="/stu/joinAction.do">
		<table align="center" cellspacing="10" width="600"
			style="margin: auto;">
			<input type="hidden" name="member_no">
			<tr>
				<th></th>
				<td align="center"><input type="text" name="MEMBER_ID"
					id="MEMBER_ID" placeholder="아이디 입력 *" size="100"
					style="padding: 15px;" maxlength="20">
					<p style="text-align: left;" class="alert alert-positive"></p></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="password" name="MEMBER_PASSWD" id="pwd1"
					class="form-control" placeholder="비밀번호 입력 *" size="100"
					style="padding: 15px;" maxlength="15" required></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="password" name="MEMBER_PASSWD2" id="pwd2"
					class="form-control" placeholder="비밀번호 재입력 *" size="100"
					style="padding: 15px;" maxlength="15" required>
					<p></p>
					<div class="alert alert-success" id="alert-success">
						<font size="2" color="blue">비밀번호가 일치합니다.</font>
					</div>
					<div class="alert alert-danger" id="alert-danger">
						<font size="2" color="red">비밀번호가 일치하지 않습니다.</font>
					</div></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME"
					placeholder="이름 입력 *" size="100" style="padding: 15px;">
					<p style="font-size: 14px; color: red;">국제배송에 필요한 정보이므로 정확한
						한글성명을 입력해주세요.(예명x, 가명x, 띄어쓰기x)</p></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL"
					placeholder="이메일 입력 *" size="50" style="padding: 15px;"> <span>
						<select name="MEMBER_EMAIL2" id="MEMBER_EMAIL2"
						style="width: 120px; height: 48px; font-size: 20px;">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
					</select>
				</span>
					<p>
						<input type="checkbox"><font size="3"> 이메일 수신에
							동의합니다.</font>
					</p></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE"
					placeholder="휴대전화 입력 *" size="100" style="padding: 15px;">
					<p>
						<input type="checkbox"><font size="3"> SMS 수신에
							동의합니다.</font>
					</p></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="MEMBER_ZIPCODE"
					id="MEMBER_ZIPCODE" placeholder="우편번호 입력 *" size="20"
					style="padding: 15px;"> <input type="text"
					name="MEMBER_ADDR1" id="MEMBER_ADDR1" placeholder="주소 입력 *"
					size="45" style="padding: 15px;">
					<p></p></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="MEMBER_ADDR2" id="MEMBER_ADDR2"
					placeholder="상세주소 입력 *" size="100" style="padding: 15px;">
					<p></p></td>
			</tr>
			<tr>
				<th></th>
				<td><select name="MEMBER_BIRTH" id="MEMBER_BIRTH"
					style="width: 150px; height: 48px; font-size: 20px;">
						<option value="">출생년도</option>
						<%
							for (int i = 1950; i <= 2005; i++) {
						%>
						<option value="<%=i%>"><%=i + "년"%></option>
						<%
							}
						%>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; <select name="MEMBER_BIRTH2"
					id="MEMBER_BIRTH2"
					style="width: 150px; height: 48px; font-size: 20px;">
						<option value="">월</option>
						<%
							for (int i = 1; i <= 12; i++) {
							if (i < 10) {
						%>
						<option value="<%="0" + i%>"><%="0" + i + "월"%></option>
						<%
							} else {
						%>
						<option value="<%=i%>"><%=i + "월"%></option>
						<%
							}
						}
						%>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; <select name="MEMBER_BIRTH3"
					id="MEMBER_BIRTH3"
					style="width: 150px; height: 48px; font-size: 20px;">
						<option value="">일</option>
						<%
							for (int i = 1; i <= 31; i++) {
							if (i < 10) {
						%>
						<option value="<%="0" + i%>"><%="0" + i + "일"%></option>
						<%
							} else {
						%>
						<option value="<%=i%>"><%=i + "일"%></option>
						<%
							}
						}
						%>
				</select>
					<p style="color: red; font-size: 15px;">
						국제배송에 필요한 정보이므로 고객님의 정확한 생년월일을 입력해주세요! <br /> (생년월일이 정확하지 않은경우
						국제배송상에 문제가 발생할 수 있습니다)
					</p></td>
			</tr>
			<tr>
				<th></th>
				<td style="font-size: 18px;"><font color="blue">※ 동의 시
						이용약관, 개인정보 수집 및 이용에 동의 됨을 알려드립니다.</font> <br>
				<br> <input type="checkbox" name="allcheck" id="all_check">
					<b>내용 확인 및 전체 동의</b></td>
			</tr>
			<tr>
				<th></th>
				<td
					style="font-size: 18px; height: 60px; background-color: #f7f7f7;">
					<p>
						<input type="checkbox" name="check1" id="check1"
							style="margin-left: 10px;"><b> 서비스 이용약관 동의</b><font
							color="red">(필수)</font> <span style="margin-left: 380px;"><button
								type="button" style="width: 90px; height: 35px;"
								onclick="fn_pop1()">내용보기</button></span>
					</p>
				</td>
			</tr>
			<tr>
				<th></th>
				<td
					style="font-size: 18px; height: 60px; background-color: #f7f7f7;">
					<p>
						<input type="checkbox" name="check2" id="check2"
							style="margin-left: 10px;"><b> 개인정보 수집 및 이용 동의</b><font
							color="red">(필수)</font> <span style="margin-left: 330px;"><button
								type="button" style="width: 90px; height: 35px;"
								onclick="fn_pop2()">내용보기</button></span>
					</p>
				</td>
			</tr>
			<tr>
				<th></th>
				<td
					style="font-size: 18px; height: 60px; background-color: #f7f7f7;">
					<p>
						<input type="checkbox" name="check3" id="check3"
							style="margin-left: 10px;"><b> 만 14세 이상입니다.</b><font
							color="red">(필수)</font>
					</p>
				</td>
			</tr>

			<input type="hidden" name="MEMBER_DATE">
			<input type="hidden" name="MEMBER_GRADE">
			<input type="hidden" name="MEMBER_LOG">
			<input type="hidden" name="MEMBER_DELETE">
		</table>
		<br />
		<p align="center">
			<input type="submit" id="submit" class="yes" value="회원가입">
			&nbsp; <input type="button" class="no" value="취소"
				onclick="history.back()">
		</p>
	</form>

	<!-- 유효성 체크 (안먹힘) 2020.06.02  -->
	<script>
	function checkz() {
		 var getIntro = $("#intro").val().replace(/\s|/gi,'');
	      var hobbyCheck = false;
	      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	      var getCheck= RegExp(/^[a-zA-Z0-9]{6,15}$/);
	      var getName= RegExp(/^[가-힣]+$/);

	  	  //아이디 공백 확인
	      if($("#MEMBER_ID").val() == ""){
	          alert("아이디를 입력해주세요.");
	          $("#MEMBER_ID").focus();
	          return false;
	        } else {
					return true;
		        }
		  });
	     /*  //이름의 유효성 검사
	      if(!getCheck.test($("#MEMBER_ID").val())){
	        alert("아이디를 형식에 맞게 입력해주세요");
	        $("#MEMBER_ID").val("");
	        $("#MEMBER_ID").focus();
	        return false;
	      }

	    //비밀번호
	      if(!getCheck.test($("#pwd1").val())) {
	      alert("형식에 맞는 비밀번호를 입력해주세요.");
	      $("#pwd1").val("");
	      $("#pwd1").focus();
	      return false;
	      }

	      //아이디랑 비밀번호랑 같은지
	      if ($("#MEMBER_ID").val()==($("#pwd1").val())) {
	      alert("아이디와 비밀번호가 같으면 안됩니다.");
	      $("#pwd1").val("");
	      $("#pwd1").focus();
	      return false;
	   	  } 	      
	}
</script>

	<!-- 아이디 중복 체크  -->
	<script>
$("input[name=MEMBER_ID]").blur(function(){
	var MEMBER_ID = $(this).val().trim();
	var p = $(this).parent();
	$.post("/stu/selectIdCheck.do",{MEMBER_ID:MEMBER_ID},function(data){
		 if (!MEMBER_ID){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("");
			//$("input[name=chkid]").val("");
		} else if (data == 1){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("<font size='2' color='red'>이미 등록된 아이디입니다</font>");
			//$("input[name=chkid]").val("");
		} else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("<font size='2' color='blue'>사용 가능한 아이디입니다</font>");
			//$("input[name=chkid]").val("on");
		}
	});		
});
/* $(".auto_mail").change(function() {
	$('#email2').val($(this).val());
}); */
</script>

	<!--  비밀번호 일치 / 불일치   -->
	<script type="text/javascript"> 
$(function(){
	$("#alert-success").hide(); 
	$("#alert-danger").hide();
	 $("input").keyup(function(){
		  var pwd1=$("#pwd1").val();
		   var pwd2=$("#pwd2").val();
		    if(pwd1 != "" || pwd2 != ""){
			     if(pwd1 == pwd2){
				      $("#alert-success").show();
				       $("#alert-danger").hide();
				        $("#submit").removeAttr("disabled");
				         }else{
					          $("#alert-success").hide();
					           $("#alert-danger").show();
					            $("#submit").attr("disabled", "disabled");
					             }
	              }
             });
      });
</script>

	<script>
// 서비스 이용약관 동의 내용보기
function fn_pop1() {
	var popupWidth = 800;
	var popupHeight = 550;

	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY = (window.screen.height / 2) - (popupHeight / 2);
	
	var url = '${pageContext.request.contextPath}/pop1.do';
	window.open(url, 'pop1', 'status=no,scrollbars=yes, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

// 개인정보 수집 및 이용 동의 내용보기
	function fn_pop2() {
		var popupWidth = 800;
		var popupHeight = 550;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY = (window.screen.height / 2) - (popupHeight / 2);
		
		var url = '${pageContext.request.contextPath}/pop2.do';
		window.open(url, 'pop2', 'status=no,scrollbars=yes, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
</script>


	<script>
		// 전체 동의 체크
        $(document).ready(function () {
            $('#all_check').change(function () {
                if (this.checked) {
                    $('#check1').attr('checked', true) + $('#check2').attr('checked', true) + $('#check3').attr('checked', true);
                } else {
                    $('#check1').attr('checked', false) + $('#check2').attr('checked', false) + $('#check3').attr('checked', false);
                }
            });
        });
</script>

</body>
</html>