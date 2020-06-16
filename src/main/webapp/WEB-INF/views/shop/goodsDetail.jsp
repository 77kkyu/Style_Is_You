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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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

/* 상품문의 */
.board_list th {
    padding: 14px 0;
    background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center #f5f5f5;
    font-size: 14px;
    color: #666;
    font-weight: 400;
    text-align: center;
}

.board_list {
    width: 60%;
    margin-top: 0px;
    background: #fff;
    font-size: 15px;
    line-height: 18px;
} 
.board_list2 {
    width: 60%;
    margin-top: 0px;
    background: #fff;
    font-size: 15px;
    line-height: 18px;
} 

.board_list2 .tit {
    background: #fff;
    font-size: 15px;
}

.board_list2 .tit td {
    position: relative;
    padding: 20px 0;
    box-sizing: border-box;
    border-top: 1px solid #f2f2f2;
}
.td {
    position: relative;
    box-sizing: border-box;
    border-top: 1px solid #f2f2f2;
   	margin-left: 100px;
 
}
.align_left {
    text-align: left !important;
}

.board_list2 td.align_left {
    padding: 16px 110px;
}

.board_list td {
    padding: 16px 0;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
    font-size: 14px;
    color: #444;
    vertical-align: top;
}

p.a {
        cursor: pointer;
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
	 <div id='aaa'> 
		<tr>
					<td align='center' > "+value.RNUM+"</td>
					<td class='align_left'> "+value.GOODS_QNA_TITLE+"</td>
						<td align='center'> "+value.MEMBER_NO+"</td>
							<td align='center' > "+date+"</td>
							<td align='center'> <span class='btn btn-danger'>답변완료</span></td>
				</tr> 
						</div> 
						<p class='b'> 
							하하하 
								</p>

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
  
  <table align="center" class="board_list">
		 <colgroup>
			<col width="9%"/>
			<col>
			<col width="15%"/>
			<col width="14%"/>
			<col width="13%"/>
		</colgroup>
		<thead>
      		<tr>
      			<th>번호</th>
      			<th>문의</th>
      			<th>작성자</th>
      			<th>작성일</th>
      			<th>답변</th>
      		</tr>
     	</thead>
  </table>
  <table class="board_list2">
 		
     	<tbody id="board_list1" name="board_list1">
     	<colgroup>
			<col width="9%"/>
			<col>
			<col width="10%"/>
			<col width="13%"/>
			<col width="13%"/>
		</colgroup>
     		
     	</tbody>
  </table> 
  <br>
  <div style="margin-left:1050px">
  <button type="button" class="btn btn-secondary btn-sm" onclick="fn_Qna()">상품문의</button>
  </div>  	
   
   
  
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
  <div class="tab-pane fade show active" id="re3" role="tabpanel" aria-labelledby="contact-tab"> <!-- 상품평 -->
  	
  	<table>
  		<tr>
  			<td></td>
  		</tr>
  	</table>
  	
  </div> 
</div>
</div>

<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
<form id="commonForm" name="commonForm"></form>
</body>
</html>



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

	fn_selectGoodsList(1);

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

function fn_Qna(){ // 상품문의 작성
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/openQnaForm.do'/>");
	comSubmit.addParam("IDX", ${list.GOODS_NO});
	comSubmit.submit();
}

function fn_update() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsModifyForm.do'/>");
	comSubmit.addParam("IDX", ${list.GOODS_NO});
	comSubmit.submit();
}

function fn_InsertLike() { // 좋아요

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsLike.do'/>");
	comSubmit.addParam("IDX", ${list.GOODS_NO});
	comSubmit.submit();
	
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
	
    var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/shop/goodsOrder.do'/>");
	comSubmit.submit();
	
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
	
	var url = "/stu/shop/basketPopUp.do";
	var name = "popup";
	var option = "width=382, height=227, top=500, left=800, location=no";
	
    var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/shop/insertBasket.do'/>");
	window.open(url,name,option);
	comSubmit.submit();
	
	
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
		 + "<input type='hidden' name='MEMBER_NO' id='MEMBER_NO' value='1'> "
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




function fn_selectGoodsList(pageNo) {
	var comAjax = new ComAjax();
	
	comAjax.setUrl("<c:url value='/shop/goodsDetailList.do' />");
	comAjax.setCallback("fn_selectGoodsListCallback");
	comAjax.addParam("IDX", $("#IDX").val());
	comAjax.ajax();
}


function fn_selectGoodsListCallback(data) {
	var total = data.TOTAL;
	var body = $("#board_list1");
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
								var date = moment(value.GOODS_QNA_DATE).format("YYYY-MM-DD");
							  var Level = value.GOODS_QNA_LEVEL;
								/* var Level1 = "0";
								$.each(Level,function(idx,row){
									if(Level[idx].NAME == "0"){
										return Level[idx];	
									}else if(Level[idx].NAME == "0") {
										return Level[idx];
									}
									return ""
								});
								alert(Level);  */

								//var Level = 0;
								//alert(value.GOODS_QNA_LEVEL == 1);
								
								if(Level == 1){
							str += " <div> "
								+  " <tr id='show'> "
								+  " <td align='center' > "+value.RNUM+"</td>"
								+  " <td class='align_left'> "+value.GOODS_QNA_TITLE+"</td>"
								+  " <td align='center'> "+value.MEMBER_NO+"</td>"
								+  " <td align='center' > "+date+"</td>"
								+  " <td align='center'> <span class='btn btn-danger'>답변완료</span></td>"
								+  " </tr> "
								+  " </div> "
								+  " <div> "
								+  " <tr width='100%' align='center' bgcolor='#f1f3f5'> "
								+  " <td></td> "
								+  " <td id='hide' height='50px;'>하하하ddddddddddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td> "
								+  " <td></td><td></td><td></td> "
								+  " </tr>"
								+  " </div> ";
							
								}else{

								str += " <tr align='center' id='show' > "
									+  " <td > "+value.RNUM+"</td>"
									+  " <td class='align_left'> "+value.GOODS_QNA_TITLE+"</td>"
									+  " <td align='center'> "+value.MEMBER_NO+"</td>"
									+  " <td align='center' > "+date+"</td>"
									+  " <td align='center' width='90px' height='38px'></td>"
									+  " </tr> "
									+  " <div> "
									+  " <tr width='100%' align='center' bgcolor='#f1f3f5'> "
									+  " <td></td>"
									+  " <td id='hide' height='50px;'>하하하ddddddddddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td> "
									+  " <td></td><td></td><td></td> "
									+  " </tr>"
									+  " </div> ";
								}
							//" <td > <span class='btn btn-danger'>답변완료</span></td>"
							////+  " <td>"+value.GOODS_QNA_LEVEL+"</td>"
						});
		body.append(str);
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	}
}

$(document).ready( function() {
    $( 'tr#show' ).click( function() {
      $( 'td#hide' ).toggle( 'slow' );
    });
  });






</script>