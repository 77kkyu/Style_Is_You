<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품리스트</title>
<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<head>
<script type="text/javascript">
 var img=new Array();
img[0]=new Image(); img[0].src="../img/옷1.JPG";
img[1]=new Image(); img[1].src="../img/옷2.JPG";
img[2]=new Image(); img[2].src="../img/옷3.JPG"; 
var interval=1500;
var n=0;
// each 함수 반복문 DB에서 이미지 뽑아오기..?
var imgs = new Array("/stu/img/옷1.JPG","/stu/img/옷2.JPG","/stu/img/옷3.JPG","/stu/img/옷4.JPG");

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

<br><br><br><br>
<div align="right" style="margin-right:210px">
<form>
	<table>
		<tr>
			<td>
			<div style="margin-right:930px">
				총 ${total} 개의 상품이 있습니다
			</div>
			</td>
			<td><a href="http://localhost:8080/stu/shop/cateGoodsList/${category}/NewItem.do">신상품순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/cateGoodsList/${category}/favorite.do">인기상품순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/cateGoodsList/${category}/low.do">낮은가격순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/cateGoodsList/${category}/high.do">높은가격순</a></td> <td>|</td>
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
 <table style="padding:200px; margin-top:-190px;">
  <c:choose>
   <c:when test="${list != null && fn:length(list) > 0 }">
    <c:forEach items="${list}" var="list">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     <td>
     <div class="list img-list">
     <a href="#this" name="title" class="inner">
     <div class="li-img">
		<img src="/stu/img/옷1.JPG" id="slide"/>
	<input type="hidden" id="IDX" value="${list.GOODS_NO }">
	</div>
	<div align="left">
		<c:choose>
			<c:when test="${list.GOODS_PICK == '0' }"></c:when>
			<c:when test="${list.GOODS_PICK == '1' }">BEST</c:when>
			<c:when test="${list.GOODS_PICK == '2' }">MD PICK</c:when>
			<c:when test="${list.GOODS_PICK == '3' }">MUSTHAVE</c:when>
		</c:choose>
		<br><br>
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

<br><br>

<form id="commonForm" name="commonForm"></form>

</body>
</html>


<script type="text/javascript">

$(document).ready(function(){
	$("#write").on("click", function(e){ //글쓰기버튼 #write id가 write인걸 찾는다
		e.preventDefault();
		fn_openBoardWrite();
	});

	$("a[name='title']").on("click", function(e){ //제목 //name 이 title인거
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});

function fn_openBoardWrite() {

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");//이동할 url
	comSubmit.submit(); //전송
	
}

function fn_openBoardDetail(obj) {

	var comSubmit = new ComSubmit(); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
	comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
	comSubmit.submit();
	
}


function fn_selectBoardList(pageNo){ 
	
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />"); 
	comAjax.setCallback("fn_selectBoardListCallback"); 
	comAjax.addParam("PAGE_INDEX",pageNo); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); 
	
} 

function fn_selectBoardListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("table>tbody"); 
	body.empty(); 
	if(total == 0){ 
		var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>"; 
		body.append(str); 
	} else{ 
		var params = { 
				divId : "PAGE_NAVI", 
				pageIndex : "PAGE_INDEX", 
				totalCount : total, 
				eventName : "fn_selectBoardList" 
					}; 
		
			gfn_renderPaging(params); 
			var str = ""; 
			$.each(data.list, function(key, value){
				 str += "<tr>" + "<td>" + value.IDX + "</td>" + "<td class='title'>" + "<a href='#this' name='title'>" + value.TITLE + "</a>" + "<input type='hidden' name='title' value=" + value.IDX + ">" + "</td>" + "<td>" + value.HIT_CNT + "</td>" + "<td>" + value.CREA_DTM + "</td>" + "</tr>"; 
				 }); 
			     body.append(str); 
				 $("a[name='title']").on("click", function(e){ //제목 
					 e.preventDefault(); 
					 fn_openBoardDetail($(this)); 
					 
				}); 
			} 
}


</script>
