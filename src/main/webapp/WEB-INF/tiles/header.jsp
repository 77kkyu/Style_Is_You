<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="840345488051-t7d9q5tg8he8kt3om4dmlovpjom64m3q.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>



</head>
<style>
* {
  margin: 0;
  padding: 0;
}

body {
 /*  font-family: Verdana, Arial; */
  font-family: 'Open Sans', sans-serif;
}

a {
  text-decoration: none;
  color: #666;
  
}

a:hover {
  /* background-color: yellow; */
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
  max-width: 1200px;
  margin: 0 auto;
}

h1 {
  text-align: center;
  padding: 50px 0;
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

/* 검색 */

#search51{
    background: url(data:image/png;base64,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) no-repeat 10px 6px #fcfcfc;
    border:1px solid #d1d1d1;
    font: bold 12px Arial, Helvetica, Sans-serif;
    color:#bebebe;
    width:150px;
    padding:6px 15px 6px 35px;
    border-radius:20px;
    text-shadow:0 2px 3px rgba(0,0,0,0.1);
    box-shadow:0 1px 3px rgba(0,0,0,0.15) inset;
    -webkit-transition: all 0.7s ease 0s;
}

#search51:focus{
    width:200px;
    outline:0;
}

</style>
<body>

<div class="header">
<div class="pagetop">

<div align="right" style="margin-right:300px">
<form name="frm">
	
		<tr>
		
			<c:set var="MEMBER_NO" value="${SESSION_NO }" />
			<c:choose>
				<c:when test="${MEMBER_NO eq null}">
					<td><a href="/stu/loginForm.do">로그인</a></td> <td> | </td>
					<td><a href="/stu/joinForm.do">회원가입</a></td> <td> | </td>
					<td><a href="/stu/loginForm.do">마이페이지</a></td> <td> | </td>
					<td><a href="/stu/event/list.do">이벤트</a></td> <td> | </td>
				</c:when>
				<c:otherwise>
					<td>Hi, ${SESSION_NAME }님!</td> <td> | </td>
					<td><a href="#" onClick="signOut();">로그아웃</a></td> <td> | </td>
					<td><a href="/stu/myOrderList.do">마이페이지</a></td> <td> | </td>
					<td><a href="/stu/basket/basketList.do">장바구니</a></td> <td> | </td>
					<td><a href="/stu/event/list.do">이벤트</a></td> <td> | </td>
				</c:otherwise>
			</c:choose>
			
			
			<td><a href="/stu/faq/openFaqList.do">고객센터</a></td> <td> | </td>
		</tr>
	
</form>
</div>
</div>


<!-- 검색 -->
<div style="margin-left:23%;">
<form method="post" action="/stu/shop/openMainSearch.do" id="searchbox5">
        <input id="search51" name="keyword" type="text" size="40" placeholder="#원피스 #가디건 #데일리" value="${keyword1}"/>
</form>
</div>




<!-- 메뉴 -->
<div class="pagemid">
  <div class="wrapper2">
   <I><h1><a href="/stu/main.do">STYLE IS YOU</a></h1></I>
    <ul class="flex-menu">
      <li>&nbsp;</li>
      <li><a href="#">서비스소개</a></li>
      <li><a href="/stu/shop/bestGoodsList.do">BEST</a></li>
      <li><a href="/stu/shop/newGoodsList.do">NEW</a></li>
      <li><a href="/stu/shop/goodsList/outer/NewItem.do">OUTER</a></li>
      <li><a href="/stu/shop/goodsList/top/NewItem.do">TOP</a></li>
      <li><a href="/stu/shop/goodsList/one-piece/NewItem.do">ONE-PIECE</a></li>
      <li><a href="/stu/shop/goodsList/bottom/NewItem.do">BOTTOM</a></li>
      <li><a href="/stu/shop/goodsList/acc/NewItem.do">ACC</a></li>
    </ul>
    <br>
    <div class="bar">
    </div>
  </div>
</div>

</div>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		var data = {};
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/logout.do",
			data : JSON.stringify(data), 
			dataType : "json",   
			contentType:"application/json;charset=UTF-8",
		    async: false,
			success : function(data, status, xhr) {
				console.log(data);
				if (auth2 != null && auth2 != "undefined") {
					auth2.signOut().then(function() {
						console.log('User signed out.');
						if (!Kakao.Auth.getAccessToken()) {
							  console.log('Not logged in.');
							  return;
						}
						Kakao.Auth.logout(function() {
						  alert(Kakao.Auth.getAccessToken());
						}); 
					});
				}
		 		
					location.href=data.URL;
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러가 발생했습니다.");
			}
		});

	}
	function onLoad() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}
</script>
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>
</html>