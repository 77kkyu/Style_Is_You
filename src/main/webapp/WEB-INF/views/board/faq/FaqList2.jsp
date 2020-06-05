<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script> 
function fn_spread(id){ 
	var getID = document.getElementById(id); 
	getID.style.display=(getID.style.display=='block') ? 'none' : 'block'; 
} 
</script> 

</head>
<body>

<button class="btn01" 
	onclick="document.getElementById('hiddenContent01').style.display=(document.getElementById('hiddenContent01').style.display=='block') ? 'none' : 'block';">펼치기</button> 
	<div id="hiddenContent01" class="example01" style="display: block;">내용</div> 

</body>
</html>