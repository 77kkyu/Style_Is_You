<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>상품리스트</title>
<head>

<link href="<c:url value="/css/board.css"/>" rel="stylesheet">

<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- bx -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



<style>

#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   border-top: 1px solid #fff;  
   border-right: 1px solid #fff;     
   border-left: 1px solid #fff; 
   border-bottom: 1px solid #fff;    
}



/* 검색버튼 시작 */
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

body{
  
  font-family: 'Open Sans', sans-serif;
}

.search {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
  width: 100%;
  border: 3px solid #C86060;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #C86060;
}

.searchTerm:focus{
  color: #C86060;
}

.searchButton {
  width: 60px;
  height: 36px;
  border: 1px solid #C86060;
  background: #C86060;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 20%;
  position: absolute;
  top: 300px;
  left: 50%;
  transform: translate(-50%, -50%);
}
/* 검색버튼 끝 */

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
/* 
.bx-wrapper {
    -moz-box-shadow: 0 0 5px #ccc;
    -webkit-box-shadow: 0 0 5px #ccc;
    box-shadow: 0 0 #ccc;
    border: #fff;
    background: #fff;
}

.bx-wrapper {
    position: relative;
    margin-bottom: 5px;
    padding: 0;
    *: ;
    zoom: 1;
    -ms-touch-action: pan-y;
    touch-action: pan-y;
}
 */
 
.imgswap img:last-child{display:none} 
.imgswap:hover img:first-child{display:none} 
.imgswap:hover img:last-child{display:inline-block}

</style>

</head>

<body>

<div style="margin-top:0px;">
<form method="post">		
				<input type="hidden" id="path" value="${path}" />	
				<div class="wrap">
				   <div class="search">
				      <input type="text" class="searchTerm" name="keyword" id="keyword" placeholder="Search" value="${keyword}">
				      <input type="submit" value="검색" class="searchButton" onClick="onSearch()"/>
				        <i class="fa fa-search"></i>
				   </div>
				</div>			
</form>
</div>


<br><br><br><br><br>

<div align="right" style="margin-right:410px">
	<table>
		<tr>
			<td>
			<div style="margin-right:400px">
				 <%-- 총 ${TOTAL} 개의 상품이 있습니다 --%> 
			</div>
			</td>
			<td class="font1"><a href="/stu/shop/goodsList/${category}/NewItem.do">신상품순</a></td> <td>|</td>
			<td class="font1"><a href="/stu/shop/goodsList/${category}/favorite.do">인기상품순</a></td> <td>|</td>
			<td class="font1"><a href="/stu/shop/goodsList/${category}/low.do">낮은가격순</a></td> <td>|</td>
			<td class="font1"><a href="/stu/shop/goodsList/${category}/high.do">높은가격순</a></td> 
		</tr>
	</table>
</div>

<div id="main-container">
<table class="board_list" style="width:100%">
		<colgroup>
			<col width="100%" />
		</colgroup>
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
		</tbody>
		</table>



</div>
<br>
<div id="PAGE_NAVI" align="center"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />




<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
	
	fn_selectGoodsList(1);
	
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

function fn_selectGoodsList(pageNo) {
	var comAjax = new ComAjax();

	//alert(${orderBy});
	comAjax.setUrl("<c:url value='/shop/cateGoodsList/${category}/${orderBy}.do' />");
	comAjax.setCallback("fn_selectGoodsListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 16);
	comAjax.addParam("keyword", $('#keyword').val());
	comAjax.ajax();
}

function fn_selectGoodsListCallback(data) {
	var total = data.TOTAL;
	var body = $(".board_list");
	body.empty();
	
	if (total == 0) {
		var str = "<tr>" + "<td colspan='4' align='center'>조회된 결과가 없습니다.</td>"
				+ "</tr>";
		body.append(str);
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			recordCount : 16,
			eventName : "fn_selectGoodsList"
		};
		gfn_renderPaging(params);

		var str = "";
		$.each(data.list, function(key, value) {
							var imgpath = "<img src='/stu/file/"+value.GOODS_THUMBNAIL+"' width='400' height='400'>"
							//alert(value.GOODS_IMAGE_STD);
							var imgpath1 = value.GOODS_IMAGE_STD.split(',');
							var img0 = imgpath1[0];
							var img1 = imgpath1[1];
							
							
							var Pick = value.GOODS_PICK.split(',');
							var pick1 = "";
							var pick2 = "";
							var pick3 = "";
							var pick4 = "";
							var num = "";
							for (var i=0; i<Pick.length; i++) {
									Pick[i];
									if(Pick[0] == null){
										pick1 = "";
									}else{
										pick1 = Pick[0];
									}
									if(Pick[1] == null){
										pick2 = "";
									}else {
										pick2 = Pick[1];
									}
									if(Pick[2] == null){
										pick3 = "";
									}else {
										pick3 = Pick[2];
									}
									if(Pick[3] == null){
										pick4 = "";
									}else{
										pick4 = Pick[3];
									}
								}

							
											
							str += "<div class='card'>"
								+		"<a href='#this' name='title'>"
								+		"<div class='imgswap'>"
								+ 		"<img src='/stu/file/"+img0+"' width='400' height='400'>" 
								+ 		"<img src='/stu/file/"+img1+"' width='400' height='400'>"
								+     " </div> "
								+     " <c:if test='${"+num+" ne "+pick1+"}'> "
								+ 	  " <span style='background-color:#ff80bf; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "
								+		pick1 +"</font></span>"	
								+	  " </c:if>"
								+     " <c:if test='${"+num+" ne "+pick2+"}'> "
								+     " <span style='background-color:#d456dc; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "
								+		pick2 + "</font></span>"
								+	  " </c:if>"
								+     " <c:if test='${"+num+" ne "+pick3+" }'> "
								+     " <span style='background-color:#33b7ff; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "  
								+       pick3 + "</font></span>"
								+	  " </c:if>"
								+     " <c:if test='${"+num+" ne "+pick4+" }'> "
								+     " <span style='background-color:#33b7ff; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "  
								+       pick4 + "</font></span>"
								+	  " </c:if> <br>"
								+	  " <font class='font1'>"+value.GOODS_NAME+"</font><br>"
								+     " <font class='font2'>"+numberWithCommas(value.GOODS_SELL_PRICE)+"원</font> "   
								+  	  " <input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NO + ">"
								+	  " </a>"
								+	  " </div>";
				
						});
		

		body.append(str);
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
		
	}

}

</script>

</body>
</html>



