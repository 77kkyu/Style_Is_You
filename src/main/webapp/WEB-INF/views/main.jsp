<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">

<title>메인화면</title>
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/goods.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet"> 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<head>
<script type="text/javascript">
/*  var img=new Array();
img[0]=new Image(); img[0].src="/stu/img/옷1.JPG";
img[1]=new Image(); img[1].src="/stu/img/옷2.JPG";
img[2]=new Image(); img[2].src="/stu/img/옷3.JPG"; 
var interval=1500;
var n=0;

var imgs = new Array("/stu/img/옷1.JPG","/stu/img/옷2.JPG","/stu/img/옷3.JPG","/stu/img/옷4.JPG");

function rotate() {
	
if(navigator.appName=="Netscape" && document.getElementById) {
	
document.getElementById("slide").src=imgs[n];

}else document.images.slide.src=imgs[n];
(n==(imgs.length-1))?n=0:n++;
setTimeout("rotate()",interval);

} */
</script>

<style>

/* 폰트 */
.mTitle {
    position: relative;
    text-align: center;
    padding: 50px 0 40px;
    font-family: sans-serif;
    color: #666;
    font-size: 26px;
    font-weight: 100;
    margin: 0;
    line-height: 0px;
    align:center;
}



</style>

</head>
<body>

<br>
<div align="center">
<ul class="bxslider">
      <li><a href="#"><img src="../stu/img/메인이미지2.jpg" ></a></li>
      <li><a href="#"><img src="../stu/img/메인이미지1.jpg" alt="" ></a></li>
      <li><a href="#"><img src="../stu/img/메인이미지3.jpg" alt="" ></a></li>
      <li><a href="#"><img src="../stu/img/메인이미지4.jpg" alt="" ></a></li>
</ul>
</div>




<div align="center">
	<h1 class="mTitle">NEW ITEM</h1>
</div>

<div id="main-container">

<table class="board_list" style="width:'100%'">
		<colgroup>
			<col width="100%" />
		</colgroup>
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${newList}" var="newList">
			<div class="card">
			<a href="#this" name="title">
			<img src="/stu/file/${newList.GOODS_THUMBNAIL}" width="400" height="400">
			${newList.GOODS_NAME}<br>
			${newList.GOODS_SELL_PRICE} 
		</a>
		</div>
		</c:forEach>
		</tbody>
		</table>
</div>




<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h1 class="mTitle">BEST ITEM</h1>


<div id="main-container">
		
<table class="board_list" style="width:'100%'">
		<colgroup>
			<col width="100%" />
		</colgroup>
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${bestList}" var="bestList">
			<div class="card">
			<a href="#this" name="title">
			<img src="/stu/file/${bestList.GOODS_THUMBNAIL}" width="400" height="400">
			${bestList.GOODS_NAME}<br>
			${bestList.GOODS_SELL_PRICE} 
		</a>
		</div>
		</c:forEach>
		</tbody>
		</table>
</div> 
<%-- <c:set var="i" value="0" />
 <c:set var="j" value="4" />
 <table style="padding:200px; margin-top:-150px;">
  <c:choose>
   <c:when test="${bestList != null && fn:length(bestList) > 0 }">
    <c:forEach items="${bestList}" var="bestList">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     <td>
     <div class="list img-list">
     <a href="" class="inner">
     <div class="li-img">
		<img src="/stu/file/${bestList.GOODS_THUMBNAIL } width='400' height='400'" id="slide"/>
	</div>
	<div align="left">
		<c:choose>
			<c:when test="${bestList.GOODS_PICK == '0' }"> </c:when>
			<c:when test="${bestList.GOODS_PICK == '1' }">BEST</c:when>
			<c:when test="${bestList.GOODS_PICK == '2' }">MD PICK</c:when>
			<c:when test="${bestList.GOODS_PICK == '3' }">MUSTHAVE</c:when>
		</c:choose>
		<br><br>
		${bestList.GOODS_NAME }<br><br>
		${bestList.GOODS_SELL_PRICE }원
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
 </table>  --%>


</body>
</html>

<script type="text/javascript">

$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 3000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: false, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        slideWidth: 1260, // 크기
        slideMargin: 0,
        autoDelay: 0,
        responsive: true,
       	
        
        
        
    });
});


</script>