<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>FAQ 게시판리스트</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
	<h2 align="center">FAQ</h2>
<table style="border:1px solid #ccc" align="center">
	<colgroup>
		<col width="100"/>
		<col width="800"/>
	</colgroup>
			<tbody>
	<thead>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
	<c:forEach items="${list }" var="row">
		<tr>
			<th>제목</th>	<br/>
			<td>${row.NOTICE_TITLE }</td>
			<a href="#this" name="title">${row.NOTICE_TITLE }</a>
								<input type="hidden" id="NOTICE_NO" value="${row.NOTICE_TITLE }">
		</tr>
		<hr></hr>
		<tr>
			<th>내용</th>
			<td>${row.NOTICE_CONTENT }</td>
		</tr>
	</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</thead>		
	</tbody>
	</table>
	
	<a href="#this" class="btn" id="write">글쓰기</a>
	
	<script type="text/javascript">

	$(document).ready(function(){
		  
		 $("#write").on("click", function(e){ //글쓰기 버튼 
			 e.preventDefault(); 
			 fn_openFaqWrite(); 
			 });
		  
		 $("a[name='title']").on("click", function(e){ //제목 
			 e.preventDefault(); 
			 fn_openFaqDetail($(this)); 
			 }); 
		 });
	 
		 function fn_openFaqWrite(){ 
			 var comSubmit = new ComSubmit(); 
			 comSubmit.setUrl("<c:url value='/board/openFaqWrite.do' />"); 
			 comSubmit.submit(); 
			 }
		  
		 function fn_openFaqDetail(obj){ 
			 var comSubmit = new ComSubmit(); 
			 comSubmit.setUrl("<c:url value='/board/openFaqDetail.do' />"); 
			 comSubmit.addParam("NOTICE_NO", obj.parent().find("#NOTICE_NO").val()); 
			 comSubmit.submit(); 
			 }
	</script>
</body>
</html>