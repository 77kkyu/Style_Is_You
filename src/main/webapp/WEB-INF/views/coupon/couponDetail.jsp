<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.Date" %>
<jsp:useBean id="today" class="java.util.Date"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쿠폰관리</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

<!-- 링크) datepicker 링크   참고한 사이트  -- https://www.daterangepicker.com/ -->
<script type="text/javascript" src="js/jquery.min_dw.js"></script>
<script type="text/javascript" src="js/moment.min_dw.js"></script>
<script type="text/javascript" src="js/daterangepicker.min_dw.js"></script>
<link rel="stylesheet" type="text/css" href="css/daterangepicker_dw.css" />

<!-- 링크) jQuery 링크 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 링크) 커스텀 페이징 js -->
<script src="<c:url value='/js/common_dw.js'/>" charset="utf-8"></script>

<style>
.couponDetail_bottomDiv {margin: 100px 0 100px 0; border: 1px solid darkgray; width: 800px; padding: 50px 0 50px 50px; border-radius: 30px;}
</style>

</head>
<body>

<div style="display: flex; width: 1000px; margin: 0 0 0 350px;">
	
	<!-- include) 사이드바 -->	
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %> 

	<!-- s 상단 탭 영역 -->
	<!-- e 상단 탭 영역 -->

	<!-- s 하단 리스트 영역 -->
	<div class="couponDetail_bottomDiv">
		<h3 class="text-muted" style="text-align: center;">쿠폰 정보 입력</h3>
		<form class="form-horizontal">
			<input type="hidden" id="view_type" value="${param.TYPE}">
			<input type="hidden" id="COUPON_NO" value="${param.COUPON_NO}">
			<input type="hidden" class="date" id="currentdate" value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
			
			<table name="couponList" class="table table-striped">
				<tbody>
				
				</tbody>
			</table>
			
		</form>
		<form id="commonForm" name="commonForm"></form>
	</div>
	<!-- e 하단 리스트 영역 -->
	
</div>

</body>
<script>
$(document).ready(function(){
	var body = $("table[name='couponList'] > tbody");
	var str = "";
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/adminCouponDetail.do",
			data: {
				"COUPON_NO":$("#COUPON_NO").val()
			},
			success:function(data) {
					$.each(data.list, function(key, value) {
						str += "<div class='form-group' style='margin-top: 50px;'>"
							+ "<label class='col-sm-2 control-label'>쿠폰번호</label>"
							+ "<div class='col-sm-10'><p class='form-control-static' style='letter-spacing: 2px; margin-bottom: 20px;'>"+value.COUPON_NO+"</p></div>"
							+ "<input type='hidden' id='COUPON_NO' value='"+value.COUPON_NO+"' />"
	
							+ "<label class='col-sm-2 control-label'>쿠폰명　</label>"
							+ "<div class='col-sm-10'>"
							+ "<input type='text' class='form-control' style='width: 450px; margin-bottom: 20px;' id='COUPON_ID' placeholder='쿠폰명을 입력해주세요 (최대 10자)' maxlength='10' value='"+value.COUPON_ID+"'>"
							+ "</div>"
	
							+ "<label class='col-sm-2 control-label'>할인율　</label>"
							+ "<div class='col-sm-10'><input type='text' class='form-control' style='width: 450px; margin-bottom: 20px;' id='COUPON_VALUE' placeholder='할인율을 숫자로 입력해주세요.' maxlength='2' value='"+value.COUPON_VALUE+"' numberOnly></div>"
	
							+ "<label class='col-sm-2 control-label'>쿠폰기간</label>"
							+ "<div class='col-sm-10'><input type='text' class='form-control' style='width: 250px; margin-bottom: 20px;' id='cal' name='daterange' placeholder='달력을 통해 기간을 설정해주세요.' value='"+value.COUPON_S_VALIDITY+"  ~  "+value.COUPON_E_VALIDITY+"' readonly/></div>"
							+ "<input type='hidden' id='from_date' value='"+value.COUPON_S_VALIDITY+"'>"
							+ "<input type='hidden' id='to_date' value='"+value.COUPON_E_VALIDITY+"'>"
	
							+ "<label class='col-sm-2 control-label'>쿠폰상태</label>"
							+ "<div class='col-sm-10'><input type='text' class='form-control' style='width: 250px; margin-bottom: 20px;' id='COUPON_STATE' value='"+value.COUPON_STATE+"' readonly/></div>"
							+ "</div>"
							+ "<div style='text-align: center;'>"
	
							+ "<a href='#this' id='modify' class='btn btn-default' style='margin: 0 10px 0 0;'>수정하기</a>"
							+ "<a href='#this' id='go_home' class='btn btn-default' style='margin: 0 0 0 10px;'>목록으로</a>"
							+ "</div>";
					});
					body.append(str);
					
					$(function(){
	 					$("#modify").on("click", function(e) {
	 						e.preventDefault();
	 						fn_modify($(this));
	 					});
	 				});
	 				
	 				$(function(){
	 					$("#go_home").on("click", function(e) {
	 						e.preventDefault();
	 						location="<c:url value='/adminCouponList.do' />";
	 					});
	 				});
	 				
	 				// 할인율 숫자만 입력되게 설정
	 				$("input:text[numberOnly]").on("focus", function() {
	 				    var dc = $(this).val();
	 				    dc.replace(/[^0-9]/g,"");
	 				    $(this).val(dc);
	 				}).on("focusout", function() {
	 					var dc = $(this).val();
	 					dc.replace(/[^0-9]/g,"");
	 				    $(this).val(dc);
	 				}).on("keyup", function() {
	 				    $(this).val($(this).val().replace(/[^0-9]/g,""));
	 				});
					
	 				// 달력 컨트롤
	 				$(function() {
	 					$('input[name="daterange"]').daterangepicker({
	 						autoUpdateInput: false, //최초 값을 오늘-오늘로 표기되지 않게 false 처리
	 						opens: 'right', //달력창 오픈 위치
	 						locale: {format: 'YYYY-MM-DD'} //dateformat : yyyy-mm-dd
	 					}, function(start, end, label) {
	 						//개발자모드 콘솔에 log 찍는 기능
	 						console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	 						
	 						//이전 데이터 보관용도로 attr 처리
	 						$('#from_date').attr('value', start.format('YYYY-MM-DD'));
	 						$('#to_date').attr('value', end.format('YYYY-MM-DD'));
	 					});
	 					
	 					$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) { //달력에서 apply 버튼 클릭하면
	 						var from = picker.startDate.format('YYYY-MM-DD');
	 						var to = picker.endDate.format('YYYY-MM-DD');
	 						var currentdate = $("#currentdate").val();
	 						
	 						//기간에 따라 상태 값 attr 처리
	 						if (to < currentdate) {
	 							$('#COUPON_STATE').attr('value', '종료');
	 						}
	 						else if (from > currentdate) {
	 							$('#COUPON_STATE').attr('value', '예정');
	 						}
	 						else if (from != null && to != null) {
	 							$('#COUPON_STATE').attr('value', '진행중');
	 						}
	 						else {}
	 						
	 						$(this).val(from + '   -   ' + to);
	 					});
	 					$('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) { //달력에서 calcel 버튼 클릭하면
	 						var from = $('#from_date').val();
	 						var to = $('#to_date').val();
	 						if (from != null && to != null) {
	 							$(this).val(from+'   -   '+to);
	 						}
	 						else {
	 							$(this).val('');
	 						}
	 						
	 					});
	 				});
			}
	});
});
</script>

<script>
function fn_modify(obj) {
	var COUPON_NO = $("#COUPON_NO").val();
	var COUPON_ID = $("#COUPON_ID").val();
	var FROM_DATE = $("#from_date").val();
	var TO_DATE = $("#to_date").val();
	var COUPON_VALUE = $("#COUPON_VALUE").val().replace(/[^0-9]/g,"");
	var COUPON_STATE = $("#COUPON_STATE").val();
	var COUPON_TYPE = $("#view_type").val();
	
	if (COUPON_ID == null || COUPON_ID == "") {
		alert('쿠폰명을 입력해주세요.');
		return false;
	}
	if (COUPON_VALUE == null || COUPON_VALUE == "") {
		alert('할인율을 입력해주세요.');
		return false;
	}
	if (FROM_DATE == null || FROM_DATE == "" || TO_DATE == null || TO_DATE == "") {
		alert('쿠폰기간 설정 바랍니다.');
		$("#cal").focus();
		return false;
	}
	if (COUPON_NO == null    || COUPON_NO    == "" ||
		COUPON_STATE == null || COUPON_STATE == "" ||
		COUPON_TYPE == null  || COUPON_TYPE  == ""   ) {
		alert('잘못된 접근입니다.');
		location = "<c:url value='/adminCouponList.do' />";
		return false;
	}

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminCouponInU.do' />");
	comSubmit.addParam("COUPON_NO", COUPON_NO);
	comSubmit.addParam("COUPON_ID", COUPON_ID);
	comSubmit.addParam("COUPON_S_VALIDITY", FROM_DATE);
	comSubmit.addParam("COUPON_E_VALIDITY", TO_DATE);
	comSubmit.addParam("COUPON_VALUE", COUPON_VALUE);
	comSubmit.addParam("TYPE", COUPON_TYPE);
	comSubmit.submit();
}
</script>

</html>