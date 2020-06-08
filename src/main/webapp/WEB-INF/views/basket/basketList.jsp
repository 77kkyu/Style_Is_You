<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/stu/js/common.js" charset="utf-8"></script>

<script type="text/javascript">

//상품선택
function fn_allchk(){
	
	var chk = document.getElementById("allchk").checked; //값: true,false
	var arraychk = document.getElementsByName("chk"); //basket_no
	var len = arraychk.length;
		for(var i=0; i<len; i++){
			arraychk[i].checked = chk; //chk가 true면 arraychk도 true
		}
}

//장바구니 상품수량 변경
function fn_amount(index){

	var array8 = document.getElementsByName("goods_att_amount"); //재고수량
	var array1 = document.getElementsByName("basket_goods_amount"); //수량
	var array4 = document.getElementsByName("chk");

	var att = Number(array8[index].value); 
	var amount = Number(array1[index].value);
	var basket_no = array4[index].value;
	var result = (amount<=att);
	
	if(amount=!null && amount>0){
		if(result==true){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/basket/basketModify.do' />");
			comSubmit.addParam("BASKET_GOODS_AMOUNT", array1[index].value);
			comSubmit.addParam("BASKET_NO", basket_no);
			comSubmit.submit();
		}else{
			alert("재고가 부족합니다.");	
			return false;
		}
	}
	else{
		alert("유효한 숫자가 아닙니다.");	
		return false;
	}
	
}

//상품 삭제
function fn_delete(index){
	var array4 = document.getElementsByName("chk");
	var basket_no = array4[index].value;

	if(confirm("삭제하시겠습니까?")){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/basket/basketDelete.do' />");
		comSubmit.addParam("BASKET_NO", basket_no);
		comSubmit.submit();
	}
	return false;
}
//전체삭제
function fn_allDelete(){
	var array9 = document.getElementsByName("member_no");
	var member_no = array9[0].value;

	if(confirm("삭제하시겠습니까?")){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/basket/basketAllDelete.do' />");
		comSubmit.addParam("MEMBER_NO", member_no);
		comSubmit.submit();
	}
	return false;
}

//전체주문금액구하기
function fn_allPrice(){
	
	var array1 = document.getElementsByName("goods_sell_price");
	var array2 = document.getElementsByName("basket_goods_amount");
	var array3 = document.getElementsByName("order_price");
	
	var len = array2.length;
	var hap = 0;
	
	for (var i=0; i<len; i++){
		var sell = array1[i].value;
		var amt = array2[i].value;
		var pri = Number(sell)*Number(amt); //각 상품별 주문금액
		hap = Number(hap)+Number(pri); //주문금액 총합 구하기
		array3[i].value = pri;
		
	}
	
	var fee = document.getElementById("order_fee").value;
	pay = Number(hap)+Number(fee);
	
	//hap = Number(hap).toLocaleString();
	//pay = Number(pay).toLocaleString();
	document.getElementById("all_price").value = hap; //상품금액
	document.getElementById("pay_price").value = pay; //상품금액+배송비
	document.getElementById("all_order_price").value = pay;
	
	var array7 = document.getElementsByName("member_grade");
	var grade = array7[0].value;
	var val = 0;
	if("nomal" == grade){
		val=0.03;
	}else if("gold" == grade){
		val=0.05;
	}else{
		val=0.1;
	}
	var point = Number(hap)*Number(val); //등급별 적립율
	document.getElementById("point").value = point;
	
}

//선택상품 찜하기
function fn_like(){
	var arraycode = document.getElementsByName("chk");
	var len = arraycode.length;
	var val = 0;
	for(var i=0; i<len; i++){
		if(arraycode[i].checked==true){
			val++;
			var no = document.getElementsByName("goods_no");
			var attno = document.getElementsByName("goods_att_no");
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/basket/like.do' />");
			comSubmit.addParam("GOODS_NO", no[i].value);
			comSubmit.addParam("GOODS_ATT_NO", attno[i].value);
			comSubmit.submit();
		}
	// 찜하기 버튼 클릭 > 
	//선택한 상품만 Controller로 전송(찜하기insert실행): list? map(member_no,chk(BASKET_NO))?
	}
	if(val==0){
		alert("상품을 선택해 주세요.");
	}else{
		alert("찜하기에 넣었습니다.");
	}
	
}

function fn_all_order(){
	document.basket.submit();
}

function fn_select_order(){
	var obj = $("[name=chk]");
    var SELECT_BASKET_NO = new Array(); // 배열 선언

    $('input:checkbox[name=chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
    	SELECT_BASKET_NO.push(this.value);
    });
    
    if(SELECT_BASKET_NO[0] != null){
    	var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/order/basketSelectOrder.do' />");
		comSubmit.addParam("SELECT_BASKET_NO", SELECT_BASKET_NO);
		comSubmit.submit();
    }
    else{
    	alert("구매할 상품을 선택해 주세요.");
    }
}



	
	
</script>

</head>
<body onload="fn_allPrice()">
    <div class="container">

      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">주문</a></li>
            <li><a href="#">입금확인</a></li>
            <li><a href="#">배송중</a></li>
            <li><a href="#">수취확인</a></li>
            <li><a href="#">거래완료</a></li>
          </ul>
        </nav>
      </div>
      
      <div style="width:1000px; height:50px; margin:10px; padding:12px; border:1px solid #dcdcdc">
      	<table>
      		<tr>
      			<td style="text-align:left; font-size:17px; font-weight:bold;">장바구니</td>
      		</tr>
      	</table>
      </div>

      <!-- tables -->
      <form id="commonForm" name="commonForm"></form>
      <form name="basket" method="post" action="/stu/order/basketAllOrderWrite.do">
		<input type="hidden" name="list" value="${list }">
	</form>
          <div class="table-responsive">
          	<p><b>내가 담은 장바구니 상품리스트</b></p>
            <table class="table table-striped">
            <colgroup>
				<col width="5%" />
				<col width="10" />
				<col width="*" />
				<col width="10%" />
				<col width="13%" />
				<col width="13%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
              <thead>
                <tr>
                  <th style="text-align:center">
                  	<input type="checkbox" name="allchk" id="allchk" onclick="fn_allchk()">
                  </th>
                  <th colspan="2" style="text-align:center">상품명/옵션</th>
                  <th style="text-align:center">수량</th>
                  <th style="text-align:center">상품가</th>
                  <th style="text-align:center">주문금액</th>
                  <th style="text-align:center">주문</th>
                </tr>
              </thead>
              <tbody>
              	<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row" varStatus="status">
						<input type="hidden" name="goods_att_amount" value="${row.GOODS_ATT_AMOUNT }">
						<input type="hidden" name="member_grade" value="${row.MEMBER_GRADE }">
						<input type="hidden" name="member_no" value="${row.MEMBER_NO }">
						<input type="hidden" name="goods_no" value="${row.GOODS_NO }">
						<input type="hidden" name="goods_att_no" value="${row.GOODS_ATT_NO }">
						<tr>
							<td style="text-align:center">
                  				<input type="checkbox" name="chk" id="chk" value="${row.BASKET_NO }">
                  			</td>
                  			<td>
                  				<img src="${row.UPLOAD_SAVE_NAME }" width="50" height="50">
                  			</td>
							<td>
				  				<a href="#">${row.GOODS_NAME }</a> <br>
				  				색상: ${row.GOODS_ATT_COLOR } <br> 
				  				사이즈:${row.GOODS_ATT_SIZE } <br>
				  			</td>
				  			<td style="text-align:center">
                  				<input type="number" name="basket_goods_amount" value="${row.BASKET_GOODS_AMOUNT }" min="1" max="${row.GOODS_ATT_AMOUNT }" style="width:50px; text-align:right" >
                  			</td>
							<td style="text-align:center">
								<c:set var="price" value="${row.GOODS_SALE_PRICE }" />
								<c:choose>
    								<c:when test="${price eq null}">
        								<input type="text" name="goods_sell_price" value="${row.GOODS_SELL_PRICE }"style="width:60px; text-align:right; border:none;">원
   					 				</c:when>
   					 				<c:when test="${price ne null}">
        								<input type="text" name="goods_sell_price" value="${row.GOODS_SALE_PRICE }"style="width:60px; text-align:right; border:none;">원
   					 				</c:when>
								</c:choose>
							</td>
							<td style="text-align:center">
								<input type="text" name="order_price" value="" style="width:60px; text-align:right; border:none;">원
							</td>
							<td style="text-align:center">
                  				<input type="button" name="amount_modify" value="수정" onclick="fn_amount(${status.index}); return false;"><br>
                  				<input type="button" name="basket_delete" value="삭제" onclick="fn_delete(${status.index})">
                  			</td>
						</tr>
					</c:forEach>
					</tbody>
            	</table>
          	</div>
          	<div style="text-align:right">
          		<input type="button" name="select_like" value="찜하기" onclick="fn_like()">
            	<input type="button" name="all_basket_delete" value="모두삭제" onclick="fn_allDelete()">
         	</div>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</tbody>
            	</table>
          	</div>
				</c:otherwise>
			</c:choose>
          <br>
          <br>
          <div class="table-responsive">
          	<table class="table table-striped">
          		<tr>
          			<td>주문금액</td>
          			<td>
          				<input type="text" id="all_order_price" style="width:100px; text-align:right; border:none;">원
          			</td>
          			<td>- 할인금액</td>
          			<td>0 원</td>
          			<td> = 결제예정금액</td>
          			<td>
          				<input type="text" id="pay_price" value="" style="width:100px; text-align:right; border:none;"> 원
          			</td>
          		</tr>
          		<tr>
          			<td colspan="4">
          				상품금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          				<input type="text" id="all_price" style="width:80px; text-align:right; border:none;"> 원
          				<br>
          				선결제배송비 &nbsp;&nbsp;&nbsp;
          				<input type="text" id="order_fee" value="3000" style="width:80px; text-align:right; border:none;" readonly>원
          			</td>
          			<td>
          				적립혜택 <br>
          				포인트적립 
          			</td>
          			<td>
          				<input type="text" id="point" style="width:100px; text-align:right; border:none;" readonly> P
          			</td>
          		</tr>
          	</table>
          </div>
          <div style="text-align:right">
          	<input type="button" name="all_order" value="전체주문" onclick="fn_all_order()">
            <input type="button" name="select_order" value="선택상품주문" onclick="fn_select_order()">
          </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-4">
          <h2>Safari bug warning!</h2>
          <p class="text-danger">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>