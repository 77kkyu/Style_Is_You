<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품리스트</title>
<head>
<script type="text/javascript">
 var img=new Array();
img[0]=new Image(); img[0].src="../img/옷1.JPG";
img[1]=new Image(); img[1].src="../img/옷2.JPG";
img[2]=new Image(); img[2].src="../img/옷3.JPG"; 
var interval=1500;
var n=0;
// each 함수 반복문 DB에서 이미지 뽑아오기..?
var imgs = new Array("../img/옷1.JPG","../img/옷2.JPG","../img/옷3.JPG","../img/옷4.JPG");

function rotate() {
	
if(navigator.appName=="Netscape" && document.getElementById) {
	
document.getElementById("slide").src=imgs[n];

}else document.images.slide.src=imgs[n];
(n==(imgs.length-1))?n=0:n++;
setTimeout("rotate()",interval);

}

</script>

<style>
.list li {
  border-bottom: 1px solid #ccc;
  display: table;
  border-collapse: collapse;
  width: 100%;
}
.inner {
  display: table-row;
  overflow: hidden;
}
.li-img {
  display: table-cell;
  vertical-align: middle;
  width: 40%;
  padding-right: 1em;
}
.li-img img {
  display: block;
  width: 100%;
  height: auto;
}
.li-text {
  display: table-cell;
  vertical-align: middle;
  width: 60%;
}
.li-head {
  margin: 0;
}
.li-sub {
  margin: 0;
}

@media all and (min-width: 40em) {
  .list {
    padding: 0.5em;
    max-width: 70em;
    margin: 0 auto;
    overflow: hidden;
  }
  .list li {
    padding: 0.5em;
    display: block;
    width: 50%;
    float: left;
    background: none;
    border: 0;
  }
  .inner {
    display: block;
  }
  .li-img, .li-text, .inner {
    display: block;
    width: auto;
    padding: 0;
  }
  .li-text {
    padding: 0.5em 0;
  }
}

@media all and (min-width: 60em) {
  .list li {
    width: 33.33333333%;
  }
}
</style>

</head>
<body onload="rotate()">

<div align="right" style="margin-right:160px">
<form>
	<table>
		<tr>
			<td><a href="">신상품순</a></td> <td>|</td>
			<td><a href="">인기상품순</a></td> <td>|</td>
			<td><a href="">낮은가격순</a></td> <td>|</td>
			<td><a href="">높은가격순</a></td> <td>|</td>
			<td><a href="">판매량순</a></td>
		</tr>
	</table>
</form>
</div>

<%-- <div align="center">
 <div id="pattern" class="pattern">
  	<ul class="list img-list">
  	
  	<c:forEach items="${list}" var="list">
  		
			<li>
				<a href="" class="inner">
					<div class="li-img">
						<img src="../img/옷1.JPG" id="slide"/>
					</div>
					<div align="left">
						${list.GOODS_NAME }<br><br>
						${list.GOODS_SELL_PRICE }원
					</div>
				</a>
			</li>
	</c:forEach>
		</ul>
	</div>
</div> --%>

<c:set var="i" value="0" />
 <c:set var="j" value="4" />
 <table style="padding:200px; margin-top:-150px;">
  <c:choose>
   <c:when test="${list != null && fn:length(list) > 0 }">
    <c:forEach items="${list}" var="list">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     <td>
     <div class="list img-list">
     <a href="" class="inner">
     <div class="li-img">
		<img src="../img/옷1.JPG" id="slide"/>
	</div>
	<div align="left">
		${list.GOODS_NAME }<br><br>
		${list.GOODS_SELL_PRICE }원
	</div>
	</a>
	</div>
	</td>
    <c:if test="${i%j == j-1}">
     </tr>
    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
   </c:when>
  <c:otherwise>
   <tr>
    <td>존재하지 않습니다.</td>
   </tr>
  </c:otherwise>
  </c:choose>
 </table>



</body>
</html>
