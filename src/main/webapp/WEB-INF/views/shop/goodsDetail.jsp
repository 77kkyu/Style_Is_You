<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>상품 상세보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<style>
.layer { display: none; }

/* css초기화 끝 */
.option_section {
    float: left;
    color: #777;
    font-weight: 400;
}


</style>

<body>

 <input type="hidden" id="IDX" name="IDX" value="${list.GOODS_NO}"> 

<br>

<div>

<div style="float:left; margin-left:350px">
	<table border="0">
		<tr>
			<td><img src="/stu/file/${list.GOODS_THUMBNAIL }" width="500" height="500"/></td>
		</tr>
	</table>
</div>

<div style="float:left; margin-left:40px">
	<table border="0">
	
		<tr>
			<td>
			<c:set var="PICK" value="${fn:split(list.GOODS_PICK,',')}"/>
			<c:forEach var="PICK1" items="${PICK}" varStatus="g">
				<c:if test="${g.count == 1 }">
			 <span style="background-color:#ff80bf; line-height: 27px; border-radius: 10px;"><font color="#ffffff" size="2" >${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 2 }">
			 <span style="background-color:#d456dc; line-height: 27px; border-radius: 10px;"><font color="#ffffff" size="2">${PICK1}</font></span>
				</c:if>
				<c:if test="${g.count == 3 }">
			 <span style="background-color:#33b7ff; line-height: 27px; border-radius: 10px;"><font color="#ffffff" size="2">${PICK1}</font></span>
				</c:if>
			</c:forEach>
			</td>		
		</tr>
		
<!-- 		<tr>
			<td>&nbsp;&nbsp;</td>
		</tr> -->
		
		<tr>
			<td id="goodsName"><font size="5" style="box-sizing:border-box;position:relative;">${list.GOODS_NAME}</font></td>
		</tr>
		
		<tr>
			<td><font size="3">${ColorSize}color</font></td>
		</tr>
		
		<tr>
			<td></td>
		</tr>
		
		<tr>
			<td id="price" style="font-weight:600px; font-Size:24px; line-height:42px;">
			<fmt:formatNumber value="${list.GOODS_SELL_PRICE}" pattern="#,###"/>원
			</td>
		</tr>
		</table>
				
		<table>
		<tr>
			<td><hr style="border-top:1px solid #bbb;"  width=670px><td>
		</tr>
		</table>
		
		<br>
		
		<table>
		<tr class="option_section">
			<td width="340px"><font size="3">배송비</font></td>
			<td><font size="3">선불3,000원(50,000원 이상 무료배송)</font></td>
		</tr>
		</table>
		
		<table>
		<tr class="option_section">
			<td width="537px"><font size="3">배송종류</font></td>
			<td><font size="3">국내배송</font></td>
		</tr>
		</table>
		
		<br><br>
		
		<div>
		<table>
		<tr>
			<td>
				<select name="ColorList" id="ColorList" style="width:600px;height:30px;" >
					<option value="">==(필수)옵션: 색상 선택 ==</option>
					<c:forEach var="ColorList" items="${Color}" varStatus="index">
					<option value="${ColorList}">${ColorList}</option>
					</c:forEach>
					</select>
			</td>
			<td>&nbsp;<button class="btn btn-outline-danger" onclick="tableCreate()" style="width:70px; height:30px;">추가</button></td>
			
		</tr>
			
		<tr>
			<td>
				<select name="SizeList" id="SizeList" style="width:600px;height:30px;">
					<option value="">==(필수)옵션: 사이즈 선택 ==</option>
					<c:forEach var="SizeList" items="${Size}" varStatus="index">
					<option value="${SizeList}">${SizeList}</option>
					</c:forEach>
				</select>
			</td>
			<td>&nbsp;<button class="btn btn-outline-danger" onclick="tableDelete()" style="width:70px; height:30px;">삭제</button></td>
		</tr>
		</table>
		</div>
		
		<form id="frm" name="frm" method="post">
		
		<%--<input type="hidden" id="GOODS_ATT_NO" name="GOODS_ATT_NO" value="${list.GOODS_ATT_NO}"> --%>
		<!-- 맴버아이디 보내야함 -->
		<div>
		<table style="border: 1px;" id="dynamicTable">
		<thead>
		</thead>
		
		<tbody id="dynamicTbody">
		
		</tbody>
		
		</table>
		</div>
			
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
	    	
		</form>
		<br>
		<!-- <div style="margin-left:405px;">
		총상품금액&nbsp;<input type="text" name="dd" size="11" >
		</div> -->
		<br>
		<table>
		<tr>
			<td><hr style="border-top:1px solid #bbb;"  width=670px><td>
		</tr>
		</table>
		
	    <button style="width:124px; height:58px;" class="btn btn-outline-danger" id="insertLike" onclick="fn_InsertLike()">
	    <font size="5px">♥</font>
	    </button>
	    <button style="width:270px; height:58px;" class="btn btn-outline-danger" id="insertBasket" onclick="fn_InsertBasket()">장바구니</button>
		<button style="width:270px; height:58px;" class="btn btn-outline-danger" id="goodsOrder" onclick="fn_GoodsOrder()" >구매하기</button>
		<br>
		<button id="update" onclick="fn_update()">수정하기</button>


</div>


<div style="clear:both;">

</div>

<br><br><br><br><br>
<div align="center">
<ul class="nav nav-tabs" id="myTab" role="tablist" style="width:60%">
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">상세정보</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">상품문의</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">쇼핑가이드</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#re" role="tab" aria-controls="re" aria-selected="false">상품평</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">${list.GOODS_CONTENT}</div> <!-- 상세정보 -->
  
  
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"> <!-- 상품문의 -->
  	
  </div> 
  
  
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab" align="left" style="margin-left:400px"> <!-- 쇼핑가이드 -->
  <%@ include file="/WEB-INF/views/shop/guide.jsp" %>
  </div> 
  <div class="tab-pane fade" id="re" role="tabpanel" aria-labelledby="contact-tab">...</div> <!-- 상품평 -->
</div>
</div>

<br><br>

<div align="center">
<ul class="nav nav-tabs" id="myTab" role="tablist" style="width:60%">
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="home-tab" data-toggle="tab" href="#home1" role="tab" aria-controls="home1" aria-selected="false">상세정보</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile1" role="tab" aria-controls="profile1" aria-selected="true">상품문의</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact1" role="tab" aria-controls="contact1" aria-selected="false">쇼핑가이드</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#re1" role="tab" aria-controls="re1" aria-selected="false">상품평</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade" id="home1" role="tabpanel" aria-labelledby="home-tab">${list.GOODS_CONTENT}</div> <!-- 상세정보 -->
  
  <div class="tab-pane fade show active" id="profile1" role="tabpanel" aria-labelledby="profile-tab"> <!-- 상품문의 -->
  
  <table class="board_list">
	
		<thead>
			<tr>
				<td>번호</td>
				<td>문의</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>답변</td>
			</tr>
		</thead>
		
	</table>
  
  </div> 
 
  <div class="tab-pane fade" id="contact1" role="tabpanel" aria-labelledby="contact-tab" align="left" style="margin-left:400px"> <!-- 쇼핑가이드 -->
  <%@ include file="/WEB-INF/views/shop/guide.jsp" %>
  </div> 
  <div class="tab-pane fade" id="re1" role="tabpanel" aria-labelledby="contact-tab">...</div> <!-- 상품평 -->
</div>
</div>

<br><br>

<div align="center">
<ul class="nav nav-tabs" id="myTab" role="tablist" style="width:60%">
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="home-tab" data-toggle="tab" href="#home2" role="tab" aria-controls="home2" aria-selected="false">상세정보</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile2" aria-selected="false">상품문의</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link active" id="contact-tab" data-toggle="tab" href="#contact2" role="tab" aria-controls="contact2" aria-selected="true">쇼핑가이드</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#re2" role="tab" aria-controls="re2" aria-selected="false">상품평</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade" id="home2" role="tabpanel" aria-labelledby="home-tab">${list.GOODS_CONTENT}</div> <!-- 상세정보 -->
  <div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab">...</div> <!-- 상품문의 -->
  <div class="tab-pane fade show active" id="contact2" role="tabpanel" aria-labelledby="contact-tab" align="left" style="margin-left:400px"> <!-- 쇼핑가이드 -->
  <%@ include file="/WEB-INF/views/shop/guide.jsp" %>
  </div> 
  <div class="tab-pane fade" id="re2" role="tabpanel" aria-labelledby="contact-tab">...</div> <!-- 상품평 -->
</div>
</div>

<br><br>

<div align="center">
<ul class="nav nav-tabs" id="myTab" role="tablist" style="width:60%">
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="home-tab" data-toggle="tab" href="#home3" role="tab" aria-controls="home3" aria-selected="false">상세정보</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile3" aria-selected="false">상품문의</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact3" role="tab" aria-controls="contact3" aria-selected="false">쇼핑가이드</a>
  </li>
  <li class="nav-item" role="presentation" style="width:25%">
    <a class="nav-link active" id="contact-tab" data-toggle="tab" href="#re3" role="tab" aria-controls="re3" aria-selected="true">상품평</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade" id="home3" role="tabpanel" aria-labelledby="home-tab">${list.GOODS_CONTENT}</div> <!-- 상세정보 -->
  <div class="tab-pane fade" id="profile3" role="tabpanel" aria-labelledby="profile-tab">...</div> <!-- 상품문의 -->
  <div class="tab-pane fade" id="contact3" role="tabpanel" aria-labelledby="contact-tab" align="left" style="margin-left:400px"> <!-- 쇼핑가이드 -->
  <%@ include file="/WEB-INF/views/shop/guide.jsp" %>
  </div> 
  <div class="tab-pane fade show active" id="re3" role="tabpanel" aria-labelledby="contact-tab">...</div> <!-- 상품평 -->
</div>
</div>


</body>
</html>

<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}

$(document).ready(function() {

	$("#insertLike").on("click", function(e){// 좋아요 버튼
		//html 에서 a 태그나 submit 태그는 고유의 동작이 있다. 
		//페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가 
		//그러한 동작이 있는데 e.preventDefault 는 그 동작을 중단시킨다.
		e.preventDefault(); 
		fn_InsertLike();	
	});

	$("#insertBasket").on("click", function(e){ // 장바구니 버튼
		e.preventDefault(); 
		fn_InsertBasket();	
	});

	$("#goodsOrder").on("click", function(e){ // 구매 버튼
		e.preventDefault(); 
		fn_GoodsOrder();	
	});


});

function fn_update() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsModifyForm.do'/>");
	comSubmit.addParam("IDX", ${list.GOODS_NO});
	comSubmit.submit();
}

function fn_InsertLike() { // 좋아요

	if(${SESSION_NO ne null}){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/goodsLike.do'/>");
		comSubmit.addParam("GOODS_NO", ${list.GOODS_NO});
		comSubmit.submit();
	}else {
		alert("로그인 후 이용해주세요.");
		location.href = "/stu/loginForm.do";
	}
	
	
}

function fn_GoodsOrder() { // 구매하기
	if(doubleSubmitCheck()) return; // 중복클릭 방지
	//BASKET_GOODS_AMOUNT
	
	//var amount = $('input[name=BASKET_GOODS_AMOUNT]').val();
	/* var amount = $('.field1').val();
	console.log(amount);
	if(amount == null){
		alert("상품이 없습니다.");
		return false;
	} */
	if(${SESSION_NO ne null}){
		var arraycode = document.getElementsByName("BASKET_GOODS_AMOUNT");
		var len = arraycode.length;
		if(len==0){
			alert("상품을 추가해 주세요.");
		}else{
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/goodsOrder.do'/>");
			comSubmit.submit();
		}
	}else {
		alert("로그인 후 이용해주세요.");
		location.href = "/stu/loginForm.do";
	}
   
	
}

function fn_InsertBasket() { // 장바구니
	
	if(doubleSubmitCheck()) return; // 중복클릭 방지
	//BASKET_GOODS_AMOUNT
	
	//var amount = $('input[name=BASKET_GOODS_AMOUNT]').val();
	/* var amount = $('.field1').val();
	console.log(amount);
	if(amount == null){
		alert("상품이 없습니다.");
		return false;
	} */

	if(${SESSION_NO ne null}){
		var arraycode = document.getElementsByName("BASKET_GOODS_AMOUNT");
		var len = arraycode.length;
		if(len==0){
			alert("상품을 추가해 주세요.");
		}else{
			var url = "/stu/shop/basketPopUp.do";
			var name = "popup";
			var option = "width=382, height=227, top=500, left=800, location=no";
			
		    var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/insertBasket.do'/>");
			window.open(url,name,option);
			comSubmit.submit();
		}
	}else {
		alert("로그인 후 이용해주세요.");
		location.href = "/stu/loginForm.do";
	}
	
	
	
	/* var resultList = new Array();
	for(var i=0; i<$("input[name=ORDER_COLOR]").length; i++){
		var keyArray = {
							'ORDER_COLOR'		   : $("input[name=ORDER_COLOR]").eq(i).val(),
							'ORDER_SIZE'		   : $("input[name=ORDER_SIZE]").eq(i).val(),
							'BASKET_GOODS_AMOUNT'  : $("input[name=BASKET_GOODS_AMOUNT]").eq(i).val(),
							'MEMBER_NO'  		   : $("input[name=MEMBER_NO]").eq(i).val(),
							'IDX' 				   : $("input[name=IDX]").eq(i).val()
						};
		resultList.push(keyArray);
		}
	console.log(resultList);
	comSubmit.addParam("resultList", resultList); */
	

	//map = [{},{}]
	/* map.put=({
		'IDX'				 : '186',
		'MEMBER_NO'			 : '1',
		'ORDER_COLOR'		 : $("input[name=ORDER_COLOR]").eq(0).val(),
		'ORDER_SIZE'         : $("input[name=ORDER_COLOR]").eq(0).val(),
		'BASKET_GOODS_AMOUNT': $("input[name=ORDER_COLOR]").eq(0).val()
	}); */

	/* var result = {'ORDER_COLOR':  $("input[name=ORDER_COLOR]").eq(0).val()},
	keys = $.map( result, function(value, index) {
		return index;
	}); */

	/* var reList = new Array();
	var reList1 = new Array();
	// reList{000}
	var map = new Map();
	for(var i=0; i<$("input[name=ORDER_COLOR]").length; i++){
		reList.push($("input[name=ORDER_COLOR]").eq(i).val());
		reList.push($("input[name=ORDER_SIZE]").eq(i).val());
		reList.push($("input[name=BASKET_GOODS_AMOUNT]").eq(i).val());
		
	} */
	//console.log(map);
	//console.log(reList.length);
	
	
    // lsit[0] {key:value, key:value}
    // lsit[1] {key:value, key:value}
    
	
	/* for(var i=0; i<$("input[name=ORDER_COLOR]").length; i++){
	var keyArray = [{key:'ORDER_COLOR', value:$("input[name=ORDER_COLOR]").eq(i).val()},
					{key:'ORDER_SIZE', value:$("input[name=ORDER_SIZE]").eq(i).val()},
					{key:'BASKET_GOODS_AMOUNT', value:$("input[name=BASKET_GOODS_AMOUNT]").eq(i).val()
					}]; 

	var resultArray = keyArray.map(function(obj){
		var rObj = {};
		rObj[obj.key] = obj.value;
			return rObj
		});
	//console.log("rObj");
    //console.log(resultArray);
    
	} */
	//comSubmit.addParam('resultArray', resultArray);
	//comSubmit.submit();
	



	//comSubmit.addParam(map);
	
// 	alert($("input[name=ORDER_COLOR]").eq(0).val());
// 	alert($("input[name=ORDER_SIZE]").eq(0).val());
// 	alert($("input[name=BASKET_GOODS_AMOUNT]").eq(0).val());

	
// 	for(var i=0 ; i<$("input[name=ORDER_COLOR]").length ; i++){
		
// 	}

// 	return;
	
// 	$("input[name=ORDER_COLOR]").each(function(index, item) {
// 		basket_color.push($(item).val());
// 	});

// 	$("input[name=ORDER_SIZE]").each(function(index, item) {
// 		basket_size.push($(item).val());
// 	});

// 	$("input[name=BASKET_GOODS_AMOUNT]").each(function(index, item) {
// 		basket_amouont.push($(item).val());
// 	});

/* 	$("input[name=MEMBER_NO]").each(function(index, item) {
		basketList.push($(item).val());
	}); */

	

// 	comSubmit.addParam("basket_color",basket_color);
// 	comSubmit.addParam("basket_size",basket_size);
// 	comSubmit.addParam("basket_amouont",basket_amouont);
	
	 //comSubmit.submit();
	
	
}


function tableCreate(){
	var tc = new Array();
	var html = "";
	var cnt = $('#dynamicTable table').length;
	//var name = $(list.GOODS_NAME);			
	var color = $("#ColorList option:selected").val();
	var size = $("#SizeList option:selected").val();
	var price = $("#price").val();
	//console.log(price);
	var IDX = $('#IDX').val();
	if(color == "" || size =="") {
		alert("옵션을 선택하주세요");
	}else{

	if(cnt < 6) {		


		
		
	html = "<table style='border:1px solid #bdbebd; width:600px; margin-top:2px;'>"
		 + "<tr>"
		 + "<td>상품명 : </td>"
		 + "<td>"
		 + $("#goodsName").text()
	     + "</td>"
	     + "<td>"   
 		 + " <div id='field"+cnt+"'> "
		 + " <button type='button' id='sub' class='sub'></button> "
		 + " <input type='number' class='i1' id='"+cnt+"' name='BASKET_GOODS_AMOUNT' value='1' min='1' max='5' /> "
		 + " <button type='button' id='add' class='add'></button> </div> "
		 + "<input type='text' id='sum' name='sum' size='11' value='0'>원" 
	     + "</td>"
	     + "</tr>"
	     + "<tr>"
	     + "<td>색상 :</td>"
	     + "<td>"+color+"</td>"
	     + "<td></td>"
	     + "</tr>"
	     + "<tr>"
	     + "<td>사이즈 : </td>"
	     + "<td>"+size+"</td>"
	     + "<td></td>"
	     + "</tr>"
		 + "<input type='hidden' name='ORDER_COLOR' id='ORDER_COLOR' value='"+color+"'>"
		 + "<input type='hidden' name='ORDER_SIZE' id='ORDER_SIZE' value='"+size+"'> "
		 + "<input type='hidden' name='IDX' id='IDX' value='"+${list.GOODS_NO}+"'> "
		 + "</table>";
		
	$("#dynamicTable").append(html);
				
	$("#ColorList").val('');
	$("#SizeList").val('');

	
	}else {
		alert("최대 5개까지만 가능합니다.");
		return false;
	}
	
	}
	
}

function tableDelete(){
	$('#dynamicTable tbody:last').remove();
}



$('.add').click(function () {
	if ($(this).prev().val() < 3) {
	$(this).prev().val(+$(this).prev().val() + 1);
	}
});
$('.sub').click(function () {
	if ($(this).next().val() > 1) {
	if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
	}
});






//전체주문금액구하기
/* function fn_allPrice(){

	
	
	//console.log(array1);
	//console.log(array2);
	//var len = array2.length;
	var hap = 0;
	var aa = 1;
	for (var i=aa; i<2; i++){
		var array1 = $("#price").val();
		
		var array2 = $("#cnt"+aa+"").val();
		
		var sell = array1;
		var amt = array2;
		var pri = Number(sell)*Number(amt); //각 상품별 주문금액
		hap = Number(hap)+Number(pri); //주문금액 총합 구하기
		
	}
	
	
	var array3 = $("#sum").val();
	//hap = Number(hap).toLocaleString();
	//pay = Number(pay).toLocaleString();
	array3 = hap; //상품금액
	
	
} */

</script>