<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/login.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>

<style>
	#memberDelete {
	width : 800px;
	position: relative;
	top : -580px;
	left: 360px;
	}
	
	#deleteMemBtn {
	width: 400px;
	}
	
</style>

</head>

<body>
	<div class="container">
		<div id="mySide">
			<%@include file="/WEB-INF/tiles/mySide.jsp"%>
		</div>

		<div id="memberDelete">
			<div>
				<h3 class="contents">탈퇴 안내</h3>
			</div>
			<div>
				<div>
					<h4>
						<u>회원탈퇴신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다</u>
					</h4>
					<br>
					<p>- 탈퇴 후 고객님의 정보는 전자상거래 소비자보호법에 의거한 개인정보보호정책에 따라 관리됩니다.</p>
					<p>- 탈퇴 후 일정기간 재가입 여부판단을 목적으로 고객님의 최소정보(아이디, 성명)를 보존합니다.</p>
					<p>- 탈퇴 시 고객님께서 보유하셨던 적립금, 쿠폰, 위시리스트의 저장상품은 모두 삭제되며, 복구되지 않습니다.</p>
					<p>- 꼭 확인하시고 신중하게 탈퇴 신청해 주시기 바랍니다.</p>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div id="Content2">
					<h4>
						<u>다음의 경우는 회원탈퇴에 주의가 필요합니다.</u>
					</h4>
					<br>
					<p>- 현재 고객님의 반품처리 요청사항이나 고객서비스가 완료되지 않은 경우에는 서비스 처리완료 후
						탈퇴가능합니다.</p>
					<p>- 거래가 진행중인 경우 진행중인 거래를 우선 마무리 해주시기 바랍니다.</p>
					<p>- 회원탈퇴를 하시면, 보유하고 있는 적립금과 위시리스트의 저장상품들은 자동 소멸됩니다.</p>
					<p>- 탈퇴 후 3개월 내(90일) 재가입시 신규회원가입혜택이 지급되지 않습니다.</p>
				</div>
			</div>
			<br>

			<div>
				<form name="frm" method="post">
					<h3 align="center">※이용하시면서 불편하셨던 사항을 체크해 주세요</h3>
					<br>
					<div>
							<table style="font-size: 17px; width: 700px; margin-left:50px;">
								<tr>
									<td><input type="checkbox" name="reason"
										value="다른 쇼핑몰에 비해 가격이 비쌈" title="다른 쇼핑몰에 비해 가격이 비쌈"> <label>다른
											쇼핑몰에 비해 가격이 비쌈</label></td>
									<td><input type="checkbox" name="reason"
										value="상품 품질이 안좋음" title="상품 품질이 안좋음"> <label>상품
											품질이 안좋음</label></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="reason"
										value="이벤트/회원서비스가 다양하지 않음" title="이벤트/회원서비스가 다양하지 않음">
										<label>이벤트/회원서비스가 다양하지 않음</label></td>
									<td><input type="checkbox" name="reason" value="상품이 별로 없음"
										title="상품이 별로 없음"> <label>상품이 별로 없음</label></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="reason" value="개인정보 유출우려"
										title="개인정보 유출우려"> <label>개인정보 유출우려</label></td>
										<td><input type="checkbox" name="reason" value="상품찾기가 어려움"
										title="상품찾기가 어려움"> <label>상품찾기가 어려움</label></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="reason"
										value="자주 이용하지 않음" title="자주 이용하지 않음"> <label>자주
											이용하지 않음</label></td>
									<td><input type="checkbox" name="reason"
										value="교환/환불/반품에 대한 불만" title="교환/환불/반품에 대한 불만"> <label>교환/환불/반품에
											대한 불만</label></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="reason" value="배송이 늦음"
										title="배송이 늦음"> <label>배송이 늦음</label></td>
									<td><input type="checkbox" name="reason" value="기타"
										title="기타"> <label>기타</label></td>
								</tr>
							</table>
					</div>
					<br>
					<div style="text-align: center; font-size: 16px;">
						<input id="isAgree" name="se cession" type="checkbox"
							title="회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다."> <label>회원
							탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다.</label>
					</div>
					<br>
					<p align="center">
						<input type="submit" class="defaultBtn loginBtn" id="deleteMemBtn" value="회원 탈퇴">
					</p>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
$("#deleteMemBtn").click(function(){
	if($("#isAgree").prop("checked")) {
		
		$.ajax({
	         
	         type:"POST",
	         url:"/stu/my/memberDeleteAction.do",
	         data:"json",
	         
	         success:function(data){
	            console.log(data.result);
	            if(data.result == "complete"){
	               alert("회원탈퇴가 완료되었습니다.");
	               location.href=data.URL;
	            }else{
	               alert("에러가 발생했습니다.");
	            }

	            
	         },
	         error:function(data){
	            alert("에러가 발생했습니다.");
	         }
	      });
		} else{
			alert("탈퇴안내를 확인하고 동의해주세요.");
		}
});
</script>
</body>
</html>