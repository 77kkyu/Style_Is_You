<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>이벤트</title>
<head>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

<!-- 링크) jQuery 링크 -->
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<!-- 링크) 커스텀 페이징 js -->
<script src="<c:url value='/js/common_dw.js'/>" charset="utf-8"></script>

</head>
<style>
.eventDetail_bottomDiv {margin: 100px 0 100px 0; border: 1px solid darkgray; width: 900px; padding: 50px 0 50px 50px; border-radius: 30px;}
.eventDetail_Btn {border: 1px solid #cee; background: #cee; padding: 8px; border-radius: 10px;}
.eventDetail_Btn:hover {font-weight: bold;}
</style>

<body>

<!-- include) 사이드바 -->	
<%@include file="/WEB-INF/tiles/header.jsp" %> 
<div style="height: auto;">
<div style="display: flex; justify-content: center; align-items: center;">
<div style="display: inline-block; color: black; margin-bottom: 60px;">
	<div style="text-align: -webkit-center;">
	
		<!-- s 상단 탭 영역 -->
		<!-- e 상단 탭 영역 -->
	
		<!-- s 하단 리스트 영역 -->
		<div style="width: 1200px; margin: 20px 0 0 0;">
		<form>
			<input type="hidden" id="view_no" value="${param.EVENT_NO}">
			<table style="width: 80%; text-align: center;" name="eventList" class="table table-striped">
				<tbody>
				
				</tbody>
			</table>
		</form>
		</div>
		<div style='margin: 40px 0 0 0;'>
			<a href='#this' id='go_home' class='eventDetail_Btn'>목록으로</a>
		</div>
		<form id="commonForm" name="commonForm"></form>
		<!-- e 하단 리스트 영역 -->
		
	</div>
</div>
</div>
</div>
</body>
<script>
$(document).ready(function(){
	var body = $("table[name='eventList'] > tbody");
	var str = "";
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/event/detail.do",
			data: {
				"EVENT_NO":$("#view_no").val()
			},
			success:function(data) {
					$.each(data.list, function(key, value) {
	 					str += "<tr><td>"+value.EVENT_CONTENT+"</td></tr>";
					});
 				body.append(str);
 				
		}
	
	});
});
$(function() {
	$("#go_home").on("click", function(e) {
		e.preventDefault();
		location = "<c:url value='/event/list.do' />";
	})
});
$("#go_home").on(click)
</script>
</html>
