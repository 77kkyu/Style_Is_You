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
<title>이벤트관리</title>
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
</style>

<body>
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
alert(mag); 
document.location.href = url;
</script>
<div style="width: 1200px; margin: 50px 0 0 350px;">
	
	<!-- include) 사이드바 -->	
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %> 

	<!-- s 상단 탭 영역 -->
	<!-- e 상단 탭 영역 -->
	
	<!-- s 하단 리스트 영역 -->
	<div class="eventDetail_bottomDiv">
		<h3 class="text-muted" style="text-align: center;">이벤트 정보 입력</h3>
		<form class="form-horizontal">
			<input type="hidden" id="view_type" value="${param.TYPE}">
			<input type="hidden" id="view_no" value="${param.EVENT_NO}"/>
			<input type="hidden" class="date" id="currentdate" value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
			
			<table name="eventList" class="table table-striped">
				<tbody>
				
				</tbody>
			</table>
		</form>
	</div>
	
	<form id="commonForm" name="commonForm"></form>
	<!-- e 하단 리스트 영역 -->

</div>
</body>
<script>
$(document).ready(function(){
	var body = $("table[name='eventList'] > tbody");
	var str = "";
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/adminEventDetail.do",
			data: {
				"EVENT_NO":$("#view_no").val()
			},
			success:function(data) {
					$.each(data.list, function(key, value) {
	 					str += "<div name='a_div' class='form-group' style='margin-top: 50px;'>"
	 						+ "	<label class='col-sm-2 control-label'>이벤트번호</label>"
	 						+ "	<div class='col-sm-10'><p class='form-control-static' style='letter-spacing: 2px; margin-bottom: 20px;'>"+value.EVENT_NO+"</p>"
	 						+ "	</div>"
	 						+ "		<input type='hidden' id='EVENT_NO' value='"+value.EVENT_NO+"' />"

	 						+ "	<label class='col-sm-2 control-label'>이벤트명　</label>"
	 						+ "	<div class='col-sm-10'>"
	 						+ "	<input type='text' class='form-control' style='width: 450px; margin-bottom: 20px;' id='EVENT_TITLE' value='"+value.EVENT_TITLE+"' maxlength='40' placeholder='이벤트명을 입력해주세요.'>"
	 						+ "	</div>"

	 						+ "	<label class='col-sm-2 control-label'>등록일자　</label>"
	 						+ "	<div class='col-sm-10'><input type='text' class='form-control' style='width: 100px; margin-bottom: 20px;' id='EVENT_DATE' value='"+value.EVENT_DATE+"' readonly/>"
	 						+ " <p style='color: red; font-size: 12px;'>※ 이벤트 정보를 수정할 경우 등록일자는 수정한 날짜로 변경됩니다.</p>"
	 						+ "	</div>"

	 						+ "	<label class='col-sm-2 control-label'>공개여부　</label>"
	 						+ "	<div class='col-sm-10'>"
	 						+ "<select name='EVENT_GUBUN' id='EVENT_GUBUN' class='form-control' style='width: 100px; margin-bottom: 20px;'>";
	 					if ($.trim(value.EVENT_STATE) == '공개') {
	 						str +="<option value='1' selected>공개</option>"
	 							+ "	<option value='0'>비공개</option>";
	 					} else {
	 						str +=" <option value='1'>공개</option>"
	 							+ " <option value='0' selected>비공개</option>";
	 					}
		 				str +="</select>"
	 						+ "	</div>"
	 						
	 						+ "	<label class='col-sm-2 control-label'>상세내용　</label>"
	 						+ "	<div class='col-sm-10' style='margin: 0 0 20px 0;'>"
	 						+ "	<textarea class='form-control' rows='30' cols='50' style='width: 450px; margin-bottom: 20px;' id='EVENT_CONTENT' name='EVENT_CONTENT'>"+value.EVENT_CONTENT+"</textarea>"
	 						+ "	</div>"
	 						+ "</div>"
	 						+ "<div style='text-align: center;'>"
	 						+ "<a href='#this' id='modify' class='btn btn-default' style='margin: 0 10px 0 0;'>수정하기</a>"
	 						+ "<a href='#this' id='go_home' class='btn btn-default' style='margin: 0 0 0 10px;'>목록으로</a>"
	 						+ "</div>"
	 						+ "</div>";
	 						
					});
 				body.append(str);
 				
 				//CKEDITOR
 				$(function(){
 					CKEDITOR.replace('EVENT_CONTENT',
 						{
 					        width:'600px',
 					        height:'400px',
 							filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload.do'	
 						});
 				});
 				
 				$(function(){
 					$("#modify").on("click", function(e) {
 						e.preventDefault();
 						fn_modify($(this));
 					});
 				});
 				
 				$(function(){
 					$("#go_home").on("click", function(e) {
 						e.preventDefault();
 						location="<c:url value='/adminEventList.do' />";
 					});
 				});
		}
	
	});
});
</script>
<script>
function fn_modify(obj) {
	var comSubmit = new ComSubmit();
	var EVENT_NO = $("#EVENT_NO").val();
	var EVENT_TITLE = $("#EVENT_TITLE").val();
	var EVENT_DATE = $("#EVENT_DATE").val();
	var EVENT_GUBUN = $("#EVENT_GUBUN").val();
	var EVENT_CONTENT = CKEDITOR.instances["EVENT_CONTENT"].getData();//v
	
	if (EVENT_NO == ""    || EVENT_NO    == null ||
		EVENT_DATE == ""  || EVENT_DATE  == null ||
		EVENT_GUBUN == "" || EVENT_GUBUN == null) {
		alert('잘못된 접근입니다.');
		location="<c:url value='/adminEventList.do' />";
		return false;
	}
	if (EVENT_TITLE == "" || EVENT_TITLE == null) {
		alert('이벤트명 입력 바랍니다.');
		return false;
	}
	if (EVENT_CONTENT == "" || EVENT_CONTENT.length == 0) {
		alert('상세내용 입력 바랍니다.');
		return false;
	}
	
	//alert(EVENT_NO+" : "+EVENT_TITLE+" : "+EVENT_DATE+" : "+EVENT_GUBUN+" : "+EVENT_CONTENT);
	comSubmit.setUrl("<c:url value='/adminEventInU.do' />");
	comSubmit.addParam("EVENT_NO", EVENT_NO);
	comSubmit.addParam("EVENT_TITLE", EVENT_TITLE);
	comSubmit.addParam("EVENT_DATE", $("#currentdate").val());
	comSubmit.addParam("EVENT_GUBUN", EVENT_GUBUN);
	comSubmit.addParam("EVENT_CONTENT", EVENT_CONTENT);
	comSubmit.addParam("TYPE", $("#view_type").val());
	comSubmit.submit();
}
</script>

</html>


