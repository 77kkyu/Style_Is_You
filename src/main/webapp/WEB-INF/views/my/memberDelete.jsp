<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

<script type="text/javascript">
function SubmitChk() {
	var f = document.frm;

	isChk = false;

	// 체크 항목 체크 시 true
	for (var i=0, len=f.reason.length; i<len; i++) {
		if (f.reason[i].checked) isChk = true;
	}

	// 탈퇴 동의 미 체크시
	if (!f.secession.checked) {
		alert("탈퇴동의를 체크해주세요.");
		f.secession.focus();
		return false;
	}


	if (confirm("탈퇴하시겠습니까?")) {
		alert("탈퇴가 성공적으로 처리되었습니다.");
		f.action = "/stu/main.do";
		f.submit();
	}
}

function cancel() {
	history.back();
}
</script>

<style>
	#One {
		/* text-align:center; */
		width:900px;
		height:400px;
		font-size:16px;
		border:1px solid black;
		margin:auto;
		padding:20px;
		line-height:1.6;
	}
	#Content {		
		height:100px;
		padding:10px;
	}
	#Content2 {
		height:300px;
		padding:10px;
	}
	#Two {
		width:900px;
		height:180px;
		font-size:14px;
		border:1px solid black;
		margin:auto;
		padding:20px;
		line-height:1.7;
	}
	#wrapper {
		display:inline-table;
	}
	#content {
		width:50%;
		float:left;
	}
	#content2 {
		width:50%;
		float:right;
	}
	#chk {
		margin-left:140px;
	}
	.yes {
		border:2px solid black;
		background-color:red;
		color:white;
		width:300px;
		height:50px;
		font-size:20px;
	}
	
	.no {
		border:2px solid black;
		background-color:white;
		width:300px;
		height:50px;
		font-size:20px;
	}
</style>

</head>
<body>
<br>
<br>
	<h2 align="center">회원 탈퇴</h2>
<br>
<br>
<br>
<br>
<div id="One">
	<div id="Content">
		<h4><u>회원탈퇴신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다</u></h4> <br>
		<p>- 탈퇴 후 고객님의 정보는 전자상거래 소비자보호법에 의거한 개인정보보호정책에 따라 관리됩니다.</p>
		<p>- 탈퇴 후 일정기간 재가입 여부판단을 목적으로 고객님의 최소정보(아이디, 성명)를 보존합니다.</p>
		<p>- 탈퇴 시 고객님께서 보유하셨던 적립금, 쿠폰, 위시리스트의 저장상품은 모두 삭제되며, 복구되지 않습니다.</p>
		<p>- 꼭 확인하시고 신중하게 탈퇴 신청해 주시기 바랍니다.</p>
	</div>
	<br><br><br><br>
	<div id="Content2">
		<h4><u>다음의 경우는 회원탈퇴에 주의가 필요합니다.</u></h4> <br>
		<p>- 현재 고객님의 반품처리 요청사항이나 고객서비스가 완료되지 않은 경우에는 서비스 처리완료 후 탈퇴가능합니다.</p>
		<p>- 거래가 진행중인 경우 진행중인 거래를 우선 마무리 해주시기 바랍니다.</p>
		<p>- 회원탈퇴를 하시면, 보유하고 있는 적립금과 위시리스트의 저장상품들은 자동 소멸됩니다.</p>
		<p>- 탈퇴 후 3개월 내(90일) 재가입시 신규회원가입혜택이 지급되지 않습니다.</p>
	</div>
</div>
<br>
<form name="frm" method="post">
<h2 align="center">※이용하시면서 불편하셨던 사항을 체크해 주세요 (중복체크가능)</h2><br>
<div id="Two">
<div id="content">
<table style="font-size:20px;margin-left:50px;">
	<tr>
		<td>
			<input type="checkbox" name="reason" value="다른 쇼핑몰에 비해 가격이 비쌈" title="다른 쇼핑몰에 비해 가격이 비쌈">
			<label>다른 쇼핑몰에 비해 가격이 비쌈</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="상품 품질이 안좋음" title="상품 품질이 안좋음">
			<label>상품 품질이 안좋음</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="이벤트/회원서비스가 다양하지 않음" title="이벤트/회원서비스가 다양하지 않음">
			<label>이벤트/회원서비스가 다양하지 않음</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="상품이 별로 없음" title="상품이 별로 없음">
			<label>상품이 별로 없음</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="개인정보 유출우려" title="개인정보 유출우려">
			<label>개인정보 유출우려</label>
		</td>
	</tr>
</table>
</div>
<div id="content2">
<table style="font-size:20px;margin-left:50px;">
	<tr>
		<td>
			<input type="checkbox" name="reason" value="상품찾기가 어려움" title="상품찾기가 어려움">
			<label>상품찾기가 어려움</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="자주 이용하지 않음" title="자주 이용하지 않음">
			<label>자주 이용하지 않음</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="교환/환불/반품에 대한 불만" title="교환/환불/반품에 대한 불만">
			<label>교환/환불/반품에 대한 불만</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="배송이 늦음" title="배송이 늦음">
			<label>배송이 늦음</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="reason" value="기타" title="기타">
			<label>기타</label>
		</td>
	</tr>
</table>
</div>
</div>
<br>
<div style="text-align:center;font-size:16px;">
	<input name="secession" type="checkbox" title="회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다.">
	<label>회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다.</label>
</div>
<br>
	<p align="center">
			<input type="submit" class="yes" value="회원 탈퇴" onclick="SubmitChk()"> &nbsp;
			<input type="button" class="no" value="취소" onclick="cancel()">
	</p>
</form>
</body>
</html>