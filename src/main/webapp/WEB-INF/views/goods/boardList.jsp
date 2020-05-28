<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>bloggers</title>
<head>

</head>
<body>

<h2>게시판 목록</h2>
<table class="board_list">

	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">가격</th>
		</tr>
	</thead>
	
	<tbody>
             
                
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.GOODS_NO }</td>
                            <td>${row.GOODS_NAME }</td>
                            <td>${row.GOODS_READCNT}</td>
                            <td>${row.GOODS_SELL_PRICE }</td>
                        </tr>
                    </c:forEach>
             
	</tbody>
	</table>
	
	
	<br>

<a href="#this" class="btn" id="write">글쓰기</a>


</body>
</html>