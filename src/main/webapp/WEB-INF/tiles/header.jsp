<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
    
<%
	String sessionName = (String)session.getAttribute("MEMBER_NAME");
	String sessionId = (String)session.getAttribute("MEMBER_ID");

%>


    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<style>
* {
  margin: 0;
  padding: 0;
}

body {
  font-family: Verdana, Arial;
}

a {
  text-decoration: none;
  color: #000;
  
}

a:hover {
  background-color: yellow;
}

.pagetop {
  background-color: rgba(0, 0, 0, 0.1);
}

.wrapper {
/*   background-color: pink; */
  max-width: 1000px;
  height: 40px;
  margin: 0 auto;
  position: relative;
}

.search-bar {
  position: absolute;
  top: 5px;
}

.search-bar input {
  background-color: transparent;
  border-bottom: 1px solid #000;
  border-right: 0;
  border-top: 0;
  border-left: 0;
}

.blog {
  position: absolute;
  top: 5px;
  right: 200px;
}

.store {
  position: absolute;
  top: 5px;
  right: 0;
}

.wrapper2 {
  max-width: 1000px;
  margin: 0 auto;
}

h1 {
  text-align: center;
  padding: 100px 0;
  font-weight: normal;
  font-size: 4em;
  letter-spacing: 10px;
}

li {
  list-style: none;
  float: left;
  
}

.bar {
  height: 1.5px;
  width: 100%;
  background-color: #DCDCDC;
}

.flex-menu {
  display: flex;
  
}

.flex-menu li {
  width: 100%;
}


</style>
<body>

<div class="header">
<div class="pagetop">

<div align="right" style="margin-right:100px">
<form name="frm">
	
		<tr>
		<%
			if(sessionId == null) { // 로그인 전 (세션 값 X)
		%>
			<td><a href="/stu/loginForm.do">로그인</a></td> <td> | </td>
			<td><a href="/stu/joinForm.do">회원가입</a></td> <td> | </td>
		<%
			} else if(sessionId != null) { // 로그인 후 (세션 값 O)
		%>
			<td>Hi, ${MEMBER_NAME }님!</td> <td> | </td>
			<td><a href="/stu/logout.do">로그아웃</a></td> <td> | </td>
		<%
			}
		%>
		<%
			if(sessionId != null) {
		%>
			<td><a href="/stu/myOrderList.do">마이페이지</a></td> <td> | </td>
		<%
			} else {
		%>
			<td><a href="/stu/loginForm.do">마이페이지</a></td> <td> | </td>
		<%
			}
		%>
			<td><a href="/stu/faq/openFaqList.do">고객센터</a></td> <td> | </td>
		
		<c:set var="MEMBER_NO" value="${MEMBER_NO}" />
		<c:choose>
			<c:when test="${MEMBER_NO eq null}">
				<c:set var="url2" value="/stu/loginForm.do" />
			</c:when>
			<c:otherwise>
				<c:set var="url2" value="/stu/basket/basketList.do" />
			</c:otherwise>
		</c:choose>
			<td><a href="${url2}">장바구니</a></td> <td> | </td>
			
			<td><a href="/stu/my/myPointList.do">포인트</a></td>
			<td><a href="/stu/my/myCouponList.do">쿠폰</a></td>
			<td><a href="/stu/my/myLikeList.do">좋아요</a></td>
			
		</tr>
	
</form>
</div>

</div>
<div class="pagemid">
  <div class="wrapper2">
    <h1><a href="http://localhost:8080/stu/main.do">스타일너다</a></h1>
    <ul class="flex-menu">
      <li><a href="http://localhost:8080/stu/shop/bestGoodsList.do">BEST</a></li>
      <li><a href="http://localhost:8080/stu/shop/newGoodsList.do">NEW</a></li>
      <li><a href="http://localhost:8080/stu/shop/goodsList/outer/NewItem.do">OUTER</a></li>
      <li><a href="http://localhost:8080/stu/shop/goodsList/top/NewItem.do">TOP</a></li>
      <li><a href="http://localhost:8080/stu/shop/goodsList/one-piece/NewItem.do">ONE-PIECE</a></li>
      <li><a href="http://localhost:8080/stu/shop/goodsList/bottom/NewItem.do">BOTTOM</a></li>
      <li><a href="http://localhost:8080/stu/shop/goodsList/acc/NewItem.do">ACC</a></li>
    </ul>
    <br>
    <div class="bar">
    </div>
     

  </div>

</div>

</div>
</body>
</html>