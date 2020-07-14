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
<title>이벤트관리</title>

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

<style>
img {vertical-align: middle;}
.h_title {text-align: center; margin: 50px 0 20px 0; font-style: italic; letter-spacing: 15px; font-size: 30px; color: #666;}
</style>
</head>

<body>

<!-- include) 사이드바 -->	
<%@include file="/WEB-INF/tiles/header.jsp" %> 
	<div style="text-align: -webkit-center; margin: 0 0 50px 0;">
	<p class="h_title">EVENT</p>
		<!-- s 상단 탭 영역 -->
		<!-- e 상단 탭 영역 -->
	
		<!-- s 하단 리스트 영역 -->
		<div>
		<form>
			<table name="eventList" class="table table-striped">
				<tbody>
				
				</tbody>
			</table>
		</form>
		</div>
		
		<div style="width: 100%; text-align: center; margin: 20px 0 0 0;" id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		
		<form id="commonForm" name="commonForm"></form>
		
		<!-- e 하단 리스트 영역 -->	
	</div>
</body>

<script>
//최초 조회시 스크립트 호출
$(document).ready(function(){
	fn_eventList(1); //스크립트 호출
});

/*페이징 함수*/
function fn_eventList(pageNo)	{ //pageNo : 호출하고자 하는 페이지 번호
	var comAjax = new ComAjax();
		
	comAjax.setUrl("<c:url value='/event/list.do' />");
	comAjax.setCallback("fn_listCallBack");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 3);
	
	comAjax.ajax();	
}

function fn_listCallBack(data){
	var total = data.TOTAL;
	var body = $("table[name='eventList'] > tbody");
	
	body.empty();
	if(total == 0){
		var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_eventList",
				recordCount : 3
			};
			gfn_renderPaging(params);
		var str = "<tr><td colspan='6'>조회된 결과가 없습니다.</td></tr>";
		body.append(str);
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_eventList",
			recordCount : 3
		};
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>"
					+ "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>"
					+ 	"<a href='#this' name='eventClick'><img alt='image' width='1000px' height='200px' style='margin: 20px 0 0 0; border: 1px solid #DCDCDC; border-radius: 10px;' src='/stu/file/" + value.EVENT_THUMBNAIL + "'></a>"
					+	"<input type='hidden' id='EVENT_NO' value='"+value.EVENT_NO+"'>"
					+ "</td>"
			    + "</tr>";
		});
		
		body.append(str);
		
		$(function(){
			$("a[name^='eventClick']").on("click", function(e) {
				e.preventDefault();
				fn_event($(this));
			});
		});
	
	}
}
</script>
<script>
function fn_event(obj) {
	var comSubmit = new ComSubmit();
	var EVENT_NO = obj.parent().find("#EVENT_NO").val();
	
	comSubmit.setUrl("<c:url value='/event/detailViewForm.do' />");
	comSubmit.addParam("EVENT_NO", EVENT_NO);
	if (EVENT_NO == null || EVENT_NO == "" || EVENT_NO == '0') {
		alert('error.key_empty');
		return false;
	}
	comSubmit.submit();
}
</script>
</html>