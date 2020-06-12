<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>상품리스트</title>
<head>

<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
 <link href="<c:url value="/css/goods.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- bx슬라이더 -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> -->

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

</style>

</head>

<body>


<br><br><br><br>

<div align="right" style="margin-right:210px">
	<table>
		<tr>
			<td>
			<div style="margin-right:930px">
				<%-- 총 ${total} 개의 상품이 있습니다 --%>
			</div>
			</td>
			<td><a href="http://localhost:8080/stu/shop/goodsList/${category}/NewItem.do">신상품순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/goodsList/${category}/favorite.do">인기상품순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/goodsList/${category}/low.do">낮은가격순</a></td> <td>|</td>
			<td><a href="http://localhost:8080/stu/shop/goodsList/${category}/high.do">높은가격순</a></td> 
		</tr>
	</table>
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
		</tbody>
		</table>


<form action="/shop" method="post">
			<fieldset>
				<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}"/>&nbsp;
				<input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
				<input type="hidden" id="path" value="${path}" />
			</fieldset>
		</form>

<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />


<br><br>
</div>

<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

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
		var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
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
							var Pick = value.GOODS_PICK.replace(",", " ").replace(",", " ");
							
							str += "<div class='card'>"
								+		"<a href='#this' name='title'>"
								+ 			imgpath + "<br>"
								+ 					Pick +	"<br>"
								+		value.GOODS_NAME +	"<br>"
								+		value.GOODS_SELL_PRICE 
								+  	"<input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NO + ">"
								+	   "</a>"
								+	   "</div>";

							
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



