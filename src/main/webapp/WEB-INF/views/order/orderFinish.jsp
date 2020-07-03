   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>
<script src="/stu/js/jquery-3.0.0.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/stu/js/common.js" charset="utf-8"></script>

<script type="text/javascript">


</script>


</head>

<style>

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  
</style>

<body>
    <div class="container">

      <div style="width:1140px; height:50px; margin:10px; padding:12px; border:1px solid #dcdcdc">
      	<table>
      		<tr>
      			<td style="text-align:left; font-size:17px; font-weight:bold;">주문완료</td>
      		</tr>
      	</table>
      </div>

          <div align="center">
          	<table style="align:center">
      			<tr>
      				<td style="text-align:center; font-size:17px; font-weight:bold;">주문이 완료되었습니다.</td>
      			</tr>
      			<tr>
      				<td style="text-align:center; font-size:17px; font-weight:bold;">
      					주문번호는 <a href="/stu/my_detail.do?order_no=${map.ORDER_NO }">${map.ORDER_NO }</a>입니다
      				</td>
      			</tr>
      		</table>
          </div>
          <br><br>
           
            <div style="text-align:center">
          		<input type="button" name="main" value="메인으로" onClick="location.href='/stu/main.do'">
            	<input type="button" name="orderList" value="주문확인" onclick="location.href='/stu/myOrderList.do'">
            </div>

  </body>
</html>