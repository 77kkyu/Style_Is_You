<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">

<title>메인화면</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>

<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/goods.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

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



.bx-wrapper {
    -moz-box-shadow: 0 0 5px #ccc;
    -webkit-box-shadow: 0 0 5px #ccc;
    box-shadow: 0 0 #ccc;
    border: #fff;
    background: #fff;
}

.font1 {
	font-size: 14px;
    color: #666;
    letter-spacing: -0.5px;
    line-height: 24px;
    white-space: normal;
    line-height: 27px;
}

.font2 {
	display: block;
    font-size: 16px;
    font-weight: 400;
    color: #333;
    font-family: unset;
    line-height: 27px;
}

/* css 초기화  */

html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
   p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
   dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
   i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
   caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   
   do: inherit;
   vertical-align: baseline;
}
article, aside, details, figcaption, figure, footer, header, hgroup,
   menu, nav, section {
   display: block;
}
blockquote, q {
   quotes: none;
}
blockquote : before, blockquote : after, q : before, q : after {
   content: '';
   content: none;
}
table {
   border-collapse: collapse;
   border-spacing: 0;
}
/*css 초기화*/
.card {
   float:left;
   height: 500px;
   width: 20%;
   border-radius: 15px;
   display: inline-block;
   margin-top: 30px;
   margin-left: 50px;
   margin-bottom: 30px;
   position: relative;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   overflow: hidden;
}
.card-header {
   -webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;   /*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
   width: 100%;
   height: 270px;
   border-radius: 15px 15px 0 0;
   background-image: url("resources/images/no_image.png");
   background-size: 100% 280px;
   background-repeat: no-repeat;   
}
.card:hover .card-header  {
   opacity: 0.8;
   height: 100px;
}
.card-header-is_closed{
    background-color: #EF5A31 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
.card-header-is_closed2{
    background-color: #3fb50e ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
h1 {
    text-align: center;
  padding: 50px 0;
  font-weight: normal;
  font-size: 2em;
  letter-spacing: 10px;
}
.card-body {
}
.card-body-header{
   line-height: 25px;
   margin: 10px 20px 0px 20px;
}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
   height: 180px;
   margin: 5px 20px;
}
.card:hover .card-body-description {
    opacity: 1;
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -ms-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition : .5s ease-in-out;
    overflow: scroll;
}
.card-body-hashtag {
   color: #2478FF;
   font-style: italic;
}
.card-body-footer {
     position: absolute; 
     margin-top: 15px;
     margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 10px;
    color: #9FA5A8;
    padding: 0 10px;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}
.icon-view_count {
    width: 25px;
    height: 17px;
   background: url("images/eye.jpg") no-repeat;
}
.icon-comments_count {
   margin-left: 5px;
   width: 25px;
    height: 17px;
   background: url("images/comment.jpg") no-repeat;   
}
.reg_date {
	margin-left: 15px;
   float: ;
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
			<c:set var="PICK" value="${fn:split(newList.GOODS_PICK,',')}"/>
			<c:forEach var="PICK1" items="${PICK}" varStatus="g">
				<c:if test="${g.count == 1 }">
			 <span style="background-color:#ff80bf; line-height: 27px; border-radius: 10px;"><font color="#ffffff" >${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 2 }">
			 <span style="background-color:#d456dc; line-height: 27px; border-radius: 10px;"><font color="#ffffff">${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 3 }">
			 <span style="background-color:#33b7ff; line-height: 27px; border-radius: 10px;"><font color="#ffffff">${PICK1}</font></span>
				</c:if>
			</c:forEach>
			<br>
			<font class="font1">${newList.GOODS_NAME}</font><br>
			<font class="font2"><fmt:formatNumber value="${newList.GOODS_SELL_PRICE}" pattern="#,###"/>원 </font>
			<input type="hidden" id="IDX" name="IDX" value="${newList.GOODS_NO}"> 
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
			<c:set var="PICK" value="${fn:split(bestList.GOODS_PICK,',')}"/>
			<c:forEach var="PICK1" items="${PICK}" varStatus="g">
				<c:if test="${g.count == 1 }">
			 <span style="background-color:#ff80bf"><font color="#ffffff" >${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 2 }">
			 <span style="background-color:#d456dc"><font color="#ffffff">${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 3 }">
			 <span style="background-color:#33b7ff"><font color="#ffffff">${PICK1}</font></span>
				</c:if>
			</c:forEach>
			<br>
			${bestList.GOODS_NAME}<br>
			<fmt:formatNumber value="${bestList.GOODS_SELL_PRICE}" pattern="#,###"/>원
			<input type="hidden" id="IDX" name="IDX" value="${bestList.GOODS_NO}">  
		</a>
		</div>
		</c:forEach>
		</tbody>
		</table>
</div> 

<form id="commonForm" name="commonForm"></form>

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

    $("a[name='title']").on("click", function(e){ //제목 //name 이 title인거
    	console.log("잘들어옴");
    	e.preventDefault();
    	fn_openBoardDetail($(this));
    });
    
});

function fn_openBoardDetail(obj) {
	console.log("잘들어옴22");
	var comSubmit = new ComSubmit(); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
	comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
	comSubmit.submit();
	
}

</script>