<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STYLE IS YOU</title>
</head>

<body>


	<div id="header">
		<tiles:insertAttribute name="header" ignore="true"/><!-- // header -->
	</div>
	<div id="content">
		<tiles:insertAttribute name="content" ignore="true" />
	</div>	
<br>
<br>
	<div id="footer">
		<tiles:insertAttribute name="footer" ignore="true"/>	
	</div>


</body>
</html>