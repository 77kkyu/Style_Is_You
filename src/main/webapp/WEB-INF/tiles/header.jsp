<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div align="right" style="margin-right:200px">
<form>
	<table>
		<tr>
			<td><a href="">로그인</a></td> <td>|</td>
			<td><a href="">회원가입</a></td> <td>|</td>
			<td><a href="">마이페이지</a></td> <td>|</td>
			<td><a href="">고객센터</a></td> <td>|</td>
			<td><a href="">장바구니</a></td>
			<td><a href="">쿠폰</a></td>
		</tr>
	</table>
</form>
</div>

</div>
<div class="pagemid">
  <div class="wrapper2">
    <h1>스타일너다</h1>
    <ul class="flex-menu">
      <li><a href="http://localhost:8080/stu/shop/newGoodsList.do">BEST</a></li>
      <li><a href="http://localhost:8080/stu/shop/bestGoodsList.do">NEW</a></li>
      <li><a href="">OUTER</a></li>
      <li><a href="">TOP</a></li>
      <li><a href="">ONE-PIECE</a></li>
      <li><a href="">BOTTOM</a></li>
      <li><a href="">ACC</a></li>
    </ul>
    <br>
    <div class="bar">
    </div>
     

  </div>

</div>

</div>
</body>
</html>