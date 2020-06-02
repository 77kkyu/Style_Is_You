<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<style>


</style>
<body>

<br>

<div style="">

<div style="float:left; margin-left:300px">
	<table border="1">
		<tr>
			<td><img src="/stu/img/옷1.JPG" width="500" height="500"/></td>
		</tr>
	</table>
</div>

<div style=" float:left; margin-left:30px">
	<table>
		<tr>
			<td>${list.GOODS_PICK}</td>
				
		</tr>
		
<!-- 		<tr>
			<td>&nbsp;&nbsp;</td>
		</tr> -->
		
		<tr>
			<td>${list.GOODS_NAME}</td>
		</tr>
		
		<tr>
			<td><hr style="border-top:1px solid #bbb;"  width=300px></td>
		</tr>
		
	</table>
	
</div>



</div>

</body>
</html>